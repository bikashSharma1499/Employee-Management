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
            BindEmployeeDetails();
        }

    }

    private void BindEmployeeDetails()
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
    SqlCommand cmd = new SqlCommand("select r.*, p.ProjectName,f.Functionn,pia.Name from tblDailyReportingMaster r, tbl_ProjectMaster p, tbl_functionMaster f, tbl_PIAMaster pia where r.Status ='Active' and r.Puid = p.Puid and r.Fuid = f.Fuid and r.PIAid=pia.PIAid and EmpId=' " + Session["EmpId"] + "'", con);
    SqlDataAdapter sda = new SqlDataAdapter(cmd);
    DataTable dt = new DataTable();
    sda.Fill(dt);
    gvEmployee.DataSource = dt;
    gvEmployee.DataBind();
}

protected void btnAttachment_Click(object sender, EventArgs e)
{
    LinkButton ImageButtonPrint = sender as LinkButton;
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

protected void gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
{

    string oldValue = string.Empty;
    string newValue = string.Empty;
    for (int j = 1; j < 4; j++)
    {
        for (int count = 0; count < gvEmployee.Rows.Count; count++)
        {
            oldValue = gvEmployee.Rows[count].Cells[j].Text;
            if (oldValue == newValue)
            {
                gvEmployee.Rows[count].Cells[j].Text = string.Empty;
            }
            newValue = oldValue;
        }
    }
}
}
