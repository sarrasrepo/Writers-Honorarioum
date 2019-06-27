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
//using System.Data.SqlClient.SqlDataReader;

public partial class LineageBill : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();     
    private ReportDocument report = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            string query = "select FullName from userList where userName='" + this.Session["UserName"].ToString() + "'";
            string username = dataProvider.getResultString(query);
            lblUser.Text = username;
     
            BinddlCategory();
            BinddlEdition();
            userGroup();
            btnEdit.Visible = false;
            btnDelete.Visible = false;
            btnPrint.Visible = false;
            btnNew.Visible = false;
            btnConfirm.Visible = false;
            Rate();
        
            ddlPageNo.Items.Add("1"); ddlPageNo.Items.Add("2"); ddlPageNo.Items.Add("3"); ddlPageNo.Items.Add("4"); ddlPageNo.Items.Add("5"); ddlPageNo.Items.Add("6");
            ddlPageNo.Items.Add("7"); ddlPageNo.Items.Add("8"); ddlPageNo.Items.Add("9"); ddlPageNo.Items.Add("10"); ddlPageNo.Items.Add("11"); ddlPageNo.Items.Add("12");
            ddlPageNo.Items.Add("13"); ddlPageNo.Items.Add("14"); ddlPageNo.Items.Add("15"); ddlPageNo.Items.Add("16"); ddlPageNo.Items.Add("17"); ddlPageNo.Items.Add("18");
            ddlPageNo.Items.Add("19"); ddlPageNo.Items.Add("20"); ddlPageNo.Items.Add("21"); ddlPageNo.Items.Add("22"); ddlPageNo.Items.Add("23"); ddlPageNo.Items.Add("24");
            
        }
        clsHelper.CheckLogin();
    }

    private void userGroup()
    {        
        string query = "select groupId from userList where userName='" + this.Session["UserName"].ToString() + "'";
        string usergrp = dataProvider.getResultString(query);
        

        if (usergrp=="16")
        {
            lblUserGroup.Text = "Wage Board";
        }
        else if (usergrp == "17")
        {
            lblUserGroup.Text = "Nonwage Board";
        }
        else
        {
            lblUserGroup.Text = "";
        }
      
    }
    private void Rate()
    {
        string query = "select RATE from LNRATE where CRTYPE='" + lblUserGroup.Text+ "' and LINEPHOT='"+ddlCategory.Text+"' and EDNAME='"+ddlEdition.Text+"'";
        string rate = dataProvider.getResultString(query);

        txtRate.Text = rate.ToString();        
    }

    private void BinddlCategory()
    {
        string query = "select CTNAME from LNCATEGORY Order by CTNAME ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "CTNAME");
        ddlCategory.DataSource = ds;
        ddlCategory.DataTextField = "CTNAME";
        ddlCategory.DataValueField = "CTNAME";
        ddlCategory.DataBind();
        //ddlCategory.Items.Insert(0, "-- Select --");
    }
    
    private void BinddlEdition()
    {
        string query = "select EDNAME from LNEDITION Order by EDNAME ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "EDNAME");
        ddlEdition.DataSource = ds;
        ddlEdition.DataTextField = "EDNAME";
        ddlEdition.DataValueField = "EDNAME";
        ddlEdition.DataBind();
        //ddlEdition.Items.Insert(0, "-- Select --");
    }
    private void TotalAmount()
    {
        float rate = float.Parse(txtRate.Text);
        float noOfLine = float.Parse(txtNoOfLine.Text);
        float netTotal = (rate) * (noOfLine);
        txtTotalAmount.Text = netTotal.ToString();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);
        
        string query = "select FullName from userList where userName='" + this.Session["UserName"].ToString() + "'";
        string username = dataProvider.getResultString(query);

        string createdBy = this.Session["UserName"].ToString();
        string strStatus = "Entered";

        string strInsert = "INSERT INTO LINEAGEBILL VALUES('" + createdBy + "','" + username + "','"+txtTransDate.Text+"','"+txtHeadLine.Text+"','"+ddlEdition.SelectedItem.Text+"','"+ddlPageNo.SelectedItem.Text+"','" + ddlCategory.SelectedItem.Text + "','" + float.Parse(txtRate.Text) + "','" + txtNoOfLine.Text + "','" + txtTotalAmount.Text+ "','" + txtNoOfLine.Text + "','" + txtTotalAmount.Text + "','" + txtRemarks.Text + "','"+chkJoint.Checked+"','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "')";
        dataProvider.ExecuteCommand(strInsert);
        loadData();
        
        clearField();
             
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string createdBy = this.Session["UserName"].ToString();
        string strUpdate = "UPDATE LINEAGEBILL SET LINEPHOT='" + ddlCategory.SelectedItem.Text + "',TRANSDATE='" + txtTransDate.Text + "',HLINE='" + txtHeadLine.Text + "',EDITION='" + ddlEdition.SelectedItem.Text + "',PGNO='" + ddlPageNo.SelectedItem.Text + "',RATE='" + float.Parse(txtRate.Text) + "',PNOLINEPHOT='" + txtNoOfLine.Text + "',PAMOUNT='" + txtTotalAmount.Text + "',ANOLINEPHOT='" + txtNoOfLine.Text + "',APVAMOUNT='" + txtTotalAmount.Text + "', REMARKS='" + txtRemarks.Text + "',CREATEDTAE='" + DateTime.Now + "',CREATEDBY='" + createdBy + "', JOINTNEWS='" + chkJoint.Checked + "' where SL='" + txtHdnSL.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
        //clearField();

    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();
        string month = TDATE.Month.ToString();
        string year = TDATE.Year.ToString();

        string strStatus = "Submitted";

        string strStatusUpdate = "UPDATE View_LineageBill SET STATUS='" + strStatus + "'where   year='" + year + "' and Month='" + month + "' and status='Entered' and CREATEDBY='" + createdBy + "' ";
        dataProvider.ExecuteCommand(strStatusUpdate);
        loadData();

        //clearField();
    }

    private void clearField()
    {
        //txtTransDate.Text = "";
        //txtWriterName.Text = "";
        txtHeadLine.Text = "";
        txtNoOfLine.Text = "";
        //txtPamount.Text = "";
        txtTotalAmount.Text = "";
        txtRemarks.Text = "";        
        //txtHdnWCODE.Text = "";
        btnEdit.Visible = false;

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

        string strSelect = "Select * from VLNSALARY where   year='" + year + "' and Month='" + month + "' and status<>'Delete' and VENDORID='" + this.Session["UserName"].ToString() + "'  ";

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "VLNSALARY");
        report.Load(Server.MapPath("Report\\Pay_slipNew.rpt"));
        report.SetDataSource(ds);
        report.SetDatabaseLogon("sa", "erp", "192.168.10.70", "ALOCIR");

        report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/Pay_slipNew.pdf"));
        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/Pay_slipNew.pdf');popup.focus();", true);
        //report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "CompetitorInfo");
        
    }

    private void FindVendor()
    {
        //txtVSearch.Text = "";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CWH%' AND EMAIL2<>'' and  EMAIL2 not like '%@%'";
        //DataSet ds = new DataSet();
        //ds = dataProvider.getDataSet(strSelect, "APVEN");
        //grdVendor.DataSource = ds;
        //grdVendor.DataBind();
    }


    private void loadData()
    {
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();
        string month = TDATE.Month.ToString();
        string year = TDATE.Year.ToString();

        string strSelect = "Select * from View_LineageBill where   year='" + year + "' and Month='" + month + "' and status<>'Delete' and CREATEDBY='" + createdBy + "' order by Sl desc";
        
        DataSet ds = new DataSet();
        
        ds = dataProvider.getDataSet(strSelect, "View_LineageBill");
        grdDetails.DataSource = ds;
        grdDetails.DataBind();
                
        //SqlConnection conn = new SqlConnection();
        //conn.Open();

        //string strTotal = "Select sum(PAMOUNT) from View_LineageBill where   year='2016' and Month='4' and status<>'Delete' and CREATEDBY='clp132'  ";
        
        //SqlCommand getResult = new SqlCommand(strTotal);
        //SqlDataReader reader = new SqlDataReader();

        //while (reader.Read())
        //{
        //    lblTotal.Text = reader["PAMOUNT"].ToString();
        //}
        
        //dsTotal = dataProvider.getDataReader(strTotal, "View_LineageBill");
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
            HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "ID";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "NAME";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "NAME";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;
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
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Submit";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Pub Date";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "SL NO.";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "CRCODE";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "CR Name";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Head Line";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Prp. Line/Photo";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");            
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Prp. Amount";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Apv. Line/Photo";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Apv. Amount";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;
                       

            HeaderCell = new TableCell();
            HeaderCell.Text = "Pg No.";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Line/Photo";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Edition";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Rate";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;
            
            HeaderCell = new TableCell();
            HeaderCell.Text = "Remarks";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Status";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            grdDetails.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[16].Visible = false;
            //e.Row.Cells[9].Visible = false;

            if (e.Row.Cells[15].Text == "Entered")
            {
                e.Row.Cells[0].Enabled = true;
                e.Row.ForeColor = System.Drawing.ColorTranslator.FromHtml("Black");
            }
            else
            {
                e.Row.Cells[0].Enabled = false;
            }
            if (e.Row.Cells[15].Text != "Entered")
            {
                e.Row.Cells[1].Enabled = false;
                e.Row.ForeColor = System.Drawing.ColorTranslator.FromHtml("Black");
            }
            else
            {
                e.Row.Cells[1].Enabled = true;
            }

            e.Row.Attributes.Add("style", "cursor:help;");

            if (e.Row.Cells[16].Text == "True      ")
            {
                //e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='orange'");
                //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#E56E94'");
                e.Row.BackColor = Color.FromName("#A3E4D7"); 
                            
            }

        }
    }
    
    protected void grdDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);      
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {
        txtTransDate.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[2].Text);
        ddlCategory.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[11].Text);
        txtHeadLine.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[5].Text);
        ddlEdition.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[12].Text);
        ddlPageNo.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[10].Text);
        txtRate.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[13].Text);
        txtNoOfLine.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[6].Text);
        txtTotalAmount.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[7].Text);
        txtRemarks.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[14].Text);
        txtHdnSL.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);
        
        txtStatus.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[15].Text);
        
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
    protected void grdDetails_EditIndexChanging(object sender, GridViewEditEventArgs e)
    {
        int rowIndex = e.NewEditIndex;
        SubmitRowIndex(rowIndex);
    }

    private void SubmitRowIndex(int rowIndex)
    {        
        txtHdnSL.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);

        string strUpdate = "UPDATE LINEAGEBILL SET STATUS='Submitted' where SL='" + txtHdnSL.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "Update LINEAGEBILL set status='Delete' where SL='" + txtHdnSL.Text + "'";
        dataProvider.ExecuteCommand(strDelete);
        clearField();
        loadData();
        //btnNew();
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
        //txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        //txtWriterName.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[2].Text);
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        //loadData();
        //btnPrint.Visible = true;
    }
    protected void txtVSearch_TextChanged(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);

        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CWH%' AND (VENDORID like '%" + txtVSearch.Text + "%' OR VENDNAME like '%" + txtVSearch.Text + "%' OR EMAIL2 like '%" + txtVSearch.Text + "%') AND EMAIL2<>'' and  EMAIL2 not like '%@%'";
        ////string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where EMAIL2<>'' and  EMAIL2 not like '%@%'";
        //DataSet ds = new DataSet();
        //ds = dataProvider.getDataSet(strSelect, "APVEN");
        //grdVendor.DataSource = ds;
        //grdVendor.DataBind();

    }
    protected void ddlCategory_TextChanged(object sender, EventArgs e)
    {
        if (ddlCategory.Text == "Line")
        {
            lblHeadLine.Text = "Head Line";
            lblNoOfLine.Text = "No of Line";
        }
        else 
        {
            lblHeadLine.Text = "Photo Caption";
            lblNoOfLine.Text = "No of Photo";    
        }
        Rate();
        TotalAmount();
    }
    protected void ddlEdition_TextChanged(object sender, EventArgs e)
    {        
        Rate();
        TotalAmount();
    }
    protected void txtNoOfLine_TextChanged(object sender, EventArgs e)
    {
        TotalAmount();
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
}