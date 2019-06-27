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

public partial class Rate : System.Web.UI.Page
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


            ddlCRType.Items.Add("Wage Board"); ddlCRType.Items.Add("Nonwage Board");
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
        ddlEdition.Items.Insert(0, "-- Select --");
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {        
        string createdBy = this.Session["UserName"].ToString();
        string strStatus = "0";
        string strRate = "";

        strRate = "select * from LNRATE where EDNAME='" + ddlEdition.SelectedItem + "' and LINEPHOT='" + ddlCategory.SelectedItem + "' and CRTYPE='"+ ddlCRType.SelectedItem +"' ";
        DataTable dt = dataProvider.getDataTable(strRate, "LNRATE");

        if (dt.Rows.Count > 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Already Exist');", true);
        }
        else
        {
            string strInsert = "INSERT INTO LNRATE VALUES('" + ddlEdition.SelectedItem + "','" + ddlCRType.SelectedValue + "','" + ddlCategory.SelectedItem.Text + "','" + txtRate.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "')";
            dataProvider.ExecuteCommand(strInsert);
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Insert Successfully');", true);
        }
        loadData();
        clearField();
             
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string createdBy = this.Session["UserName"].ToString();
        string strUpdate = "UPDATE LNRATE SET EDNAME='" + ddlEdition.SelectedItem.Text + "',CRTYPE='" + ddlCRType.Text + "',LINEPHOT='" + ddlCategory.Text + "',RATE='" + txtRate.Text + "', CREATEDTAE='" + DateTime.Now + "',CREATEDBY='" + createdBy + "' where SL='" + txtSl.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
        clearField();

    }
        
    private void clearField()
    {
        txtRate.Text = "";
        //txtTransDate.Text = "";
        //txtWriterName.Text = "";               
        //txtHdnWCODE.Text = "";

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
        //string createdBy = this.Session["UserName"].ToString();
        if (ddlEdition.SelectedValue != "-- Select --")
        {
            strSelect = "select * from LNRATE where EDNAME='" + ddlEdition.SelectedItem + "' and STATUS=0 ";
        }
        else
        {
            strSelect = "select * from LNRATE where STATUS=0 ";
        }
        DataSet ds = new DataSet();

        ds = dataProvider.getDataSet(strSelect, "LNRATE");
        grdDetails.DataSource = ds;
        grdDetails.DataBind();
                
                        
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
            HeaderCell.Text = "Edition Name";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "CR Type";
            HeaderCell.Font.Name = " Verdana";
            //HeaderCell.Font.Size = 15;
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Category";
            HeaderCell.Font.Name = " Verdana";
            //HeaderCell.Font.Size = 15;
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Rate";
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
        ddlEdition.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[2].Text);
        ddlCRType.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);
        ddlCategory.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[4].Text);
        txtRate.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[5].Text);
        txtSl.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[1].Text);

        btnAdd.Visible = false;
        btnEdit.Visible = true;
        btnDelete.Visible = true;
    }
    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "Update LNRATE set status='1' where SL='" + txtSl.Text + "'";
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