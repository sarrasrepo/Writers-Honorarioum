using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.Common;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Web.Script.Services;
using System.Web.Configuration;
using System.Web.Services;

public partial class LineageSalaryPro : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    private ReportDocument report = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
        if (this.Session["userGrp"].ToString() != "Admin")
        {
            lnkBack.Visible = false;
        }

        lblUser.Text = "Wel Come: " + this.Session["UserName"].ToString();
        clsHelper.CheckLogin();
        
        chkRegularSalary.Checked = true;
        chkLine.Checked = true;
        chkPhoto.Checked = true;


    }
    protected void btnProcess_Click(object sender, EventArgs e)
    {        
        //string createdBy = this.Session["UserName"].ToString();

        string strInsert = "Exec spLineagebill '" +txtTransDate.Text+"',  '"+chkRegularSalary.Checked+ "'  , '"  +chkLine.Checked + "', '" +chkPhoto.Checked+ "' ";
        dataProvider.ExecuteCommand(strInsert);

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Process Complete...');", true);

        clearfield();

        }

    private void clearfield()
    {
        txtTransDate.Text = "";
    }
}