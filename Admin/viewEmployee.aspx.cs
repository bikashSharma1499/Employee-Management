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

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEmployeeDetails();
        }
    }
    
   
    

   

    private void BindEmployeeDetails()
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
    SqlCommand cmd = new SqlCommand("select * from tblEmployeeMaster where Status='Active' order by EmpId", con);
    SqlDataAdapter sda = new SqlDataAdapter(cmd);
    DataTable dt = new DataTable();
    sda.Fill(dt);
    gvEmployee.DataSource = dt;
    gvEmployee.DataBind();
}

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvEmployee.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update tblEmployeeMaster set Status='Removed' where EmpId='" + lblUid.Text + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        BindEmployeeDetails();
    }

   

    protected void txtSearh_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM tblEmployeeMaster WHERE Status = 'Active' AND (Name LIKE @Name OR Mobile LIKE @Mobile) ORDER BY EmpId", con);

        // Define the parameters for the @Name and @Mobile placeholders
        cmd.Parameters.AddWithValue("@Name", "%" + txtSearh.Text + "%"); // Assuming you want to use the value from a TextBox named txtSearch
        cmd.Parameters.AddWithValue("@Mobile", "%" + txtSearh.Text + "%"); // Assuming you want to use the same value for both Name and Mobile searches

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvEmployee.DataSource = dt;
        gvEmployee.DataBind();

    }

    protected void btnSearch_Click1(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM tblEmployeeMaster WHERE Status = 'Active' AND (Name LIKE @Name OR Mobile LIKE @Mobile) ORDER BY EmpId", con);

        // Define the parameters for the @Name and @Mobile placeholders
        cmd.Parameters.AddWithValue("@Name", "%" + txtSearh.Text + "%"); // Assuming you want to use the value from a TextBox named txtSearch
        cmd.Parameters.AddWithValue("@Mobile", "%" + txtSearh.Text + "%"); // Assuming you want to use the same value for both Name and Mobile searches

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvEmployee.DataSource = dt;
        gvEmployee.DataBind();
    }
}