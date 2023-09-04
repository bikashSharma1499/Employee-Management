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
            ScriptManager scriptManager = ScriptManager.GetCurrent(this);
            scriptManager.RegisterPostBackControl(btnRegister); // Register the control that triggers the postback
            BindEmployeeDetails();
            clearInput();

        }
    }


    protected void btnRegister_Click(object sender, EventArgs e)
    {

        string Pass = CreateRandomPassword(8);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_EmployeeManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@Name", txtEmpName.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
        cmd.Parameters.AddWithValue("@Mobile2", txtMobile2.Text);
        cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
        cmd.Parameters.AddWithValue("@Designation", DropDownDesignation.SelectedValue);
        cmd.Parameters.AddWithValue("@WorkExp", DropDownListExp.SelectedValue);
        cmd.Parameters.AddWithValue("@DateBirth", Convert.ToDateTime(txtDOB.Text));
        cmd.Parameters.AddWithValue("@DateJoining", Convert.ToDateTime(txtJoinDate.Text));
        cmd.Parameters.AddWithValue("@GuardianName", txtGuardianName.Text);
        cmd.Parameters.AddWithValue("@GuadianMobile", txtGmobile.Text);
        cmd.Parameters.AddWithValue("@AadharNumber", txtAdharNo.Text);
        cmd.Parameters.AddWithValue("@PresentAddress", txtPermanetAdd.Text);
        cmd.Parameters.AddWithValue("@PermanentAddress", txtGuardianName.Text);
        cmd.Parameters.AddWithValue("@LoginPass", Pass);
        //string filenamepost = Path.GetFileName(FileUpload1Phtoto.PostedFile.FileName);
        //FileUpload1Phtoto.SaveAs(Server.MapPath("/Photo/" + txtFullName.Text + filenamepost));
        //cmd.Parameters.AddWithValue("@Photo", "/Photo/" + txtFullName.Text + filenamepost);
        //cmd.Parameters.AddWithValue("@RespondStatus", "Pending");
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        clearInput();
        BindEmployeeDetails();
        string script = "swal({title: 'Employee Registration Successful', text: '', icon: 'success', buttons: true});";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);


        //string script = "$swal({{title: 'Employee Registration Successful', text: 'User Id: {txtEmail.Text}  Password: {Pass}', icon: 'success', buttons: true}})";
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

    }



    public static string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }


    private void clearInput()
    {
        txtEmpName.Text = ""; txtEmail.Text = ""; DropDownListGender.SelectedValue = "0";
        txtMobile.Text = ""; txtMobile2.Text = ""; DropDownDesignation.SelectedValue = "0";
        txtDOB.Text = ""; txtJoinDate.Text = ""; DropDownListExp.SelectedValue = "0";
        txtGuardianName.Text = ""; txtGmobile.Text = ""; txtAdharNo.Text = "";
        txtPermanetAdd.Text = ""; txtGuardianName.Text = "";
    }


    private void BindEmployeeDetails()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Top 5 * from tblEmployeeMaster where Status='Active' order by EmpId desc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvEmployee.DataSource = dt;
        gvEmployee.DataBind();
    }




   


    protected void imgDelete_Click(object sender, ImageClickEventArgs e)
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
}