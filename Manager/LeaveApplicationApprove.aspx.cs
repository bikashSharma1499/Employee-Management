using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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

        BindNewLeave();
        BindNewLeaveCount();
        BindApprovedLeaveCount();
        BindRejectedLeaveCount();
        BindAllLeaveCount();
        BindAllLeaveApplications();

    }




    private void BindNewLeave()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select e.Name,l.* from tblEmployeeMaster e , tblEmpLeaveMaster l where l.Status ='Active' and l.EmpId = e.EmpId and l.LeaveStatus='Pending'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvLeaveNew.DataSource = dt;
        gvLeaveNew.DataBind();
    }



    private void BindNewLeaveCount()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as totalNewLeave from tblEmpLeaveMaster where LeaveStatus='Pending' and Status='Active'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblNewLeaveCount.Text = reader["totalNewLeave"].ToString();

        }
        conn.Close();
    }

    protected void btnNewApplication_Click(object sender, EventArgs e)
    {
        PnlNewApplication.Visible = true;
        pnlRejectLeave.Visible = false;
        pnlApprovedLeave.Visible = false;
        pnlAllLeave.Visible = false;
    }

    protected void ImageBtnDelete_Click(object sender, ImageClickEventArgs e)
    {

    }
    private void BindApprovedLeaveCount()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as totalLeave from tblEmpLeaveMaster where LeaveStatus='Approve' and Status='Active'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblApprovedLeave.Text = reader["totalLeave"].ToString();

        }
        conn.Close();
    }
    private void BindRejectedLeaveCount()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as totalLeave from tblEmpLeaveMaster where LeaveStatus='Reject' and Status='Active'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblLeaveRejected.Text = reader["totalLeave"].ToString();

        }
        conn.Close();
    }
    private void BindAllLeaveCount()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as totalLeave from tblEmpLeaveMaster where Status='Active'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblAllLeave.Text = reader["totalLeave"].ToString();

        }
        conn.Close();
    }




    private void BindRejectedLeave()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select e.Name,l.* from tblEmployeeMaster e , tblEmpLeaveMaster l where l.Status ='Active' and l.EmpId = e.EmpId and l.LeaveStatus='Reject'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvRejected.DataSource = dt;
        gvRejected.DataBind();
    }


    protected void btnRejected_Click(object sender, EventArgs e)
    {
        PnlNewApplication.Visible = false;
        pnlRejectLeave.Visible = true;
        BindRejectedLeave();
        pnlApprovedLeave.Visible = false;
        pnlAllLeave.Visible = false;
    }

    private void BindApprovedLeave()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select e.Name,l.* from tblEmployeeMaster e , tblEmpLeaveMaster l where l.Status ='Active' and l.EmpId = e.EmpId and l.LeaveStatus='Approve'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvApproved.DataSource = dt;
        gvApproved.DataBind();
    }

    protected void btnApproved_Click(object sender, EventArgs e)
    {
        pnlApprovedLeave.Visible = true;
        BindApprovedLeave();
        pnlRejectLeave.Visible = false;
        PnlNewApplication.Visible = false;
        pnlAllLeave.Visible = false;
    }

    private void BindAllLeaveApplications()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select e.Name,l.* from tblEmployeeMaster e , tblEmpLeaveMaster l where l.Status ='Active' and l.EmpId = e.EmpId", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvAllLeave.DataSource = dt;
        gvAllLeave.DataBind();
    }

    protected void btnAllLeave_Click(object sender, EventArgs e)
    {
        BindAllLeaveApplications();
        pnlAllLeave.Visible = true;
        pnlRejectLeave.Visible = false;
        PnlNewApplication.Visible = false;
        pnlApprovedLeave.Visible = false;
    }




    protected void ViewAttachment1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUidR.Text = gvRejected.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand(" select Attachment from tblEmpLeaveMaster where Luid='" + lblUidR.Text + "'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Attachment"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }

        conn.Close();
    }

    protected void ViewAttachment3_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUidA.Text = gvApproved.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand(" select Attachment from tblEmpLeaveMaster where Luid='" + lblUidA.Text + "'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Attachment"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }

        conn.Close();
    }

    protected void ViewAttachment4_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUidAll.Text = gvAllLeave.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand(" select Attachment from tblEmpLeaveMaster where Luid='" + lblUidAll.Text + "'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Attachment"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }

        conn.Close();
    }

    protected void ViewAttachment_Click1(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid1.Text = gvLeaveNew.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand(" select Attachment from tblEmpLeaveMaster where Luid='" + lblUid1.Text + "'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Attachment"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }

        conn.Close();
    }

    protected void ImageBtnApproveLeave_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonView = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonView.NamingContainer;
        lblUidStatus.Text = gvLeaveNew.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand(" select l.*, emp.Name as empName from tblEmpLeaveMaster l, tblEmployeeMaster emp where l.Status = 'Active' and l.EmpId = emp.EmpId and l.Luid ='" + lblUidStatus.Text + "'", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblName.Text = "Employee Name : " + readerr["empName"].ToString();
            DateTime reportingDate = Convert.ToDateTime(readerr["ApplicationDate"]);
            lblAppliedDate.Text = "Applied Date : " + reportingDate.ToString("dd-MM-yyyy");

            DateTime startdate = Convert.ToDateTime(readerr["StartDate"]);
            lblStartDate.Text = "Start Date : " + startdate.ToString("dd-MM-yyyy");

            DateTime endDate = Convert.ToDateTime(readerr["EndDate"]);
            lblEndDate.Text = "End Date : " + endDate.ToString("dd-MM-yyyy");

            lblReason.Text = "Reason  : " + readerr["Reason"].ToString();



        }
        connn.Close();
    }

    
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
        BindNewLeave();
    }

    protected void UpdateStatusLeave_Click1(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["HMS"].ConnectionString;
        string updateQuery = "UPDATE tblEmpLeaveMaster SET LeaveComment = @LeaveComment , LeaveStatus = @LeaveStatus WHERE  Luid = @Luid";

        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                {
                    cmd.Parameters.AddWithValue("@LeaveComment", txtComment.Text);
                    cmd.Parameters.AddWithValue("@LeaveStatus", DropDownAction.SelectedValue);
                    cmd.Parameters.AddWithValue("@Luid", lblUidStatus.Text);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        DropDownAction.Enabled = false;
                        lblMsg.Text = "Successfully Updated";
                    }
                    else
                    {
                        lblMsg.Text = "Update failed";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Handle the exception appropriately, e.g., log it or display an error message.
            lblMsg.Text = "An error occurred: " + ex.Message;
        }
    }
}


