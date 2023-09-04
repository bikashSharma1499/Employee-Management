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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void loginBtn_Click(object sender, EventArgs e)
    {



        if (DropDownListUser.SelectedValue == "Employee")
        {
            using (SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
            {
                string query = "SELECT * FROM tblEmployeeMaster WHERE Status = 'Active' AND Email = @Email AND LoginPass = @LoginPass";
                SqlCommand cmddd = new SqlCommand(query, connn);
                cmddd.Parameters.AddWithValue("@Email", txtUser.Text);
                cmddd.Parameters.AddWithValue("@LoginPass", txtPass.Text);

                connn.Open();
                using (SqlDataReader readerr = cmddd.ExecuteReader())
                {
                    if (readerr.Read())
                    {
                        Session["EmpID"] = readerr["EmpID"].ToString();
                        Response.Redirect("Employee/");
                    }
                    else
                    {
                        string script = "swal({title: 'Invalid', text: 'Wrong username or Password', icon: 'error', timer:2000, buttons: true});";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                }
            }
        }

    
       else if(DropDownListUser.SelectedValue == "Admin")
        {

            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmddd = new SqlCommand("select * from tblStaffMaster where Status='Active' and Email=@Email and Password=@Password ", connn);
            cmddd.Parameters.AddWithValue("@Email", txtUser.Text);
            cmddd.Parameters.AddWithValue("@Password", txtPass.Text);
            connn.Open();
            SqlDataReader readerr = cmddd.ExecuteReader();
            if (readerr.Read())
            {
                Session["StaffUid"] = readerr["StaffUid"].ToString();
                Response.Redirect("Admin/");
            }else
            {
                string script = "swal({title: 'Invalid', text: 'Wrong username or Password', icon: 'error', timer:2000, buttons: true});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

            }
            connn.Close();
        }else if(DropDownListUser.SelectedValue == "Manager")
        {
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmddd = new SqlCommand("select * from tblStaffMaster where Status='Active' and Email=@Email and Password=@Password ", connn);
            cmddd.Parameters.AddWithValue("@Email", txtUser.Text);
            cmddd.Parameters.AddWithValue("@Password", txtPass.Text);
            connn.Open();
            SqlDataReader readerr = cmddd.ExecuteReader();
            if (readerr.Read())
            {
                Session["StaffUid"] = readerr["StaffUid"].ToString();
                Response.Redirect("Manager/");
            }
            else
            {
                string script = "swal({title: 'Invalid', text: 'Wrong username or Password', icon: 'error', timer:2000, buttons: true});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

            }
            connn.Close();

           
        }

    }


}