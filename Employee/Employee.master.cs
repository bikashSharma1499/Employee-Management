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

public partial class Employee_Employee : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["EmpID"] != null)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from tblEmployeeMaster where Status='Active' and EmpId = @EmpId", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"].ToString());
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblName.Text = reader["Name"].ToString();
                lblName2.Text = reader["Name"].ToString();
            }
            conn.Close();
        }
        else
        {
            Session["EmpId"] = null;
            Response.Redirect("../");
        }
    }
}
