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
        if (!IsPostBack)
        {
            txtReportDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

            BindProjectName();
            BindFunction();
            BindPIA();
            BindActivity();
            BindReportDetails();
            DropDownActivity.Enabled = false;
            DropDownListPIA.Enabled = false;

        }

    }



    protected void btnReport_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_ReportManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"]);
        cmd.Parameters.AddWithValue("@ReportingDate", Convert.ToDateTime(txtReportDate.Text));
        cmd.Parameters.AddWithValue("@Puid", DropDownProjectName.SelectedValue);
        cmd.Parameters.AddWithValue("@Fuid", DropDownListFunction.SelectedValue);
        cmd.Parameters.AddWithValue("@Activities", DropDownActivity.SelectedValue);
        cmd.Parameters.AddWithValue("@PIAid", DropDownListPIA.SelectedValue);
  
        cmd.Parameters.AddWithValue("@Description ", txtDecription.Text);
        cmd.Parameters.AddWithValue("@StartTime ", txtStartTime.Text);
        cmd.Parameters.AddWithValue("@EndTime ", txtEndTime.Text);
        cmd.Parameters.AddWithValue("@SelfRating", DropDownRating.SelectedValue);
        cmd.Parameters.AddWithValue("@Nos", 1);
        string filenamepost = Path.GetFileName(FileUpload1.PostedFile.FileName);
        FileUpload1.SaveAs(Server.MapPath("/Attachments/" + txtReportDate.Text + filenamepost));
        cmd.Parameters.AddWithValue("@Attachment", "/Attachments/" + txtReportDate.Text + filenamepost);
       
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();

        conn.Close();
        string script = "swal({title: 'Successfully Submitted', text: '', icon: 'success', timer:2000, buttons: true});";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);



        clearInput();
        BindReportDetails();
    }


    private void clearInput()
    {
        txtReportDate.Text = ""; DropDownProjectName.SelectedValue = "0"; DropDownListFunction.SelectedValue = "0";
        DropDownActivity.SelectedValue = "0"; ; DropDownListPIA.SelectedValue = "0";
        txtDecription.Text = ""; txtStartTime.Text = "";
        txtEndTime.Text = ""; DropDownRating.Text = "";
    }


    private void BindProjectName()
    {

        DropDownProjectName.Items.Clear();
        DropDownProjectName.Items.Insert(0, new ListItem("Select", "0"));
        DropDownProjectName.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select  * from tbl_ProjectMaster where Status='Active'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownProjectName.DataSource = dt;
        DropDownProjectName.DataBind();
        DropDownProjectName.Enabled = true;

    }


    private void BindFunction()
    {

        DropDownListFunction.Items.Clear();
        DropDownListFunction.Items.Insert(0, new ListItem("Select", "0"));
        DropDownListFunction.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tbl_functionMaster where Status ='Active'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListFunction.DataSource = dt;
        DropDownListFunction.DataBind();
        DropDownListFunction.Enabled = true;

    }





    private void BindPIA()
    {

        DropDownListPIA.Items.Clear();
        DropDownListPIA.Items.Insert(0, new ListItem("Select", "0"));
        DropDownListPIA.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select* from tbl_PIAMaster where Status='Active' and Fuid='"+DropDownListFunction.SelectedValue +"'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListPIA.DataSource = dt;
        DropDownListPIA.DataBind();
        DropDownListPIA.Enabled = true;

    }






    private void BindActivity()
    {

        DropDownActivity.Items.Clear();
        DropDownActivity.Items.Insert(0, new ListItem("Select", "0"));
        DropDownActivity.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select* from tblActivitiesMaster where Status='Active' and Puid ='"+ DropDownProjectName.SelectedValue +"' ", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownActivity.DataSource = dt;
        DropDownActivity.DataBind();
        DropDownActivity.Enabled = true;

    }

    protected void DropDownProjectName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownProjectName.SelectedValue == "0")
        {
            DropDownActivity.SelectedValue = "0";
            DropDownActivity.Enabled = false;
           
        }else
        {
            DropDownActivity.Enabled = true;
            BindActivity();
        }
    }

    protected void DropDownListFunction_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownListFunction.SelectedValue == "0")
        {
            DropDownListPIA.SelectedValue = "0";
            DropDownListPIA.Enabled = false;
        }else
        {
            DropDownListPIA.Enabled = true;
            BindPIA();
        }
    }

    private void BindReportDetails()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select r.*, p.ProjectName,f.Functionn,pia.Name as piaName, act.Activities as Act from tblDailyReportingMaster r, tbl_ProjectMaster p, tbl_functionMaster f, tbl_PIAMaster pia, tblActivitiesMaster act where r.Status ='Active' and r.Puid = p.Puid and r.Fuid = f.Fuid and r.PIAid=pia.PIAid and r.Activities =act.ActId and EmpId=' " + Session["EmpId"] + "'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvEmployee.DataSource = dt;
        gvEmployee.DataBind();
    }

    protected void btnAttachment_Click(object sender, EventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvEmployee.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select Attachment from tblDailyReportingMaster  where RUid='" + lblUid.Text + "'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Attachment"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }
        
        conn.Close();
    }

    //protected void gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
    //{

    //    string oldValue = string.Empty;
    //    string newValue = string.Empty;
    //    for (int j = 2; j < 8; j++)
    //    {
    //        for (int count = 0; count < gvEmployee.Rows.Count; count++)
    //        {
    //            oldValue = gvEmployee.Rows[count].Cells[j].Text;
    //            if (oldValue == newValue)
    //            {
    //                gvEmployee.Rows[count].Cells[j].Text = string.Empty;
    //            }
    //            newValue = oldValue;
    //        }
    //    }
    //}

    protected void ImageButton1Delete_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvEmployee.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update tblDailyReportingMaster set Status='Removed' where RUid='" +lblUid.Text + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        BindReportDetails();
    }


    protected void txtSelectReportDate_TextChanged(object sender, EventArgs e)
    {

    }
}


