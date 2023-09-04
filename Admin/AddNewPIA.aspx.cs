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
            scriptManager.RegisterPostBackControl(btnAddProject); // Register the control that triggers the postback
            BindProject();
            BindDropDownProject();


        }
        
    }
    

    private void BindProject()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT p.ProjectName, a.* from tbl_ProjectMaster p,tblActivitiesMaster a where a.Status='Active' and a.Puid=p.Puid", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvProject.DataSource = dt;
        gvProject.DataBind();
    }



    protected void btnAddProject_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_ActivityManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@Functionn", txtProject.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        BindProject();
        txtProject.Text = "";

        string script = "swal({title: 'Function Added Successful', text: '', icon: 'success', buttons: true});";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

    }

    protected void ImageButton1Select_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonView = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonView.NamingContainer;
        lblUid.Text = gvProject.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        connn.Open();

        using (SqlCommand cmddd = new SqlCommand("SELECT p.*, a.* from tbl_ProjectMaster p,tblActivitiesMaster a where a.Status='Active' and a.Puid=p.Puid and ActId= @ActId", connn))
        {
            cmddd.Parameters.AddWithValue("@ActId", lblUid.Text);

            SqlDataReader readerr = cmddd.ExecuteReader();
            if (readerr.Read())
            {
                DropDownProjectName.SelectedValue = readerr["Puid"].ToString();
                txtProject.Text = readerr["Activities"].ToString();
                btnAddProject.Visible = false;
                btnUpdateProject.Visible = true;
            }
        }
    }

    protected void btnUpdateProject_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_PIA", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@Puid", DropDownFunctionName.SelectedValue);
        cmd.Parameters.AddWithValue("@Activities", txtProject.Text);
        cmd.Parameters.AddWithValue("@ActId", lblUid.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        BindProject();
        txtProject.Text = "";
        btnAddProject.Visible = true;
        btnUpdateProject.Visible = false;
        DropDownFunctionName.SelectedValue = "0";
    }

    protected void ImageButton1Delete_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvProject.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update tbl_PIAMaster set Status='Removed' where PIAid='" + lblUid.Text + "'", conn);
        conn.Open();
        cmd.ExecuteNonQuery();

        BindProject();
        conn.Close();
    }

    private void BindDropDownProject()
    {
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tbl_functionMaster where Status='Active'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownFunctionName.DataSource = dt;
        DropDownFunctionName.DataBind();
    }
}
