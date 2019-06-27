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

public partial class WritersBill : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    private ReportDocument report = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinddlPageName();
            btnEdit.Visible = false;
            btnDelete.Visible = false;
            btnPrint.Visible = false;
            btnNew.Visible = false;
            btnConfirm.Visible = false;
        }

        if (this.Session["userGrp"].ToString() != "Admin")
        {
            lnkBack.Visible = false;
        }

        lblUser.Text ="Wel Come: "+ this.Session["UserName"].ToString();
        clsHelper.CheckLogin();
    }

    private void BinddlPageName()
    {
        string query = "select PNAME from PAGEASSIGN where USERNAME='" + this.Session["UserName"].ToString() + "'  Order by PNAME ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "PNAME");
        ddlPageName.DataSource = ds;
        ddlPageName.DataTextField = "PNAME";
        ddlPageName.DataValueField = "PNAME";
        ddlPageName.DataBind();
        //ddlPageName.Items.Insert(0, "-- Select --");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);

        string createdBy = this.Session["UserName"].ToString();
        string strStatus = "Entered";

        string strInsert = "INSERT INTO WRITERBILL VALUES('" + txtHdnWCODE.Text + "','" + txtWriterName.Text + "','" + txtTransDate.Text + "',N'" + txtHeadLine.Text.Replace("'", "''") + "','" + ddlPageName.SelectedItem.Text + "',DBO.[udf_Replace4cNumbers](N'" + txtPamount.Text + "'),DBO.[udf_Replace4cNumbers](N'" + txtPamount.Text + "'),N'" + txtRemarks.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "',N'" + txtPamount.Text + "')";
        dataProvider.ExecuteCommand(strInsert);
        loadData();

        clearField();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string createdBy = this.Session["UserName"].ToString();
        string strUpdate = "UPDATE WRITERBILL SET WNAME='" + txtWriterName.Text + "',TRANSDATE='" + txtTransDate.Text + "',HLINE=N'" + txtHeadLine.Text + "',PNAME='" + ddlPageName.SelectedItem.Text + "',PRPAMOUNT=DBO.[udf_Replace4cNumbers](N'" + txtPamount.Text + "'),APVAMOUNT=DBO.[udf_Replace4cNumbers](N'" + txtPamount.Text + "'),REMARKS=N'" + txtRemarks.Text + "',CREATEDTAE='" + DateTime.Now + "',CREATEDBY='" + createdBy + "',UPRPAMOUNT=N'" + txtPamount.Text + "' where SL='" + txtHdnSL.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
        clearField();

    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();
        string month = TDATE.Month.ToString();
        string year = TDATE.Year.ToString();
        
        string strStatus = "Confirmed";

        string strStatusUpdate = "UPDATE VIEWWRITERBILL SET STATUS='" + strStatus + "'where   year='" + year + "' and Month='" + month + "' and status='Entered' and CREATEDBY='" + createdBy + "' and PNAME='" + ddlPageName.SelectedItem.Text + "' ";
        dataProvider.ExecuteCommand(strStatusUpdate);
        loadData();

        clearField();
    }

    private void clearField()
    {
        //txtTransDate.Text = "";
        txtWriterName.Text = "";
        txtHeadLine.Text = "";
        txtPamount.Text = "";
        txtRemarks.Text = "";        
        txtHdnWCODE.Text = "";

    }
    private void chkField()
    { 
    
    }

    protected override void OnUnload(EventArgs e)
    {
        base.OnUnload(e);
        this.Unload += new EventHandler(Page_Unload);
    }


    public void Page_Unload(object sender, EventArgs e)
    {
        report.Clone();
        report.Dispose();

    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();

        string month = TDATE.Month.ToString();
        string year = TDATE.Year.ToString();

        string strSelect = "Select * from VIEWWRITERBILL where   year='" + year + "' and Month='" + month + "' and status<>'Delete' and CREATEDBY='" + createdBy + "' AND PNAME='" + ddlPageName.SelectedItem.Text + "'";

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "VIEWWRITERBILL");
        report.Load(Server.MapPath("Report\\WriterBill.rpt"));
        report.SetDataSource(ds);
        report.SetDatabaseLogon("sa", "erp", "192.168.4.32", "ALOCIR");

         report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/WriterBill.pdf"));
         ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/WriterBill.pdf');popup.focus();", true);
        //report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "WriterBill");
        //report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "CompetitorInfo");
        
    }

    private void FindVendor()
    {
        txtVSearch.Text = "";
       // string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,ltrim(VENDNAME) as VENDNAME from View_APVEN";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from View_APVEN where USERNAME='" + this.Session["UserName"].ToString() + "'";
        string strSelect = "select top 100 VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CWH%' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();
    }
    
    private void loadData()
    {
        DateTime TDATE =Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();
        string month = TDATE.Month.ToString();
        string year = TDATE.Year.ToString();

        string strSelect = "Select * from VIEWWRITERBILL where   year='" + year + "' and Month='" + month + "' and status<>'Delete' and CREATEDBY='" + createdBy + "'  and PNAME='" + ddlPageName.SelectedItem.Text + "' ORDER BY SL desc";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "VIEWWRITERBILL");
        grdDetails.DataSource = ds;
        grdDetails.DataBind();

        btnNew.Visible = true;
                
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

            HeaderCell = new TableCell();
            HeaderCell.Text = "NAME";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

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

    protected void grdDetails_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Date";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "SL";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "WCODE";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Writer Name";
            HeaderCell.Font.Name = " Verdana";
            //HeaderCell.Font.Size = 15;
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Head Line";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Page Name";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "P.Amount";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Apv.Amount";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

           
            HeaderCell = new TableCell();
            HeaderCell.Text = "Status";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Remarks";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "UAMOUNT";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;
            

            grdDetails.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }


    protected void grdDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Visible = false;
            //e.Row.Cells[3].Visible = false;
            if (e.Row.Cells[9].Text == "Entered")
            {
                e.Row.Cells[0].Enabled = true;
                e.Row.ForeColor = System.Drawing.ColorTranslator.FromHtml("Black");
            }
            else
            {
                e.Row.Cells[0].Enabled = false;
            }
            e.Row.Cells[11].Visible = false;
        }
    }
    
    protected void grdDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);      
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {
        txtTransDate.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[1].Text);
        txtWriterName.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[4].Text);
        ddlPageName.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[6].Text);
        txtPamount.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[11].Text);
        txtHeadLine.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[5].Text);
        txtRemarks.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[10].Text);
        txtHdnSL.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[2].Text);
        txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);
        txtStatus.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[9].Text);

        
        btnAdd.Visible = false;
        //btnEdit.Visible = true;
        btnDelete.Visible = true;
        if (txtStatus.Text == "Confirmed")
        {
            btnEdit.Visible = false;
            btnDelete.Visible = false;
        }
        else
        {
            btnEdit.Visible = true;
            btnDelete.Visible = true;
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "Update WRITERBILL set status='Delete' where SL='"+txtHdnSL.Text+"'";
        dataProvider.ExecuteCommand(strDelete);
        clearField();
    }
    
    protected void btnFinder_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        FindVendor();
    }

    protected void grdVendor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        VendorPopulateLabelsByRowIndex(rowIndex);
    }

    private void VendorPopulateLabelsByRowIndex(int rowIndex)
    {
        txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        txtWriterName.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[2].Text);
        txtHeadLine.Focus();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        //loadData();
        //btnPrint.Visible = true;
    }
    protected void txtVSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where  (VENDORID like '%" + txtVSearch.Text + "%' OR VENDNAME like '%" + txtVSearch.Text + "%' OR EMAIL2 like '%" + txtVSearch.Text + "%') and VENDORID like 'CWH%'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();

    }


    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearField();
        loadData();
        btnAdd.Visible = true;
        btnEdit.Visible = false;
        btnDelete.Visible = false;
    }
    protected void txtTransDate_TextChanged(object sender, EventArgs e)
    {
        loadData();
        btnPrint.Visible = true;
        btnConfirm.Visible = true;
    }

    protected void ddlPageName_TextChanged(object sender, EventArgs e)
    {
        loadData();        
    }

    protected void txtHdnWCODE_TextChanged(object sender, EventArgs e)
    {        
        string WriterName = "select EMAIL2 from [ALODAT].dbo.APVEN where VENDORID='" + txtHdnWCODE.Text + "' "; 
        string result = Convert.ToString(dataProvider.getResultString(WriterName));
        txtWriterName.Text = result.ToString();
        
    }
}