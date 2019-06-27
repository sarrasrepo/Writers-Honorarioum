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


public partial class userPageAssign : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    string createdBy = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinddlPageName();
            BinddlUser();
        }
        PageDetails();
        WriterDetails();
         createdBy = this.Session["UserName"].ToString();
    }

    private void BinddlPageName()
    {
        string query = "select PNAME from WPAGENAME Order by PNAME ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "PNAME");
        ddlPageName.DataSource = ds;
        ddlPageName.DataTextField = "PNAME";
        ddlPageName.DataValueField = "PNAME";
        ddlPageName.DataBind();
        ddlPageName.Items.Insert(0, "-- Select --");
    }

    private void BinddlUser()
    {
        string query = "select userName from userList where delStatus=0 Order by  userName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "userName");
        ddlUserName.DataSource = ds;
        ddlUserName.DataTextField = "userName";
        ddlUserName.DataValueField = "userName";
        ddlUserName.DataBind();
        ddlUserName.Items.Insert(0, "-- Select --");

        ddlUserForWriter.DataSource = ds;
        ddlUserForWriter.DataTextField = "userName";
        ddlUserForWriter.DataValueField = "userName";
        ddlUserForWriter.DataBind();
        ddlUserForWriter.Items.Insert(0, "-- Select --");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {        
        string strStatus = "Entered";
        int intRowNumber=0;
        //string strCountRow = "Select count(*) from PAGEASSIGN where PNAME='" + ddlPageName.SelectedItem.Text + "' AND USERNAME='" + ddlUserName.SelectedItem.Text + "' AND WCODE='"+txtHdnWCODE.Text+"'";
        string strCountRow = "Select count(*) from PAGEASSIGN where PNAME='" + ddlPageName.SelectedItem.Text + "' AND USERNAME='" + ddlUserName.SelectedItem.Text + "' ";
        intRowNumber = Convert.ToInt32(dataProvider.getResultString(strCountRow)); ;          
        
        if(intRowNumber==0)
        {
            string strInsert = "INSERT INTO PAGEASSIGN  VALUES('" + ddlPageName.SelectedItem.Text + "','" + ddlUserName.SelectedItem.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "') ";
            dataProvider.ExecuteCommand(strInsert);
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data exists..!!');", true);
        }
        PageDetails();
    }
    private void PageDetails()
    {
        string strSelect = "select * from pageassign where STATUS='Entered'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "pageassign");
        grdPage.DataSource = ds;
        grdPage.DataBind();
    }
    private void WriterDetails()
    {
        string strSelect = "select * from writerassign where STATUS='Entered'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "writerassign");
        grdWriter.DataSource = ds;
        grdWriter.DataBind();
    }
    protected void grdWriter_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Select";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "User";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "W.Code";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Writer";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            grdWriter.Controls[0].Controls.AddAt
          (0, HeaderGridRow);

        }
    }

    protected void grdPage_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Select";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "User";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Page";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            grdPage.Controls[0].Controls.AddAt
          (0, HeaderGridRow);

        }
    }
    protected void grdWriter_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        writerPopulateLabelsByRowIndex(rowIndex);
    }
    private void writerPopulateLabelsByRowIndex(int rowIndex)
    {
        ddlUserForWriter.Text = HttpUtility.HtmlDecode(grdWriter.Rows[rowIndex].Cells[1].Text);
        txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdWriter.Rows[rowIndex].Cells[2].Text);
        txtWriter.Text = HttpUtility.HtmlDecode(grdWriter.Rows[rowIndex].Cells[3].Text);
        
       
    }
    protected void grdPage_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {        
        ddlUserName.Text = HttpUtility.HtmlDecode(grdPage.Rows[rowIndex].Cells[1].Text);
        ddlPageName.Text = HttpUtility.HtmlDecode(grdPage.Rows[rowIndex].Cells[2].Text);
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        string strDelete = "UPDATE PAGEASSIGN SET STATUS='delete' where PNAME='" + ddlPageName.SelectedItem.Text + "' AND USERNAME='"+ddlUserName.SelectedItem.Text+"' AND WCODE='"+txtHdnWCODE.Text+"'";
        dataProvider.ExecuteCommand(strDelete);
        PageDetails();
    }

    private void FindVendor()
    {
        txtVSearch.Text = "";
        string strSelect = "select top 100 VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CWH%' and  EMAIL2 not like '%@%'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();
    }
    protected void txtVSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);

        string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CWH%' AND (VENDORID like '%" + txtVSearch.Text + "%' OR VENDNAME like '%" + txtVSearch.Text + "%' OR EMAIL2 like '%" + txtVSearch.Text + "%')  and  EMAIL2 not like '%@%'";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where EMAIL2<>'' and  EMAIL2 not like '%@%'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();

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


    protected void grdVendor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        VendorPopulateLabelsByRowIndex(rowIndex);
    }

    private void VendorPopulateLabelsByRowIndex(int rowIndex)
    {
        
        //txtWriter.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[2].Text);
        txtHdnWCODE.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        txtWriterNameEng.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[2].Text);
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        //loadData();
        //btnPrint.Visible = true;
    }

    protected void btnFinder_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        FindVendor();
    }

    protected void btnWriterAdd_Click(object sender, EventArgs e)
    {
        string strStatus = "Entered";
        int intRowNumber = 0;
        string strCountRow = "Select count(*) from WRITERASSIGN where WNAME='" + txtWriter.Text + "' AND USERNAME='" + ddlUserForWriter.SelectedItem.Text + "'";
        intRowNumber = Convert.ToInt32(dataProvider.getResultString(strCountRow)); ;

        if (intRowNumber == 0)
        {
            string strInsert = "INSERT INTO WRITERASSIGN  VALUES('" + txtWriter.Text + "','" + ddlUserForWriter.SelectedItem.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "','" + txtHdnWCODE.Text + "') ";
            dataProvider.ExecuteCommand(strInsert);
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data exists..!!');", true);
        }
        WriterDetails();
    }
    protected void btnRemoveWriter_Click(object sender, EventArgs e)
    {
        string strDelete = "UPDATE WRITERASSIGN SET STATUS='deleted' where WNAME='" + txtWriter.Text + "' AND USERNAME='" + ddlUserForWriter.SelectedItem.Text + "'";
        dataProvider.ExecuteCommand(strDelete);
        PageDetails();
    }
}