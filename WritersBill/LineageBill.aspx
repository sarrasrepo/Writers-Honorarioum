 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="LineageBill.aspx.cs" Inherits="LineageBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: Writers Bill :::</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-1.10.3.js" type="text/javascript"></script>
    <script src="Scripts/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    <link href="jquery-ui-1.10.3.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript" language="javascript">


         function writerFinder() {
             document.getElementById('divVendor').style.display = 'block';
         }
         function hideDiv() 
         {
             document.getElementById('divVendor').style.display = 'none';
         }        

         //window.onbeforeunload = confirmExit;
         function reLoad() {
             
             window.location("logout.aspx");
         }

         function chkField() 
         {
             if (document.getElementById('<%= txtTransDate.ClientID %>').value == "") {
                 alert('Select transaction date....');
                 return false;
             }
             
//             if (document.getElementById('<%= txtHeadLine.ClientID %>').value == "") {
//                 alert('Input head line....');
//                 return false;
//             }
             if (document.getElementById('<%= ddlCategory.ClientID %>').value == "-- Select --") 
             {
                 alert('Select Page....');
                 return false;
             }
             if (document.getElementById('<%= ddlEdition.ClientID %>').value == "") {
                 alert('Input amount....');
                 return false;
             }

         }

    </script>
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</head>


<body>

    
    <form id="form1" runat="server">
    <asp:LinkButton ID="linkButtonLogout" Font-Names="Verdana"  PostBackUrl="~/login.aspx"
            runat="server" Text="Logout" 
            
        style="position:absolute; top:32px; left:1132px; height:30px; width:70px;" ></asp:LinkButton>
    <%--<div id="divSearchWriter" style="position:absolute; top:0px; left:0px; height:250px; width:300px; border:1px solid red; text-align:left; overflow:auto; z-index:20;  display:none; ">         
    </div>--%>
    <div style="position:absolute; height:650px;width:911px; margin-left:300px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -95px;" 
        class="style1">
        
        <div style="position:absolute; height:30px;width:900px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">LINAGE BILL ENTRY</div>
        <asp:Label ID="lblWelcome"  runat="server" CssClass="labelTextField"  Text="Welcome :"
            style="position:absolute; font-style:italic; top:5px; left:376px;"  ></asp:Label>
        <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  
            style="position:absolute; font-style:italic; top:5px; left:449px;"  ></asp:Label>

        <asp:Label ID="lblUserGroup"  runat="server" CssClass="labelTextField"  
            style="position:absolute; font-style:italic; top:5px; left:739px;"  ></asp:Label>
        <asp:Label ID="lblPubDate"  runat="server" CssClass="labelTextField" 
            Text="Publish Date"  
            style="position:absolute; top:35px; left:10px; width: 82px;"  ></asp:Label>
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox"   AutoPostBack="true"
            style="position:absolute; top:33px; left:115px; width:140px; " 
            ontextchanged="txtTransDate_TextChanged" ></asp:TextBox>

<asp:CheckBox ID="chkJoint" runat="server" Text="Joint News"   CssClass="labelTextField" 
            style="position:absolute; top:38px; left:374px; width:140px; " 
             />

            <%--<asp:CheckBox ID="CheckBox1" runat="server" style="top:120px;" />--%>

        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" 
            Style="position: absolute; left:265px; top:35px; width:23px; height:20px;" 
            ImageUrl="~/Images/Calendar.jpg" />
        
        <asp:Button id="btnNew" CssClass="Submitbutton" runat="server" Text="+" 
            style="position:absolute; top:33px; left:299px; height:20px; width:25px; font-weight:bold;" 
            onclick="btnNew_Click" /> 
        <asp:Label ID="lblCategory"  runat="server" CssClass="labelTextField" 
            Text="Category"  
            style="position:absolute; top:98px; left:10px; width: 82px;"  ></asp:Label>
        <asp:TextBox ID="txtRate" runat="server" CssClass="textBox"  ReadOnly="true"
            
            
            style="position:absolute; top:94px; left:506px; width:103px; font-family:Verdana; " 
            height="19px" BackColor="#E6E6E6" ></asp:TextBox>

        <%--<asp:TextBox ID="txtHdnWCODE" runat="server" CssClass="textBox" ReadOnly="true"  style="position:absolute; font-size:10px; top:33px; left:373px; width:50px; " ></asp:TextBox>
        <asp:TextBox ID="txtWriterName" runat="server"   CssClass="textBox" ReadOnly="true"  style="position:absolute; top:33px; left:428px; width:205px; font-family:Prothoma; " ></asp:TextBox>--%>
        <asp:DropDownList ID="ddlCategory"  runat="server"   CssClass="dropdownlist" AutoPostBack="true"
            
            style="position:absolute; top:94px; left:115px; width:140px;  text-align:center; right: 656px;" 
            OnSelectedIndexChanged="ddlCategory_TextChanged"  ></asp:DropDownList>

        <asp:Label ID="lblHeadLine"  runat="server" CssClass="labelTextField" 
            Text="Head Line"  
            style="position:absolute; top:70px; left:280px; height: 1px;"  ></asp:Label>
        <%--<asp:Label ID="lblPhoto"  runat="server" CssClass="labelTextField" 
            Text="Photo Caption"  style="position:absolute; top:69px; left:280px;"  ></asp:Label>
        --%><asp:TextBox ID="txtHeadLine" runat="server" CssClass="textBox"  autocomplete="off" 
            
            
            style="position:absolute; font-family:Prothoma; top:66px; left:379px; width:413px; " 
            Font-Size="15pt" ></asp:TextBox>


            <asp:Label ID="lblTotal"  runat="server" CssClass="labelTextField"               
            style="position:absolute; top:70px; left:840px; height: 1px;"  ></asp:Label>

        <asp:Label ID="lblPageNo"  runat="server" CssClass="labelTextField" 
            Text="Page No."  
            style="position:absolute; top:128px; left:10px; width: 82px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPageNo"  runat="server"   CssClass="dropdownlist" 
            
            
            style="position:absolute; top:124px; left:115px; width:140px;  text-align:center;" 
            DataValueField="1" BackColor="#FFFF80"   ></asp:DropDownList>

        <asp:Label ID="lblEdition"  runat="server" CssClass="labelTextField" 
            Text="Edition/Supp."  style="position:absolute; top:70px; left:10px;" 
            width="32px"  ></asp:Label>
        <%--<asp:TextBox ID="txtPamount" runat="server" CssClass="textBox"  style="position:absolute; top:93px; left:90px; width:170px; font-family:Prothoma; " ></asp:TextBox>--%>
        <asp:DropDownList ID="ddlEdition"  runat="server"   CssClass="dropdownlist" AutoPostBack="true"
            style="position:absolute; top:66px; left:115px; width:140px;  text-align:center;" 
            OnSelectedIndexChanged="ddlEdition_TextChanged"  ></asp:DropDownList>

            
        <asp:Label ID="lblRate"  runat="server" CssClass="labelTextField" Text="Rate"  
            style="position:absolute; top:98px; left:470px; right: 412px;"  ></asp:Label>

        <asp:Label ID="lblNoOfLine"  runat="server" CssClass="labelTextField" 
            Text="No of Line"  style="position:absolute; top:97px; left:280px;"  ></asp:Label>
        <asp:TextBox ID="txtNoOfLine" runat="server" CssClass="textBox"  
            AutoPostBack='true' Text='0' autocomplete="off" 
            
            style="position:absolute; top:94px; left:379px; width:82px; font-family:Verdana; right: 450px;" 
            OnTextChanged="txtNoOfLine_TextChanged " height="19px" Font-Size="10pt" ></asp:TextBox>

        <asp:Label ID="lblTotalAmount"  runat="server" CssClass="labelTextField" 
            Text="Net Total"  style="position:absolute; top:98px; left:622px;"  ></asp:Label>
        <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="textBox"  ReadOnly="true" 
            
            
            style="position:absolute; top:94px; left:691px; width:101px; font-family:Verdana; " 
            BackColor="#FFFF80" Font-Bold="True" Font-Size="12pt" ></asp:TextBox>

        <asp:Label ID="lblRemarks"  runat="server" CssClass="labelTextField" 
            Text="Remarks"  
            style="position:absolute; top:127px; left:280px; " 
            width="82px"  ></asp:Label>
        <asp:TextBox ID="txtRemarks" runat="server" CssClass="textBox"  
            
            
            style="position:absolute; top:124px; left:379px; width:413px; font-family:Prothoma; " 
            height="19px" ></asp:TextBox>

        <asp:TextBox ID="txtHdnSL" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>
        <%--<asp:TextBox ID="txtHdnWCODE" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:70px; width:50px; display:none; " ></asp:TextBox>--%>
        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>

        <asp:Button id="btnPrint" CssClass="Submitbutton" runat="server" Text="Print" 
            style="position:absolute; top:160px; left:115px; height:30px; width:70px;" 
            onclick="btnPrint_Click"/>


        <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server" Text="Add" onclientclick="javascript: return chkField();"
            style="position:absolute; top:161px; left:379px; height:30px; width:70px;" 
            onclick="btnAdd_Click"/>

        <asp:Button id="btnEdit" CssClass="Submitbutton" runat="server" Text="Update"           
            style="position:absolute; top:161px; height:30px; width:70px; left: 379px;" 
            onclick="btnEdit_Click" />

        <asp:Button id="btnDelete" CssClass="Submitbutton" runat="server" Text="Delete" onclientclick="confirm('Press OK to Delete');"
            style="position:absolute; top:161px; left:557px; height:30px; width:70px;" 
            onclick="btnDelete_Click"/>

        <asp:Button id="btnConfirm" CssClass="Submitbutton" runat="server" 
            Text="Submit All" onclientclick="confirm('Press OK to Confirm');"
            style="position:absolute; top:614px; left:788px; height:30px; width:100px;" 
            onclick="btnConfirm_Click"/>
            
            
        <%--<asp:Button id="btnPrint" CssClass="Submitbutton" runat="server" Text="Print" 
            style="position:absolute; top:161px; left:115px; height:30px; width:70px; display:none; " 
            onclick="btnPrint_Click"/>--%>

       <div style="position:absolute; height:30px;width:896px; left:0px; color:#2A120A; font-weight:bold; top:200px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px; ">DETAILS </div>
       <%--<div style="position:absolute; height:30px;width:900px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">LINEAGE BILL ENTRY</div>--%>
       <div style="position:absolute; height:380px; width:910px; left:0px; margin-top:285px; overflow:scroll; background:#F0F6F8; top: -54px;">
      

       <asp:GridView ID="grdDetails" runat="server" 
               Style="position: absolute; border: 0px solid #ADB1AF; top:6px;
                left:0px; height:auto; width:1125px; font-family:Prothoma;  font-size: 11px; color: Black;  position: absolute; overflow:auto; " 
               AutoGenerateColumns="False" CellSpacing="1" AllowSorting = "True" ShowHeader="False" 
                RowStyle-HorizontalAlign="Left" PageSize="50"
                onrowcreated="grdDetails_RowCreated" 
                onrowdatabound="grdDetails_RowDataBound" 
                onselectedindexchanging="grdDetails_SelectedIndexChanging" 
                OnRowEditing="grdDetails_EditIndexChanging">                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                                 
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonSelect" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Select" ></asp:LinkButton>
                            </ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="30px"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonSubmit" Font-Names="Verdana"  CommandName="Edit" runat="server" Text="Submit" ></asp:LinkButton>
                            </ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="30px"></ItemStyle>
                        </asp:TemplateField>
       
                        <asp:BoundField DataField="TRANSDATE" SortExpression="TRANSDATE" 
                            ItemStyle-Font-Names="Verdana" DataFormatString="{0:dd-MMM-yy}"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray"> 
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="70px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="SL" SortExpression="SL" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="VENDORID" SortExpression="VENDORID"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>
                        
                        <%--<asp:BoundField DataField="CRNAME" SortExpression="WNAME"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
--%>
                        <asp:BoundField DataField="HLINE" SortExpression="PNAME" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="300px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-Font-Size="15" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Size="15pt" Width="300px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="PNOLINEPHOT" SortExpression="PNOLINEPHOT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                            ReadOnly="true" ItemStyle-Font-Size="8"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray"  >                        

                        
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="8pt" Width="50px"></ItemStyle>
                        </asp:BoundField>

                        
                        <asp:BoundField DataField="PAMOUNT" SortExpression="PAMOUNT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                            ReadOnly="true" ItemStyle-Font-Size="8"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">


<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="8pt" Width="50px"></ItemStyle>
                        </asp:BoundField>


                        <asp:BoundField DataField="ANOLINEPHOT" SortExpression="ANOLINEPHOT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                            ReadOnly="true" ItemStyle-Font-Size="10"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray" ItemStyle-BackColor="#FFCCFF" >
                        
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCCFF" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="10pt" Width="50px"></ItemStyle>
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="APVAMOUNT" SortExpression="APVAMOUNT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                            ReadOnly="true" ItemStyle-Font-Size="10"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray" ItemStyle-BackColor="#FFCCFF" >
                                                
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCCFF" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="10pt" Width="50px"></ItemStyle>
                        </asp:BoundField>
                                                
                        <asp:BoundField DataField="PGNO" SortExpression="PGNO" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">                       

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="40px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="LINEPHOT" SortExpression="HLINE" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">                        

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="110px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="EDITION" SortExpression="EDITION" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="75px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="75px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="RATE" SortExpression="STATUS"  ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">                        

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="30px"></ItemStyle>
                        </asp:BoundField>
                                                
                        <asp:BoundField DataField="REMARKS" SortExpression="REMARKS" DataFormatString="{0:dd-MMM-yy}"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="120px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="STATUS" SortExpression="REMARKS" 
                            DataFormatString="{0:dd-MMM-yy}" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="50px"></ItemStyle>
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="JOINTNEWS" SortExpression="JOINTNEWS" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                         ReadOnly="True" ItemStyle-Font-Size="10"
                        ItemStyle-Width="20px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" 
                        ItemStyle-BackColor="#FFCCFF" >                        
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" BorderColor="Gray" 
                            BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="10pt" 
                            Width="50px"></ItemStyle>
                     </asp:BoundField>

                 </Columns>
                    
            </asp:GridView>
       
       </div>
       
    </div>
    <div id="divVendor" style="position:absolute; height:590px;width:620px; margin-left:300px; margin-top:20px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
    <asp:Label ID="lblClose"  runat="server" Text="X" onclick="javascript:hideDiv();"  style="position:absolute; color:Red; cursor:pointer; margin-left:600px; margin-top:0px;"></asp:Label>
    
    <asp:Label ID="Label1"  runat="server" CssClass="labelTextField" Text="Search by ID/NAME"  style="position:absolute; top:13px; left:10px;"  ></asp:Label>
    <asp:TextBox ID="txtVSearch" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtVSearch_TextChanged"  style="position:absolute; top:10px; left:160px; width:150px; " ></asp:TextBox>
    
    <div id="div1" style="position:absolute; height:500px;width:600px; margin-left:0px; margin-top:50px; z-index:30px; background:#F0F6F8;  overflow:scroll; ">
     <asp:GridView ID="grdVendor" runat="server" Style="position: absolute; top:0px;
                left:0px; height:auto; width:600px;font-family: prothoma; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"
                RowStyle-HorizontalAlign="Left" PageSize="50" onselectedindexchanging="grdVendor_SelectedIndexChanging"
                onrowcreated="grdVendor_RowCreated" >

                <Columns>
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Select" Font-Names="Verdana" ></asp:LinkButton>
                         </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="ID" SortExpression="ID" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" /> 

                        <asp:BoundField DataField="NAME" SortExpression="NAME" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="VENDNAME" SortExpression="VENDNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                       

                </Columns>

         </asp:GridView>
    </div>

    </div>

   <div id="Calendar">

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 
       

        <cc1:CalendarExtender ID="calendarOrderDate" runat="server"  TargetControlID="txtTransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
       
   </div>
    </form>
</body>
</html>
