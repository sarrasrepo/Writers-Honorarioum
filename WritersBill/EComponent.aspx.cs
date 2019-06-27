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

public partial class EComponent : System.Web.UI.Page
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

        BtnUpdate.Visible = false;
        //loadData();
            
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {        
        string strVendor = "";
        string createdBy = this.Session["UserName"].ToString();
        
        strVendor = "select SL from View_Ecomponent where VENDORID='" + txtVendorId.Text + "' and COMPID='" + txtComponentId.Text + "' ";
        DataTable dt = dataProvider.getDataTable(strVendor, "View_Ecomponent");
               
        //int intSL = Convert.ToInt16(dataProvider.getResultBit(strVendor));        
        //txtSl.Text = intSL.ToString();

        if (dt.Rows.Count > 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Already Exist');", true);
        }
        else
        {
            string strInsert = "INSERT INTO LNECOMPONENT VALUES('" + txtVendorId.Text + "','" + txtVendorName.Text + "','" + txtComponentId.Text + "','" + txtAmount.Text + "','" + DateTime.Now + "','" + createdBy + "','0')";
            dataProvider.ExecuteCommand(strInsert);
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Insert Successfully');", true);
        }

        loadData();     
        
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {        
        string strVendor = "";
        string createdBy = this.Session["UserName"].ToString();
        
        strVendor = "select SL from View_Ecomponent where VENDORID='" + txtVendorId.Text + "' and COMPID='" + txtComponentId.Text + "' ";
        DataTable dt = dataProvider.getDataTable(strVendor, "View_Ecomponent");

        string strInsert = "update LNECOMPONENT set VENDORID='" + txtVendorId.Text + "', VENDNAME='" + txtVendorName.Text + "', COMPID='" + txtComponentId.Text + "',AMOUNT='"+txtAmount.Text+"' where SL='"+txtSl.Text+"' ";
        dataProvider.ExecuteCommand(strInsert);
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Successfully');", true);

        loadData();
        
    }

    private void clearfield()
    {
        
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
            HeaderCell.Text = "SL NO.";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;
                        
            HeaderCell = new TableCell();
            HeaderCell.Text = "Com. Id";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Com. Name";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Amount";
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
        txtSl.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[1].Text);
        txtComponentId.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[2].Text);
        txtComponentName.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);
        txtAmount.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[4].Text);

        BtnUpdate.Visible = true;
                        
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

            grdVendor.Controls[0].Controls.AddAt
           (0, HeaderGridRow);

        }
    }

    protected void grdComponent_RowCreated(object sender, GridViewRowEventArgs e)
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
            grdComponent.Controls[0].Controls.AddAt
           (0, HeaderGridRow);

        }
    }
    private void FindVendor()
    {
        txtVSearch.Text = "";
        string strSelect = "select rtrim(VENDORID) AS ID,EMAIL2 as NAME,rtrim(VENDNAME) as VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CLP%' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();
        
    }
    private void FindComponent()
    {
        txtComponentSearch.Text = "";        
        string strSelect = "select ltrim(COMPID) as COMPID,COMPNAME from LNCOMPONENT ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "LNCOMPONENT");
        grdComponent.DataSource = ds;
        grdComponent.DataBind();

    }

    private void loadData()
    {
        //DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();

        string strSelect = "Select * from View_Ecomponent where VENDORID='" + txtVendorId.Text + "' order by Sl desc";

        DataSet ds = new DataSet();

        ds = dataProvider.getDataSet(strSelect, "View_Ecomponent");
        grdDetails.DataSource = ds;
        grdDetails.DataBind();

    }

    protected void btnGoLoad_Click(object sender, EventArgs e)
    {
        loadData();
        txtComponentId.Text = "";
        txtComponentName.Text = "";
        txtAmount.Text = "";
    }

    protected void btnFinder_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        FindVendor();
    }
    protected void btnFinderTo_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "ComponentFinder();", true);
        FindComponent();
    }

    protected void grdVendor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        VendorPopulateLabelsByRowIndex(rowIndex);
    }
    protected void grdComponent_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        ComponentPopulateLabelsByRowIndex(rowIndex);
    }

    private void VendorPopulateLabelsByRowIndex(int rowIndex)
    {   
        txtVendorName.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[2].Text);
        txtVendorId.Text = HttpUtility.HtmlDecode(grdVendor.Rows[rowIndex].Cells[1].Text);
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDiv();", true);
        
    }
    private void ComponentPopulateLabelsByRowIndex(int rowIndex)
    {        
        txtComponentId.Text = HttpUtility.HtmlDecode(grdComponent.Rows[rowIndex].Cells[1].Text);
        txtComponentName.Text = HttpUtility.HtmlDecode(grdComponent.Rows[rowIndex].Cells[2].Text);
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "hideDivTo();", true);     
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
    protected void txtComponentSearch_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "ComponentFinder();", true);
        string strSelect = "select ltrim(COMPID) as COMPID,COMPNAME from LNCOMPONENT where  (COMPID like '%" + txtComponentSearch.Text + "%' OR COMPNAME like '%" + txtComponentSearch.Text + "%' )";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdComponent.DataSource = ds;
        grdComponent.DataBind();

    }

    protected void txtVendorId_TextChanged(object sender, EventArgs e)
    {
        loadData();    
    }

    private void clearField()
    {
        //txtTransDate.Text = "";
        //txtWriterName.Text = "";               
        //txtHdnWCODE.Text = "";
        txtAmount.Text = "";
        txtComponentId.Text = "";
        txtComponentName.Text = "";
        txtVendorName.Text = "";
        txtVendorId.Text = "";
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearField();
        loadData();
        btnAdd.Visible = true;
        //btnEdit.Visible = false;

    }

}