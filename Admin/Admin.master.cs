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

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StaffUid"] != null)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from tblStaffMaster where Status='Active' and StaffUid = @StaffUid", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@StaffUid", Session["StaffUid"].ToString());
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
            Session["StaffUid"] = null;
            Response.Redirect("../");
        }

    }
}
