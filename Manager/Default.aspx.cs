using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;


public partial class Manager_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = System.DateTime.Today.ToString("dd-MM-yyyy");
   
        BindLeaveNotificationPending();
        BindLeaveNotificationApprov();
    }



    private void BindLeaveNotificationPending()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as total from tblEmpLeaveMaster where Status='Active' and LeaveStatus='Pending' ", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblLeaveNotificationPending.Text = reader["total"].ToString();

        }
        conn.Close();
    }

    private void BindLeaveNotificationApprov()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as total from tblEmpLeaveMaster where Status='Active' and LeaveStatus='Approved' ", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblLeaveNotificationApproved.Text = reader["total"].ToString();

        }
        conn.Close();
    }
}