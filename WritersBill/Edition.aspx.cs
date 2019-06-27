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

public partial class Edition : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    private ReportDocument report = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            btnEdit.Visible = false;
            btnDelete.Visible = false;
            
        }

        if (this.Session["userGrp"].ToString() != "Admin")
        {
            lnkBack.Visible = false;
        }

        lblUser.Text ="Wel Come: "+ this.Session["UserName"].ToString();
        clsHelper.CheckLogin();

        loadData();
    }
        
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);

        string createdBy = this.Session["UserName"].ToString();
        string strStatus = "0";

        string strInsert = "INSERT INTO LNEDITION VALUES('" + txtEditionCode.Text + "','" + txtEditionName.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "')";
        dataProvider.ExecuteCommand(strInsert);
        loadData();

        clearField();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string createdBy = this.Session["UserName"].ToString();
        string strUpdate = "UPDATE LNEDITION SET CTCODE='" + txtEditionCode.Text + "',CTNAME='" + txtEditionName.Text + "',CREATEDTAE='" + DateTime.Now + "',CREATEDBY='" + createdBy + "' where SL='" + txtSl.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
        clearField();

    }
    
    private void clearField()
    {
        //txtTransDate.Text = "";
        //txtWriterName.Text = "";
        //txtHeadLine.Text = "";
        //txtPamount.Text = "";
        //txtRemarks.Text = "";        
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
        //DateTime TDATE =Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();
        //string month = TDATE.Month.ToString();
        //string year = TDATE.Year.ToString();

        string strSelect = "select * from LNEDITION where STATUS=0 ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "LNEDITION");
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
            HeaderCell.Text = "Edition Code";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Edition Name";
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
        txtEditionCode.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[2].Text);
        txtEditionName.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);        
        txtSl.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[1].Text);
        
        btnAdd.Visible = false;
        btnEdit.Visible = true;
        btnDelete.Visible = true;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "Update LNEDITION set status='1' where SL='" + txtSl.Text + "'";
        dataProvider.ExecuteCommand(strDelete);
        clearField();

        loadData();
    }
           
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearField();
        loadData();
        btnAdd.Visible = true;
        btnEdit.Visible = false;
        btnDelete.Visible = false;
    }
    

}