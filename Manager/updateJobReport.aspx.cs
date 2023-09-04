using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            txtReportDate.Text = System.DateTime.Today.ToString("dd-MM-yyyy");
            BindGridViewUpdateReport();
           
        }
    }


    private void BindGridViewUpdateReport()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand(" SELECT r.*, pr.ProjectName as PrName, fn.Functionn as func, act.Activities as Act, pia.Name as piaName, emp.Name as empName    FROM tblDailyReportingMaster r, tbl_ProjectMaster pr, tbl_functionMaster fn, tblActivitiesMaster act, tbl_PIAMaster pia, tblEmployeeMaster emp  Where r.Status = 'Active' and r.EmpId = emp.EmpId and r.Puid = pr.Puid and  r.Fuid = fn.Fuid and r.Activities = act.ActId and r.PIAid = pia.PIAid and r.ReportingDate = '" + Convert.ToDateTime(txtReportDate.Text).ToString("yyyy-MM-dd") + "' order by r.RUid desc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvReport.DataSource = dt;
        gvReport.DataBind();
    }

    protected void txtReportDate_TextChanged(object sender, EventArgs e)
    {
        BindGridViewUpdateReport();
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    //public string lblMrValue; //


    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton ImageButtonView = sender as ImageButton;
    //    GridViewRow GvRow = (GridViewRow)ImageButtonView.NamingContainer;
    //    lblUid.Text = gvReport.DataKeys[GvRow.RowIndex].Value.ToString();
    //    SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
    //    SqlCommand cmddd = new SqlCommand(" select rp.*, emp.Name as empName from tblDailyReportingMaster rp, tblEmployeeMaster emp where rp.Status = 'Active' and rp.EmpId = emp.EmpId and rp.RUid ='" + lblUid.Text + "'", connn);
    //    connn.Open();
    //    SqlDataReader readerr = cmddd.ExecuteReader();
    //    if (readerr.Read())
    //    {
    //        lblName.Text ="Project Name : "+ readerr["empName"].ToString();
    //        DateTime reportingDate = Convert.ToDateTime(readerr["ReportingDate"]);
    //        lblDate.Text ="Reporting Date : "+ reportingDate.ToString("dd-MM-yyyy");

    //        lblStartTime.Text ="Start Time : "+ readerr["StartTime"].ToString();
    //        lblEndTime.Text ="End Time : "+ readerr["EndTime"].ToString();
    //        lblMr1.Text = readerr["ManagerRating"].ToString();

    //        string ratestatus = readerr["RateStatus"].ToString();
    //        if(ratestatus == "Rated")
    //        {
    //            DropDownManagerRating.SelectedValue = Convert.ToInt32(readerr["ManagerRating"]).ToString();
    //            DropDownManagerRating.Enabled = false;
    //            BtnRatingManager.Visible = false;
    //            btnEdit.Visible = true;
    //        }

    //    }
    //    connn.Close();


    //}


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonView = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonView.NamingContainer;
        lblUid.Text = gvReport.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        connn.Open();

        using (SqlCommand cmddd = new SqlCommand("SELECT rp.*, emp.Name AS empName FROM tblDailyReportingMaster rp, tblEmployeeMaster emp WHERE rp.Status = 'Active' AND rp.EmpId = emp.EmpId AND rp.RUid = @Uid", connn))
        {
            cmddd.Parameters.AddWithValue("@Uid", lblUid.Text);

            SqlDataReader readerr = cmddd.ExecuteReader();
            if (readerr.Read())
            {
                lblName.Text = "Project Name: " + readerr["empName"].ToString();
                DateTime reportingDate = Convert.ToDateTime(readerr["ReportingDate"]);
                lblDate.Text = "Reporting Date: " + reportingDate.ToString("dd-MM-yyyy");

                lblStartTime.Text = "Start Time: " + readerr["StartTime"].ToString();
                lblEndTime.Text = "End Time: " + readerr["EndTime"].ToString();
                lblMr1.Text = readerr["EmpId"].ToString();

                string ratestatus = readerr["RateStatus"].ToString();
                if (ratestatus == "Rated")
                {
                    DropDownManagerRating.SelectedValue = Convert.ToInt32(readerr["ManagerRating"]).ToString();
                    DropDownManagerRating.Enabled = false;
                    BtnRatingManager.Visible = false;
                    btnEdit.Visible = true;
                }

                // After reading the data, you can call a method to calculate the average manager rating.
                CalculateAverageManagerRating(lblMr1.Text, reportingDate);
            }
        }

        connn.Close();
    }

    protected void BtnRatingManager_Click(object sender, EventArgs e)
    {
        string empId = lblMr1.Text;
        DateTime reportingDate = DateTime.ParseExact(lblDate.Text.Replace("Reporting Date: ", ""), "dd-MM-yyyy", CultureInfo.InvariantCulture); // Parse the date
        string connectionString = ConfigurationManager.ConnectionStrings["HMS"].ConnectionString;
        string updateQuery = "UPDATE tblDailyReportingMaster SET ManagerRating = @ManagerRating, RateStatus='Rated' WHERE Status = 'Active' AND RUid = @RUid";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(updateQuery, con))
            {
                cmd.Parameters.AddWithValue("@ManagerRating", DropDownManagerRating.SelectedValue);
                cmd.Parameters.AddWithValue("@RUid", lblUid.Text);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    DropDownManagerRating.Enabled = false;
                    lblMsg.Text = "Successfully Updated";

                    // Update the lblMr label with the average manager rating
                    CalculateAverageManagerRating(empId, reportingDate);
                    btnEdit.Visible = true;
                    BtnRatingManager.Visible = false;
                    BindGridViewUpdateReport();
                }
                else
                {
                    lblMsg.Text = "Update failed";
                }
            }
        }
    }


    private void MarkAttendance(string empId, DateTime reportingDate)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@StaffUid", Session["StaffUid"].ToString());
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblName.Text = reader["Name"].ToString();
           
        }
       conn.Close();
    

}

    private void CalculateAverageManagerRating(string empId, DateTime reportingDate)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        conn.Open();

        using (SqlCommand cmd = new SqlCommand("SELECT AVG(ManagerRating) AS avg FROM tblDailyReportingMaster WHERE EmpId = @EmpId AND ReportingDate = @ReportingDate AND Status = 'Active'", conn))
        {
            cmd.Parameters.AddWithValue("@EmpId", empId);
            cmd.Parameters.AddWithValue("@ReportingDate", reportingDate.ToString("yyyy-MM-dd"));

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblMr.Text = reader["avg"] != DBNull.Value ? reader["avg"].ToString() : "N/A"; // Handle null value
            }
            else
            {
                lblMr.Text = "N/A"; // No records found
            }
        }

        conn.Close();
    }


    //private void CalculateAverageManagerRating(string empId, DateTime reportingDate)
    //{
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
    //    conn.Open();

    //    using (SqlCommand cmd = new SqlCommand("SELECT AVG(ManagerRating) AS avg FROM tblDailyReportingMaster WHERE EmpId = @EmpId AND ReportingDate = @ReportingDate AND Status = 'Active'", conn))
    //    {
    //        cmd.Parameters.AddWithValue("@EmpId", empId);
    //        cmd.Parameters.AddWithValue("@ReportingDate", reportingDate.ToString("yyyy-MM-dd"));

    //        SqlDataReader reader = cmd.ExecuteReader();
    //        if (reader.Read())
    //        {
    //            lblMr.Text = reader["avg"].ToString();
    //        }
    //    }

    //    conn.Close();
    //}




    //protected void BtnRatingManager_Click(object sender, EventArgs e)
    //{
    //    string empId = lblMr1.Text; DateTime date = lblDate.Text;
    //    string connectionString = ConfigurationManager.ConnectionStrings["HMS"].ConnectionString;
    //    string updateQuery = "UPDATE tblDailyReportingMaster SET ManagerRating = @ManagerRating , RateStatus='Rated' WHERE Status = 'Active' AND RUid = @RUid";

    //    using (SqlConnection con = new SqlConnection(connectionString))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(updateQuery, con))
    //        {
    //            cmd.Parameters.AddWithValue("@ManagerRating", DropDownManagerRating.SelectedValue);
    //            cmd.Parameters.AddWithValue("@RUid", lblUid.Text);

    //            con.Open();
    //            int rowsAffected = cmd.ExecuteNonQuery();

    //            if (rowsAffected > 0)
    //            {
    //                DropDownManagerRating.Enabled = false;
    //                lblMsg.Text = "Successfully Updated";
    //                CalculateAverageManagerRating(string empId, DateTime reportingDate);


    //            }
    //            else
    //            {
    //                lblMsg.Text = "Update failed";

    //            }
    //        }
    //    }
    //}


    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DropDownManagerRating.Enabled = true;
        BtnRatingManager.Visible = true;
        btnEdit.Visible = false;
    }
}