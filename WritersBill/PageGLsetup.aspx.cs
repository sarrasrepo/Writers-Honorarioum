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

public partial class PageGLsetup : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    string createdBy = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinddlPageName();
        }
        btnUpdate.Visible = false;
        bindGLHead();
        //createdBy = this.Session["UserName"].ToString();
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

    private void findGLHead()
    {
        string strSel="";
        if (txtVSearch.Text == "")
        {
            strSel = "select ACCTID,ACCTDESC from [ALODAT].dbo.GLAMF where ACCTDESC like '%writers%' and ACCTID like '5%' ";
        }
        else
        {
            strSel = "select ACCTID,ACCTDESC from [ALODAT].dbo.GLAMF where ACCTDESC like '%writers%' AND (ACCTID like '%" + txtVSearch.Text + "%' OR ACCTDESC like '%" + txtVSearch.Text + "%')";
        }

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSel, "GLAMF");
        grdGL.DataSource = ds;
        grdGL.DataBind();
    }
    protected void grdGL_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "GL Head";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "GL Description";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            grdGL.Controls[0].Controls.AddAt
           (0, HeaderGridRow);

        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        findGLHead();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
    }

    protected void grdGL_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {
        txtGLID.Text = HttpUtility.HtmlDecode(grdGL.Rows[rowIndex].Cells[1].Text).Trim();
        txtGLDesc.Text = HttpUtility.HtmlDecode(grdGL.Rows[rowIndex].Cells[2].Text).Trim();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        txtVSearch.Text = "";
    }
    protected void txtVSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        findGLHead();
       

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string strStatus = "Entered";
        int intRowNumber = 0;
        string strCountRow = "Select count(*) from PAGEGLSETUP where PNAME='" + ddlPageName.SelectedItem.Text + "' AND GLHEAD='" + txtGLID.Text + "' ";
        intRowNumber = Convert.ToInt32(dataProvider.getResultString(strCountRow)); ;

        if (intRowNumber == 0)
        {
            string strInsert = "INSERT INTO PAGEGLSETUP  VALUES('" + ddlPageName.SelectedItem.Text + "','" + txtGLID.Text + "','" + txtGLDesc.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "') ";
            dataProvider.ExecuteCommand(strInsert);
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data exists..!!');", true);
        }
        bindGLHead();
    }

    private void bindGLHead()
    {
        string strSel = "Select * from PAGEGLSETUP where STATUS='Entered'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSel, "GLAMF");
        grdGLHead.DataSource = ds;
        grdGLHead.DataBind();
    }

    protected void grdGLHead_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Page";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "GL Head";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Head Desc.";
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
            HeaderCell.Visible = false;

            grdGLHead.Controls[0].Controls.AddAt
          (0, HeaderGridRow);

        }
    }

    protected void grdGLHead_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        writerPopulateLabelsByRowIndex(rowIndex);
    }
    private void writerPopulateLabelsByRowIndex(int rowIndex)
    {
        ddlPageName.SelectedItem.Text = HttpUtility.HtmlDecode(grdGLHead.Rows[rowIndex].Cells[1].Text);
        txtGLID.Text = HttpUtility.HtmlDecode(grdGLHead.Rows[rowIndex].Cells[2].Text);
        txtGLDesc.Text = HttpUtility.HtmlDecode(grdGLHead.Rows[rowIndex].Cells[3].Text);
        hdnId.Value = HttpUtility.HtmlDecode(grdGLHead.Rows[rowIndex].Cells[4].Text);
        btnUpdate.Visible = true;
        btnAdd.Visible = false;
    }
    protected void grdGLHead_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            e.Row.Cells[4].Visible = false;
            //e.Row.Cells[9].Visible = false;
        }
    }
    
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        string strDelete = "UPDATE PAGEGLSETUP SET STATUS='deleted' where PNAME='" + ddlPageName.SelectedItem.Text + "' AND GLHEAD='" + txtGLID.Text + "' AND ID='"+hdnId.Value+"'";
        dataProvider.ExecuteCommand(strDelete);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string strUpdate = "UPDATE PAGEGLSETUP SET PNAME='" + ddlPageName.SelectedItem.Text + "' , GLHEAD='" + txtGLID.Text + "',GLDESC='" + txtGLDesc.Text + "' where ID='" + hdnId.Value + "'";
        dataProvider.ExecuteCommand(strUpdate);
        bindGLHead();
        hdnId.Value = "";
        btnUpdate.Visible = false;
        btnAdd.Visible = true;
    }
}