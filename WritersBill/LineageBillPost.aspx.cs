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

public partial class LineageBillPost : System.Web.UI.Page
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
            //Rate();

            ddlStatus.Items.Add("Checked"); ddlStatus.Items.Add("Posted"); 
            
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
        //string query = "select RATE from LNRATE where CRTYPE='" + lblUserGroup.Text+ "' and LINEPHOT='"+ddlCategory.Text+"' and EDNAME='"+ddlEdition.Text+"'";
        //string rate = dataProvider.getResultString(query);

        //txtRate.Text = rate.ToString();        
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
        ddlCategory.Items.Insert(0, "-- Select --");
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
    private void TotalAmount()
    {
        //float rate = float.Parse(txtRate.Text);
        //float noOfLine = float.Parse(txtNoOfLine.Text);
        //float netTotal = (rate) * (noOfLine);
        //txtTotalAmount.Text = netTotal.ToString();
    }

    private void Checked()
    {
        //float rate = float.Parse(txtRate.Text);
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);
        
        //string query = "select FullName from userList where userName='" + this.Session["UserName"].ToString() + "'";
        //string username = dataProvider.getResultString(query);

        //string createdBy = this.Session["UserName"].ToString();
        //string strStatus = "Entered";

        //string strInsert = "INSERT INTO LINEAGEBILL VALUES('" + createdBy + "','" + username + "','"+txtTransDate.Text+"','"+txtHeadLine.Text+"','"+ddlEdition.SelectedItem.Text+"','"+ddlPageNo.SelectedItem.Text+"','" + ddlCategory.SelectedItem.Text + "','" + float.Parse(txtRate.Text) + "','" + txtNoOfLine.Text + "','" + txtTotalAmount.Text+ "','" + txtNoOfLine.Text + "','" + txtTotalAmount.Text + "','" + txtRemarks.Text + "','" + DateTime.Now + "','" + createdBy + "','" + strStatus + "')";
        //dataProvider.ExecuteCommand(strInsert);
        //loadData();

        //clearField();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        //string createdBy = this.Session["UserName"].ToString();
        //string strUpdate = "UPDATE LINEAGEBILL SET LINEPHOT='" + ddlCategory.SelectedItem.Text + "',TRANSDATE='" + txtTransDate.Text + "',HLINE='" + txtHeadLine.Text + "',EDITION='" + ddlEdition.SelectedItem.Text + "',PGNO='" + ddlPageNo.SelectedItem.Text + "',RATE='" + float.Parse(txtRate.Text) + "',PNOLINEPHOT='" + txtNoOfLine.Text + "',PAMOUNT='" + txtTotalAmount.Text + "',REMARKS='" + txtRemarks.Text + "',CREATEDTAE='" + DateTime.Now + "',CREATEDBY='" + createdBy + "' where SL='" + txtHdnSL.Text + "' ";
        //dataProvider.ExecuteCommand(strUpdate);
        //loadData();
        //clearField();

    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();
        string month = TDATE.Month.ToString();
        string year = TDATE.Year.ToString();
                
        string strStatus = "Confirmed";

        string strStatusUpdate = "UPDATE View_LineageBill SET STATUS='" + strStatus + "'where   year='" + year + "' and Month='" + month + "' and status='Entered' and CREATEDBY='" + createdBy + "' ";
        dataProvider.ExecuteCommand(strStatusUpdate);
        //loadData();

        //clearField();
    }

    private void clearField()
    {
        txtTransDate.Text = "";
        //txtWriterName.Text = "";
        //txtHeadLine.Text = "";
        //txtPamount.Text = "";
        //txtTotalAmount.Text = "";
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
    protected void btnPOst_Click(object sender, EventArgs e)
    {
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        string createdBy = this.Session["UserName"].ToString();

        string strSelect = "";

        if (ddlEdition.SelectedItem.Text != "-- Select --")
        {
            strSelect = "and EDITION= '" + ddlEdition.SelectedItem.Text + "' ";
        }

        if (ddlCategory.SelectedItem.Text != "-- Select --")
        {
            strSelect = strSelect + "and LINEPHOT= '" + ddlCategory.SelectedItem.Text + "' ";
        }
        if (txtHdnWCODE.Text != "")
        {
            strSelect = strSelect + "and VENDORID='" + txtHdnWCODE.Text + "' ";
        }

        //strSelect = "UPDATE LINEAGEBILL SET STATUS='Posted' where TRANSDATE between '" + txtTransDate.Text + "' and '" + txtTransDateTo.Text + "'  and status='checked' and CREATEDBY='" + createdBy + "' " + strSelect ;
        strSelect = "UPDATE LINEAGEBILL SET STATUS='Posted' where Transdate between '"+txtTransDate.Text+"' and '"+txtTransDateTo.Text+"' ";
        DataSet ds = new DataSet();
        dataProvider.ExecuteCommand(strSelect);

        loadData();
    }

    private void FindVendor()
    {
        txtVSearch.Text = "";
        string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CLP%' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();
    }


    private void loadData()
    {
        DateTime TDATE = Convert.ToDateTime(txtTransDate.Text);
        //string createdBy = this.Session["UserName"].ToString();
        //string month = TDATE.Month.ToString();
        //string year = TDATE.Year.ToString();
        string strSelect = "";

        if (ddlEdition.SelectedItem.Text != "-- Select --")
        {
            strSelect = "and EDITION= '"+ddlEdition.SelectedItem.Text+"' ";
        }

        if (ddlCategory.SelectedItem.Text != "-- Select --")
        {
            strSelect = strSelect + "and LINEPHOT= '" + ddlCategory.SelectedItem.Text + "' ";
        }
        if (txtHdnWCODE.Text != "")
        {
            strSelect = strSelect + "and VENDORID='" + txtHdnWCODE.Text + "' " ;
        }

        strSelect = "Select * from View_LineageBill where transdate between '" + txtTransDate.Text + "' and '"+txtTransDateTo.Text+"'  and status='" + ddlStatus.SelectedItem.Text +"' " + strSelect ;
        
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "View_LineageBill");
        grdDetails.DataSource = ds;
        grdDetails.DataBind();

        //btnNew.Visible = true;
                
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
            HeaderCell.Text = "Edition";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sl";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Category";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Pg No.";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Head Line";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "CR Name";
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
            HeaderCell.Text = "Prp. Amnt";
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
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Rate";
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
            HeaderCell.Text = "Apv. Amnt";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Edit";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "E-Paper";
            HeaderCell.Font.Name = " Verdana";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            HeaderCell.ColumnSpan = 1;
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
            e.Row.Cells[8].Visible = false;
            e.Row.Cells[14].Visible = false;
            if (ddlStatus.SelectedItem.Text == "Checked")
            {
                e.Row.Cells[12].Enabled = true;
                e.Row.ForeColor = System.Drawing.ColorTranslator.FromHtml("Black");
            }
            else
            {
                e.Row.Cells[12].Enabled = false;
            }

            e.Row.Attributes.Add("style", "cursor:help;");

            if (e.Row.Cells[14].Text == "True      ")
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

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName.Equals("Insert", StringComparison.OrdinalIgnoreCase))
        //{
        //    TextBox txtApprvLinePhoto = ((TextBox)grdDetails.FooterRow.FindControl("txtApprvLinePhoto"));
        //    string labelValue = txtApprvLinePhoto.Text;
        //}
    }

    protected void btnCheck_Click(object sender, GridViewCommandEventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "chkField();", true);

        //if (e.CommandName.Equals("Insert", StringComparison.OrdinalIgnoreCase))
        //{
        //    TextBox txtApprvLinePhoto = ((TextBox)grdDetails.FooterRow.FindControl("txtApprvLinePhoto"));
        //    string labelValue = txtApprvLinePhoto.Text;
        //}

        //clearField();
    }
    private void PopulateLabelsByRowIndex(int rowIndex)
    {  
        TextBox ApvLine = (TextBox)grdDetails.Rows[rowIndex].FindControl("txtApprvLinePhoto");
        txtApprvAmnt.Text = ApvLine.Text;
        TextBox PgNo = (TextBox)grdDetails.Rows[rowIndex].FindControl("txtPgNo");
        txtPageNo.Text = PgNo.Text;
       
        txtHdnSL.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[1].Text);
        txtApvLinePhoto.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[8].Text);
        //txtPageNo.Text = HttpUtility.HtmlDecode(grdDetails.Rows[rowIndex].Cells[3].Text);
        string createdBy = this.Session["UserName"].ToString();
        string strUpdate = "UPDATE LINEAGEBILL SET APVAMOUNT=(" + txtApprvAmnt.Text + ") * (" + txtApvLinePhoto.Text + "),PGNO= '"+txtPageNo.Text+"' ,ANOLINEPHOT='" + txtApprvAmnt .Text+ "' ,STATUS='Posted' where SL='" + txtHdnSL.Text + "' ";
        dataProvider.ExecuteCommand(strUpdate);
        loadData();
     
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "Update LINEAGEBILL set status='Delete' where SL='" + txtHdnSL.Text + "'";
        dataProvider.ExecuteCommand(strDelete);
        clearField();
      //  loadData();
    }

    
    protected void btnFinder_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);
        FindVendor();
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        loadData();
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
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "writerFinder();", true);

        string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where VENDORID like 'CLP%' AND (VENDORID like '%" + txtVSearch.Text + "%' OR VENDNAME like '%" + txtVSearch.Text + "%' OR EMAIL2 like '%" + txtVSearch.Text + "%') AND EMAIL2<>'' and  EMAIL2 not like '%@%'";
        //string strSelect = "select VENDORID AS ID,EMAIL2 as NAME,VENDNAME from [ALODAT].dbo.APVEN where EMAIL2<>'' and  EMAIL2 not like '%@%'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strSelect, "APVEN");
        grdVendor.DataSource = ds;
        grdVendor.DataBind();

    }
    protected void ddlCategory_TextChanged(object sender, EventArgs e)
    {        
        //Rate();
        //TotalAmount();
    }

    
    protected void ddlStatus_TextChanged(object sender, EventArgs e)
    {
        //loadData();
        //Rate();
        //TotalAmount();
    }
    protected void txtNoOfLine_TextChanged(object sender, EventArgs e)
    {
        TotalAmount();
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearField();
        //loadData();
    }
    protected void txtTransDate_TextChanged(object sender, EventArgs e)
    {
        loadData();
        //btnPrint.Visible = true;
        //btnConfirm.Visible = true;
    }


 
    protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand("update stores set stor_name='" + stor_name.Text + "', stor_address='" + stor_address.Text + "', city='" + city.Text + "', state='" + state.Text + "', zip='" + zip.Text + "' where stor_id=" + stor_id, con);
        //cmd.ExecuteNonQuery();
        //con.Close();
        //lblmsg.BackColor = Color.Blue;
        //lblmsg.ForeColor = Color.White;
        //lblmsg.Text = stor_id + "        Updated successfully........    ";
        //gridView.EditIndex = -1;
        //loadStores();
    }

    protected void grdDetails_RowDataBound(object sender, EventArgs e)
    {
        
    }

    protected void ddlEdition_TextChanged(object sender, EventArgs e)
    {

    }
}