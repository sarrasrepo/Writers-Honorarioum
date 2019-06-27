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

public partial class rptLineageSalarySlip : System.Web.UI.Page
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
               
        //chkRegularSalary.Checked = true;
        //chkLine.Checked = true;
        //chkPhoto.Checked = true;


    }
    protected void btnPreview_Click(object sender, EventArgs e)
    {
        string strVendor = "";
        if (txtVendorFrom.Text != "")
        {
            strVendor = "and VENDORID between '" + txtVendorFrom.Text + "' and '" + txtVendorTo.Text + "' ";
        }

        string strSelect = "";
        strSelect = "Select * from VLNSALARY where TRANSDATE  between '" + txtTransDateFrom.Text + "' and '" + txtTransDateTo.Text + "' ";
        strSelect = strSelect + strVendor;

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "VLNSALARY");
        

        if (ddlReportName.SelectedItem.Text == "Pay Slip")
        {    
            report.Load(Server.MapPath("Report\\Pay_slipNew.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("sa", "erp", "192.168.10.70", "ALOCIR");

            report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/Pay_slipNew.pdf"));
            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/Pay_slipNew.pdf');popup.focus();", true);
        }

        else
        {
            report.Load(Server.MapPath("Report\\CLP.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("sa", "erp", "192.168.10.70", "ALOCIR");

            report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/CLP.pdf"));
            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/CLP.pdf');popup.focus();", true);
        }
        //string SQLStr;
        ////string SQLStrLineAge;
        //string SQLStrSalary;

        //SQLStr = "";

        //SQLStrSalary = "Select * from VLNSALARY where TRANSDATE  between '" + txtTransDateFrom.Text + "' and '" + txtTransDateTo.Text + "' ";
        ////SQLStrLineAge = "Select * from View_LineageBill where TRANSDATE  between '" + txtTransDateFrom.Text + "' and '" + txtTransDateTo.Text + "' and status<>'Delete'  ";
        
        //if (txtVendorFrom.Text != "")
        //{
        //    SQLStr = "and VENDORID between '" + txtVendorFrom.Text + "' and '" + txtVendorTo.Text + "' ";
        //}
        
        //SQLStrSalary = SQLStrSalary + SQLStr;
        ////SQLStrLineAge = SQLStrLineAge + SQLStr;

        //DataSet dsSalary = new DataSet();
        ////DataSet ds = new DataSet();

        //dsSalary = dataProvider.getDataSet(SQLStrSalary, "VLNSALARY");
        ////ds = dataProvider.getDataSet(SQLStrLineAge, "View_LineageBill");
        
        //report.Load(Server.MapPath("Report\\Pay_slipNew.rpt"));
        //report.Refresh();
        //report.SetDataSource(dsSalary);
        ////report.Subreports["LineageBill.rpt"].SetDataSource(ds);        
        //report.SetDatabaseLogon("sa", "erp", "192.168.10.75", "ALOCIR");

        //report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/Pay_slipNew.pdf"));
        //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/Pay_slipNew.pdf');popup.focus();", true);
        
        ////Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Process Complete...');", true);

        ////clearfield();                
        
    }

    private void clearfield()
    {
        txtVendorFrom.Text = "";
        txtVendorTo.Text = "";
        txtVendorFrom.Text = "";
        txtVendorTo.Text = "";
    }

    protected void grdVendor_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridView HeaderGrid = (GridView)sender;
            GridViewRow HeaderGridRow =
            new GridViewRow(0, 0, DataControlRowType.Header,
            DataControlRowState.Insert);

            HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#DBDACE");
            HeaderGridRow.ForeColor = System.Drawing.Color.Black;

            TableCell HeaderCell = new TableCell();

            HeaderCell = new TableCell();
            HeaderCell.Text = "Edit";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "ID";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            //HeaderCell = new TableCell();
            //HeaderCell.Text = "NAME";
            //HeaderCell.Font.Name = " Verdana";
            //HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            ////HeaderCell.ColumnSpan = 2;
            //HeaderGridRow.Cells.Add(HeaderCell);
            ////HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "NAME";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;
            grdVendor.Controls[0].Controls.AddAt
           (0, HeaderGridRow);

        }
    }

    protected void grdVendorTo_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridView HeaderGrid = (GridView)sender;
            GridViewRow HeaderGridRow =
            new GridViewRow(0, 0, DataControlRowType.Header,
            DataControlRowState.Insert);

            HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#DBDACE");
            HeaderGridRow.ForeColor = System.Drawing.Color.Black;

            TableCell HeaderCell = new TableCell();

            HeaderCell = new TableCell();
            HeaderCell.Text = "Edit";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "ID";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            //HeaderCell = new TableCell();
            //HeaderCell.Text = "NAME";
            //HeaderCell.Font.Name = " Verdana";
            //HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            ////HeaderCell.ColumnSpan = 2;
            //HeaderGridRow.Cells.Add(HeaderCell);
            ////HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "NAME";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;
            grdVendorTo.Controls[0].Controls.AddAt
           (0, HeaderGridRow);

        }
    }
    private void FindVendor()
    {
        txtVSearch.Text = "";
        // string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,ltrim(VENDNAME) as VENDNAME from View_APVEN";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from View_APVEN where USERNAME='" + this.Session["UserName"].ToString() + "'";
        string strSelect = "select top 100 VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CLP%' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();
        
    }
    private void FindVendorTo()
    {
        txtVToSearch.Text = "";
        // string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,ltrim(VENDNAME) as VENDNAME from View_APVEN";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from View_APVEN where USERNAME='" + this.Session["UserName"].ToString() + "'";
        string strSelect = "select top 100 VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CLP%' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendorTo.DataSource = ds;
        grdVendorTo.DataBind();

    }

    protected void btnFinder_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        FindVendor();
    }
    protected void btnFinderTo_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinderTo();", true);
        FindVendorTo();
    }

    protected void grdVendor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        VendorPopulateLabelsByRowIndex(rowIndex);
    }
    protected void grdVendorTo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        VendorToPopulateLabelsByRowIndex(rowIndex);
    }

    private void VendorPopulateLabelsByRowIndex(int rowIndex)
    {        
        //txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        txtVendorFrom.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        txtVendorTo.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        //loadData();
        //btnPrint.Visible = true;
    }
    private void VendorToPopulateLabelsByRowIndex(int rowIndex)
    {
        //txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        //txtVendorFrom.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        txtVendorTo.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDivTo();", true);
        //loadData();
        //btnPrint.Visible = true;
    }
    protected void txtVSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN  where  (VENDORID like '%" + txtVSearch.Text + "%' OR VENDNAME like '%" + txtVSearch.Text + "%' OR EMAIL2 like '%" + txtVSearch.Text + "%')";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();

    }
    protected void txtVToSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinderTo();", true);
        string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN  where  (VENDORID like '%" + txtVSearch.Text + "%' OR VENDNAME like '%" + txtVSearch.Text + "%' OR EMAIL2 like '%" + txtVSearch.Text + "%')";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendorTo.DataSource = ds;
        grdVendorTo.DataBind();

    }

}