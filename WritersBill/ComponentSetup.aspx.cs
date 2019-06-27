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

public partial class ComponentSetup : System.Web.UI.Page
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
            
            btnEdit.Visible = false;
            btnDelete.Visible = false;


            //ddlCRType.Items.Add("Wage Board"); ddlCRType.Items.Add("Nonwage Board");
            loadData();
        }
        if (this.Session["userGrp"].ToString() != "Admin")
        {
            lnkBack.Visible = false;
        }

        lblUser.Text = "Wel Come: " + this.Session["UserName"].ToString();
        clsHelper.CheckLogin();
                
    }
        
    private void BinddlCategory()
    {
        //string query = "select CTNAME from LNCATEGORY Order by CTNAME ASC";
        //DataSet ds = new DataSet();
        //ds = dataProvider.getDataSet(query, "CTNAME");
        //ddlCategory.DataSource = ds;
        //ddlCategory.DataTextField = "CTNAME";
        //ddlCategory.DataValueField = "CTNAME";
        //ddlCategory.DataBind();
        //ddlCategory.Items.Insert(0, "-- Select --");
    }
    
    private void BinddlEdition()
    {
        //string query = "select EDNAME from LNEDITION Order by EDNAME ASC";
        //DataSet ds = new DataSet();
        //ds = dataProvider.getDataSet(query, "EDNAME");
        //ddlEdition.DataSource = ds;
        //ddlEdition.DataTextField = "EDNAME";
        //ddlEdition.DataValueField = "EDNAME";
        //ddlEdition.DataBind();
        //ddlEdition.Items.Insert(0, "-- Select --");
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {        
        string createdBy = this.Session["UserName"].ToString();
        string strStatus = "0";
        //string strComponent = "";

        string strComponent = "select * from LNCOMPONENT where COMPID='" + txtComponentID.Text + "' and GLHEAD='" + txtGlHead .Text+ "' ";
        DataTable dt = dataProvider.getDataTable(strComponent, "LNCOMPONENT");

        if (dt.Rows.Count > 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Already Exist');", true);
        }
        else
        {
            string strInsert = "INSERT INTO LNCOMPONENT VALUES('" + txtComponentID.Text + "','" + txtComponentName.Text + "','" + txtGlHead.Text.Trim() + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "')";
            dataProvider.ExecuteCommand(strInsert);
            loadData();
        }
             
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string createdBy = this.Session["UserName"].ToString();
        string strUpdate = "UPDATE LNCOMPONENT SET COMPID='" + txtComponentID.Text + "',COMPNAME='" + txtComponentName.Text + "',GLHEAD='" + txtGlHead.Text + "',CREATEDTAE='" + DateTime.Now + "',CREATEDBY='" + createdBy + "' where SL='" + txtSl.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
        clearField();

    }
    
    private void clearField()
    {
        //txtTransDate.Text = "";
        //txtWriterName.Text = "";               
        //txtHdnWCODE.Text = "";
        txtGlHead.Text = "";
        txtGlHeadDesc.Text = "";
        txtComponentID.Text = "";
        txtComponentName.Text = "";
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
        
    private void loadData()
    {
        string strSelect = "";

        strSelect = "select * from view_component where STATUS=0 order by COMPID ";
        DataSet ds = new DataSet();

        ds = dataProvider.getDataSet(strSelect, "LNRATE");
        grdDetails.DataSource = ds;
        grdDetails.DataBind();
                        
    }

    private void FindGLHead()
    {
        txtGlSearch.Text = "";
        // string strSelect = "select DISTINCT VENDORID AS ID,EMAIL2 as NAME,ltrim(VENDNAME) as VENDNAME from View_APVEN";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from View_APVEN where USERNAME='" + this.Session["UserName"].ToString() + "'";
        string strSelect = "select top 100 ACCTID, ACCTDESC from ALODAT.dbo.GLAMF ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdGlHead.DataSource = ds;
        grdGlHead.DataBind();
    }

    protected void btnFinder_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "GlHeadFinder();", true);
        FindGLHead();
    }

    protected void grdGlHead_RowCreated(object sender, GridViewRowEventArgs e)
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
                       

            grdGlHead.Controls[0].Controls.AddAt
           (0, HeaderGridRow);

        }
    }

    protected void grdGlHead_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        GLHeadPopulateLabelsByRowIndex(rowIndex);
    }

    private void GLHeadPopulateLabelsByRowIndex(int rowIndex)
    {
        txtGlHead.Text = HttpUtility.HtmlDecode(grdGlHead.Rows[rowIndex].Cells[1].Text);
        txtGlHeadDesc.Text = HttpUtility.HtmlDecode(grdGlHead.Rows[rowIndex].Cells[2].Text);
        //txtHeadLine.Focus();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        //loadData();
        //btnPrint.Visible = true;
    }
    protected void txtGlSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "GlHeadFinder();", true);
        string strSelect = "select ACCTID, ACCTDESC from ALODAT.dbo.GLAMF where  (ACCTID like '%" + txtGlSearch.Text + "%' OR ACCTDESC like '%" + txtGlSearch.Text + "%') ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "GLAMF");
        grdGlHead.DataSource = ds;
        grdGlHead.DataBind();

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
            HeaderCell.Text = "SL";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Comp. Id";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Comp. Name";
            HeaderCell.Font.Name = " Verdana";
            //HeaderCell.Font.Size = 15;
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "GL Head";
            HeaderCell.Font.Name = " Verdana";
            //HeaderCell.Font.Size = 15;
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "GL DEsc.";
            HeaderCell.Font.Name = " Verdana";
            //HeaderCell.Font.Size = 15;
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            grdDetails.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
    
    protected void grdDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);      
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {
        txtComponentID.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[2].Text);
        txtComponentName.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);
        txtGlHead.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[4].Text);
        txtGlHeadDesc.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[5].Text);
        txtSl.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[1].Text);

        btnAdd.Visible = false;
        btnEdit.Visible = true;
        btnDelete.Visible = true;
    }
    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "Update LNCOMPONENT set status='1' where SL='" + txtSl.Text + "'";
        dataProvider.ExecuteCommand(strDelete);
        clearField();
        loadData();
    }
            
    protected void ddlCategory_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlEdition_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }
    
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearField();
        loadData();
        btnAdd.Visible = true;
        btnEdit.Visible = false;

    }
    
}