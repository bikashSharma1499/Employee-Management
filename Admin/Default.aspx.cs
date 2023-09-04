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

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGvTopEmployee();
        BindLabelTotalEmployee();
        BindLabelEmployeeOnLeave();
        BindLabelEmployeeWorking();
        BindTopActivities();
    }


    private void BindGvTopEmployee()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select e.*, r.ManagerRating from  tblDailyReportingMaster r , tblEmployeeMaster e where r.EmpId = e.EmpId and r.Status='Active' and e.Status='Active' order by r.ManagerRating desc ", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvTopEmployee.DataSource = dt;
        gvTopEmployee.DataBind();
    }
    private void BindLabelTotalEmployee()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select count(*) as totalEmp from tblEmployeeMaster where Status='Active'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblTotalEmp.Text = reader["totalEmp"].ToString();

        }
        conn.Close();
    }
    private void BindLabelEmployeeOnLeave()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as totalLeave  from tblEmployeeMaster where Status='Active' and WorkingStatus='Yes'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblEmpOnLeave.Text = reader["totalLeave"].ToString();

        }
        conn.Close();
    }



    private void BindLabelEmployeeWorking()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Count(*) as totalWorking from tblEmployeeMaster where Status='Active' and WorkingStatus='No'", conn);
        conn.Open();

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblEmpWorking.Text = reader["totalWorking"].ToString();

        }
        conn.Close();
    }

    private void BindTopActivities()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["HMS"].ConnectionString; // Get the connection string from Web.config
        string query = "SELECT TOP 5 r.*,p.ProjectName, emp.Name FROM tblDailyReportingMaster r , tbl_ProjectMaster p, tblEmployeeMaster emp where r.Status='Active' and r.Puid=p.Puid and r.EmpId = emp.EmpId and r.ReportingDate='"+System.DateTime.Today.ToString("yyyy-MM-dd")+"' ORDER BY r.RUid DESC"; // Modify the query as needed

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        rptActivities.DataSource = reader;
                        rptActivities.DataBind();
                    }
                }
            }
        }
    }
}
