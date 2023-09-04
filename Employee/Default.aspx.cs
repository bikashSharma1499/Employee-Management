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

public partial class Employee_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        totalJobCountToday();
        totalJobCount();
        lblDateToday.Text = System.DateTime.Now.ToString("dd-MM-yyyy");
        MyRating();
        LeaveApplicationCount();
        BindGridViewLeave();
    }


   private void totalJobCount()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select  count(*) as totalCount from tblDailyReportingMaster where Status= 'Active' and EmpId ='" + Session["EmpID"] +"'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblTotalJObCount.Text = reader["totalCount"].ToString();

        }
        conn.Close();
    }
    private void totalJobCountToday()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select  count(*) as totalCount from tblDailyReportingMaster where Status= 'Active' and EmpId ='" + Session["EmpID"] + "' and ReportingDate ='"+System.DateTime.Now.ToString("yyyy-MM-dd")+"' ", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblJobCountToday.Text = reader["totalCount"].ToString();

        }
        conn.Close();
    }

    private void MyRating()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select avg(ManagerRating) as rating from tblDailyReportingMaster where Status='Active' and EmpId ='" + Session["EmpID"] + "' ", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblRating.Text = reader["rating"].ToString();

        }else
        {
            lblRating.Text = "N/A";
        }
        conn.Close();
    }
    private void LeaveApplicationCount()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as LeaveAppCount from tblEmpLeaveMaster where Status='Active' and EmpId ='" + Session["EmpID"] + "' ", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblLeaveApplication.Text = reader["LeaveAppCount"].ToString();

        }
        else
        {
            lblLeaveApplication.Text = "N/A";
        }
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

    protected void btnVieLeave_Click(object sender, EventArgs e)
    {
        pnlViewLeave.Visible = true;
    }
}


