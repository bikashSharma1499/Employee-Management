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

public partial class Employee_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["EmpID"] != null)
        {
            if (!IsPostBack)
            {
                txtApplicationDate.Text = System.DateTime.Today.ToString("dd-MM-yyyy");
                txtStartDate.Text = System.DateTime.Today.ToString("dd-MM-yyyy");
                txtEndDate.Text = System.DateTime.Today.ToString("dd-MM-yyyy");
                BindGridViewLeave();
            }
        }

        
      
    }



    protected void btnLeaveApply_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_LeaveManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"]);
        cmd.Parameters.AddWithValue("@ApplicationDate", Convert.ToDateTime(txtApplicationDate.Text));
        cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text));
        cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtEndDate.Text));
        cmd.Parameters.AddWithValue("@LeaveType", DropDownLeaveType.SelectedValue);
        cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
        cmd.Parameters.AddWithValue("@LeaveStatus","Pending");
        string filenamepost = Path.GetFileName(FileUpload1.PostedFile.FileName);
        FileUpload1.SaveAs(Server.MapPath("/Attachments/" + Session["EmpId"]+ txtStartDate.Text + filenamepost));
        cmd.Parameters.AddWithValue("@Attachment", "/Attachments/" + Session["EmpId"] + txtStartDate.Text + filenamepost);

        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();

        conn.Close();
        string leaveId= GenerateLeaveID();
        lblMsg.Text ="Leave Applied Successfully your Leave Application number is " + leaveId;
        lblMsg.CssClass = "alert alert-success";
        BindGridViewLeave();


    }

    private void clear()
    {
        DropDownLeaveType.SelectedValue = "0";txtReason.Text = ""; 
    }


    private string GenerateLeaveID()
    {
        string leaveID = "";

        // Assuming you have already imported the necessary namespaces

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
        {
            conn.Open();

            using (SqlCommand cmd = new SqlCommand("sp_LeaveManagement", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Count");

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        leaveID = reader["total"].ToString();
                    }
                }
            }
        }

        return leaveID;
    }


    protected void ImageBtnDelete_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvLeave.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update tblEmpLeaveMaster set Status='Removed' where Luid='"+lblUid.Text+"'", conn);
        conn.Open();
        cmd.ExecuteNonQuery();
       
        BindGridViewLeave();
        conn.Close();
    }


    private void BindGridViewLeave()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from tblEmpLeaveMaster where Status='Active' and  EmpId='" + Session["EmpID"] + "'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvLeave.DataSource = dt;
        gvLeave.DataBind();
    }
}
