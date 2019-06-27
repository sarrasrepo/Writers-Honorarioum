<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComponentSetup.aspx.cs" Inherits="ComponentSetup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: GL Head Setup :::</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-1.10.3.js" type="text/javascript"></script>
    <script src="Scripts/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    <link href="jquery-ui-1.10.3.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript" language="javascript">


         function GlHeadFinder() {
             document.getElementById('divGlHead').style.display = 'block';
             document.getElementById('<%= txtGlSearch.ClientID %>').focus();
         }
         function hideDiv() 
         {
             document.getElementById('divGlHead').style.display = 'none';
         }        

         //window.onbeforeunload = confirmExit;
         function reLoad() {
             
             window.location("logout.aspx");
         }

         function chkField() 
         {
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
        style="position:absolute; top:10px; left:1238px; height:30px; width:70px;" ></asp:LinkButton>
    <asp:LinkButton ID="LinkButton1" runat="server" Text="Back" 
        PostBackUrl="~/Home.aspx" 
        
        style="position:absolute; top:10px; left:1150px; height:25px; width:50px; "  ></asp:LinkButton>
    <%--<div id="divSearchWriter" style="position:absolute; top:0px; left:0px; height:250px; width:300px; border:1px solid red; text-align:left; overflow:auto; z-index:20;  display:none; ">         
    </div>--%>
    <asp:LinkButton ID="lnkBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:20px; left:1040px; height:25px; width:50px; "  ></asp:LinkButton>
    <div style="position:absolute; height:650px;width:911px; margin-left:300px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -95px;" 
        class="style1">
        
        <div style="position:absolute; height:30px;width:900px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">GL Head Setup</div>
        <asp:Label ID="lblWelcome"  runat="server" CssClass="labelTextField"  Text="Welcome :"
            style="position:absolute; font-style:italic; top:5px; left:376px;"  ></asp:Label>
        <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  
            style="position:absolute; font-style:italic; top:5px; left:449px;"  ></asp:Label>

        <%--<asp:Label ID="lblUserGroup"  runat="server" CssClass="labelTextField"  
            style="position:absolute; font-style:italic; top:5px; left:739px;"  ></asp:Label>--%>
        <asp:Label ID="lblComponentID"  runat="server" CssClass="labelTextField" Text="ComponentID"  
            style="position:absolute; top:38px; left:10px; right: 872px;"  ></asp:Label>
        <asp:TextBox ID="txtComponentID" runat="server" CssClass="textBox" 
            style="position:absolute; top:34px; left:136px; width:63px; font-family:Verdana; right: 712px; text-align:center; " 
            height="19px"  ></asp:TextBox>

        <asp:Button id="btnNew" CssClass="Submitbutton" runat="server" Text="+" 
            style="position:absolute; top:38px; left:207px; height:20px; width:25px; font-weight:bold;" 
            onclick="btnNew_Click" />
                    
        <asp:Label ID="lblRate"  runat="server" CssClass="labelTextField" Text="Component Name"  
            style="position:absolute; top:78px; left:9px; "  ></asp:Label>
        <asp:TextBox ID="txtComponentName" runat="server" CssClass="textBox" 
            style="position:absolute; top:74px; left:136px; width:523px; font-family:Verdana; right: 252px;" 
            height="19px"  ></asp:TextBox>               
        
        <asp:Label ID="lblGlHead"  runat="server" CssClass="labelTextField" Text="Gl Head"  
            style="position:absolute; top:38px; left:240px; right: 622px;"  ></asp:Label>

        <asp:Button id="btnFinder" CssClass="Submitbutton" runat="server" Text="Find" onclientclick="javascript:GlHeadFinder();"
            style="position:absolute; top:33px; left:297px; height:25px; width:50px;" 
            onclick="btnFinder_Click"/>

        <asp:TextBox ID="txtGlHead" runat="server" autocomplete="off" 
            CssClass="textBox" ReadOnly="true"              
            style="position:absolute; font-size:10px; top:33px; left:353px; width:130px; text-align:center; " ></asp:TextBox>

        <asp:TextBox ID="txtGlHeadDesc" runat="server" autocomplete="off"  
            CssClass="textBox" ReadOnly="true"
            style="position:absolute; top:33px; left:488px; width:365px; " ></asp:TextBox>
        <%--<asp:TextBox ID="txtHdnSL" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>--%>
        
        <%--<asp:TextBox ID="txtStatus" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>--%>

        <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server" Text="Add" onclientclick="javascript: return chkField();"
            style="position:absolute; top:124px; left:137px; height:30px; width:70px;" 
            onclick="btnAdd_Click"/>

        <asp:Button id="btnEdit" CssClass="Submitbutton" runat="server" Text="Update" 
            style="position:absolute; top:124px; height:30px; width:70px; left: 137px;" 
            onclick="btnEdit_Click" />

        <asp:Button id="btnDelete" CssClass="Submitbutton" runat="server" Text="Delete" onclientclick="confirm('Press OK to Delete');"
            style="position:absolute; top:125px; left:237px; height:30px; width:70px;" 
            onclick="btnDelete_Click"/>

        <asp:TextBox ID="txtSl" runat="server" autocomplete="off"   Visible="false" 
            CssClass="textBox" ReadOnly="true"
            style="position:absolute; top:73px; left:698px; width:205px; font-family:Prothoma;  " 
            Font-Size="15pt" ></asp:TextBox>

       <div style="position:absolute; height:30px;width:896px; left:0px; color:#2A120A; font-weight:bold; top:200px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px; ">DETAILS </div>
       <%--<div style="position:absolute; height:30px;width:900px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">LINEAGE BILL ENTRY</div>--%>
       <div style="position:absolute; height:412px; width:910px; left:0px; margin-top:285px; overflow:scroll; background:#F0F6F8; top: -54px;">
      
       <asp:GridView ID="grdDetails" runat="server" 
               Style="position: absolute; border: 0px solid #ADB1AF; top:6px;
                left:0px; height:auto; width:880px; font-family:Prothoma;  font-size: 11px; color: Black;  position: absolute; overflow:auto; " 
               AutoGenerateColumns="False" CellSpacing="1" AllowSorting = "True" ShowHeader="False" 
                RowStyle-HorizontalAlign="Left" PageSize="50"
                onrowcreated="grdDetails_RowCreated" 
                onrowdatabound="grdDetails_RowDataBound" 
                onselectedindexchanging="grdDetails_SelectedIndexChanging" >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                                 
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="10px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonSelect" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Select" ></asp:LinkButton>
                            </ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="10px"></ItemStyle>
                        </asp:TemplateField>

                        <asp:BoundField DataField="SL" SortExpression="SL"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="COMPID" SortExpression="COMPID" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="30px"></ItemStyle>
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="COMPNAME" SortExpression="COMPNAME" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="150px" ></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="GLHEAD" SortExpression="GLHEAD" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="50px" ></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="ACCTDESC" SortExpression="ACCTDESC" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="130px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="130px" ></ItemStyle>
                        </asp:BoundField>
                        
                 </Columns>
                    
            </asp:GridView>
       
       </div>
       
    </div>

    <div id="divGlHead" style="position:absolute; height:590px;width:620px; margin-left:300px; margin-top:20px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
    <asp:Label ID="lblClose"  runat="server" Text="X" onclick="javascript:hideDiv();"  style="position:absolute; color:Red; cursor:pointer; margin-left:600px; margin-top:0px;"></asp:Label>
    
    <asp:Label ID="Label1"  runat="server" CssClass="labelTextField" Text="Search by ID/NAME"  style="position:absolute; top:13px; left:10px;"  ></asp:Label>
    <asp:TextBox ID="txtGlSearch" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtGlSearch_TextChanged"  style="position:absolute; top:10px; left:160px; width:150px; " ></asp:TextBox>
    <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="Submitbutton" AutoPostBack="true" OnTextChanged="txtGlSearch_TextChanged"  style="position:absolute; top:10px; left:320px; width:30px; height:25px; " ></asp:Button>

    <div id="div1" style="position:absolute; height:500px;width:600px; margin-left:0px; margin-top:50px; z-index:30px; background:#F0F6F8;  overflow:scroll; ">
     <asp:GridView ID="grdGlHead" runat="server" Style="position: absolute; top:0px;
                left:0px; height:auto; width:600px;font-family: prothoma; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"
                RowStyle-HorizontalAlign="Left" PageSize="50" onselectedindexchanging="grdGlHead_SelectedIndexChanging"
                onrowcreated="grdGlHead_RowCreated" >

                <Columns>
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Select" Font-Names="Verdana" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="ACCTID" SortExpression="ACCTID" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" /> 

                        <asp:BoundField DataField="ACCTDESC" SortExpression="ACCTDESC" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1"  ItemStyle-BorderColor="Gray"/>

                       
                </Columns>

         </asp:GridView>
    </div>

    </div>
   
   <div id="Calendar">

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 
       

        <%--<cc1:CalendarExtender ID="calendarOrderDate" runat="server"  TargetControlID="txtTransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>--%>
       
   </div>
    </form>
</body>
</html>
