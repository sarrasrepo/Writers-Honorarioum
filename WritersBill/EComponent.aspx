<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EComponent.aspx.cs" Inherits="EComponent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: Linage Process Salary :::</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-1.10.3.js" type="text/javascript"></script>
    <script src="Scripts/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    <link href="jquery-ui-1.10.3.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript">
    
        function writerFinder() {
            document.getElementById('divVendor').style.display = 'block';
            document.getElementById('<%= txtVSearch.ClientID %>').focus();
        }
        function ComponentFinder() {
            document.getElementById('divComponent').style.display = 'block';
            document.getElementById('<%= txtVSearch.ClientID %>').focus();
        }
        
        function hideDiv() {
            document.getElementById('divVendor').style.display = 'none';
        }

        function hideDivTo() {
            document.getElementById('divComponent').style.display = 'none';
        }

        function chkField() {
                    }

        
    </script>
</head>
<body>

    <form id="form1" runat="server">
    <asp:LinkButton ID="lnkBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:10px; left:1080px; height:25px; width:50px; "  ></asp:LinkButton>

    <div style="position:absolute; height:648px; width:750px; margin-left:400px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -95px;" 
        class="style1">
    <div style="position:absolute; height:30px;width:739px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white); border-top-left-radius:7px; border-top-right-radius:7px;">E-Component Setup</div>
    <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  style="position:absolute; font-style:italic; top:5px; left:350px;"  ></asp:Label>
            
        <asp:Label ID="lblVendor"  runat="server" CssClass="labelTextField" Text="Vendor"  
            style="position:absolute; top:39px; left:10px; width: 82px; height: 14px;"  ></asp:Label>

        <asp:TextBox ID="txtVendorId" runat="server" AutoPostBack="true" CssClass="textBox" AutoComplete="off"
            style="position:absolute; top:36px; left:115px; width:60px; " 
            OnTextChanged="txtVendorId_TextChanged"> </asp:TextBox>

            <asp:TextBox ID="txtSl" runat="server" AutoPostBack="true" CssClass="textBox" AutoComplete="off" Visible="false"
            style="position:absolute; top:36px; left:115px; width:60px; " > </asp:TextBox>
                                
        <asp:ImageButton ID="imgCustomerFinder" runat="server" 
            onclick="btnFinder_Click"  ToolTip="Find Agent"  Text="1"
            onclientclick="javascript:writerFinder();" 
            Style="position: absolute; top:37px; width:20px; height:20px; right: 546px; left: 184px;" 
            ImageUrl="~/Images/Finder.jpg"  />
        <asp:TextBox ID="txtVendorName" runat="server" CssClass="textBox"   AutoPostBack="true"   AutoComplete="off"         
            style="position:absolute; top:36px; left:215px; width:270px; right: 26px;" 
            OnTextChanged="txtVendorId_TextChanged"></asp:TextBox>
        
        <asp:Button id="btnNew" CssClass="Submitbutton" runat="server" Text="+" 
            style="position:absolute; top:38px; left:497px; height:20px; width:25px; font-weight:bold; right: 228px;" 
            onclick="btnNew_Click" />

        <asp:Button id="btnGoLoad" CssClass="Submitbutton" runat="server"  Text="Go" 
            style="position:absolute; top:33px; left:535px; height:30px; width:70px;" 
            onclick="btnGoLoad_Click" />
            
            <asp:ImageButton ID="ImageButtonTo" runat="server" 
            onclick="btnFinderTo_Click"  ToolTip="Find Agent"  
            onclientclick="javascript:ComponentFinder();" 
            Style="position: absolute; left:184px; top:77px; width:20px; height:20px;" 
            ImageUrl="~/Images/Finder.jpg"  />

            <asp:Label ID="lblComponentId"  runat="server" CssClass="labelTextField" 
            Text="Component"            
            style="position:absolute; top:79px; left:10px; width: 82px; height: 14px;"  ></asp:Label>

            <asp:TextBox ID="txtComponentId" runat="server" CssClass="textBox" 
            style="position:absolute; top:76px; left:115px; width:60px; " ></asp:TextBox>

            <asp:TextBox ID="txtComponentName" runat="server" CssClass="textBox" 
            style="position:absolute; top:76px; left:214px; width:270px; " ></asp:TextBox>

            <asp:Label ID="lblAmount"  runat="server" CssClass="labelTextField" 
            Text="Amount"
            
            style="position:absolute; top:121px; left:10px; width: 82px; height: 14px;"  ></asp:Label>

            <asp:TextBox ID="txtAmount" runat="server" CssClass="textBox" autoComplete="off"
            style="position:absolute; top:117px; left:114px; width:100px; " ></asp:TextBox>

        <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server"  
            Text="Add" onclientclick="javascript: return chkField(); "
            style="position:absolute; top:115px; left:235px; height:30px; width:70px;" 
            onclick="btnAdd_Click" />
            <%--onclientclick="confirm('Press OK to Delete');"--%>

        <asp:Button id="BtnUpdate" CssClass="Submitbutton" runat="server" Text="Update" 
            style="position:absolute; top:115px; left:325px; height:30px; width:70px;" 
            onclick="btnUpdate_Click" />

     <div style="position:absolute; height:30px;width:740px; left:0px; color:#2A120A; font-weight:bold; top:200px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px; ">DETAILS </div>
      <div style="position:absolute; height:412px; width:740px; left:0px; margin-top:285px; overflow:scroll; background:#F0F6F8; top: -54px;">
     
       <asp:GridView ID="grdDetails" runat="server" 
               Style="position: absolute; border: 0px solid #ADB1AF; top:6px;
                left:0px; height:auto; width:725px; font-family:Prothoma;  font-size: 11px; color: Black;  position: absolute; overflow:auto; " 
               AutoGenerateColumns="False" CellSpacing="1" AllowSorting = "True" ShowHeader="False" 
                RowStyle-HorizontalAlign="Left" PageSize="50"
                onrowcreated="grdDetails_RowCreated" 
                onrowdatabound="grdDetails_RowDataBound" 
                onselectedindexchanging="grdDetails_SelectedIndexChanging" >
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        
                        <asp:TemplateField HeaderText="" ItemStyle-Width="10px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonSubmit" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Select" ></asp:LinkButton>
                            </ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="10px"></ItemStyle>
                        </asp:TemplateField>
       
                        <asp:BoundField DataField="SL" SortExpression="SL" 
                            ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray"> 
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="20px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="COMPID" SortExpression="COMPID" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="COMPNAME" SortExpression="COMPNAME" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="130px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="130px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="AMOUNT" SortExpression="AMOUNT" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>
             
                 </Columns>
                    
            </asp:GridView>
       
       </div>


    <div id="divVendor" style="position:absolute; height:590px;width:620px; margin-left:-50px; margin-top:0px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
    <asp:Label ID="lblClose"  runat="server" Text="X" onclick="javascript:hideDiv();"  style="position:absolute; color:Red; cursor:pointer; margin-left:600px; margin-top:0px;"></asp:Label>
    
    <asp:Label ID="Label1"  runat="server" CssClass="labelTextField" Text="Search by ID/NAME"  style="position:absolute; top:13px; left:10px;"  ></asp:Label>
    <asp:TextBox ID="txtVSearch" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtVSearch_TextChanged"  style="position:absolute; top:10px; left:160px; width:150px; " ></asp:TextBox>
    <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="Submitbutton" AutoPostBack="true" OnTextChanged="txtVSearch_TextChanged"  style="position:absolute; top:10px; left:320px; width:30px; height:25px; " ></asp:Button>

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

                        <asp:BoundField DataField="VENDNAME" SortExpression="VENDNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-Font-Size="10" ItemStyle-BorderColor="Gray"/>
                       

                </Columns>

         </asp:GridView>
    </div>

    </div>

    <div id="divComponent" style="position:absolute; height:590px;width:620px; margin-left:-50px; margin-top:0px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
    <asp:Label ID="Label2"  runat="server" Text="X" onclick="javascript:hideDivTo();"  style="position:absolute; color:Red; cursor:pointer; margin-left:600px; margin-top:0px;"></asp:Label>
    
    <asp:Label ID="Label3"  runat="server" CssClass="labelTextField" Text="Search by ID/NAME"  style="position:absolute; top:13px; left:10px;"  ></asp:Label>
    <asp:TextBox ID="txtComponentSearch" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtComponentSearch_TextChanged"  style="position:absolute; top:10px; left:160px; width:150px; " ></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Go" CssClass="Submitbutton" AutoPostBack="true" OnTextChanged="txtComponentSearch_TextChanged"  style="position:absolute; top:10px; left:320px; width:30px; height:25px; " ></asp:Button>

    <div id="div3" style="position:absolute; height:500px;width:600px; margin-left:0px; margin-top:50px; z-index:30px; background:#F0F6F8;  overflow:scroll; ">
     <asp:GridView ID="grdComponent" runat="server" Style="position: absolute; top:0px;
                left:0px; height:auto; width:600px;font-family: prothoma; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"
                RowStyle-HorizontalAlign="Left" PageSize="50" onselectedindexchanging="grdComponent_SelectedIndexChanging"
                onrowcreated="grdComponent_RowCreated" >

                <Columns>
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Select" Font-Names="Verdana" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="COMPID" SortExpression="COMPID" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" /> 

                        <asp:BoundField DataField="COMPNAME" SortExpression="COMPNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-Font-Size="10" ItemStyle-BorderColor="Gray"/>

                </Columns>

         </asp:GridView>
    </div>

    </div>
    </div>


    <div id="Calendar">
        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

       <%-- <cc1:CalendarExtender ID="calendarOrderDate" runat="server"  TargetControlID="txtTransDateFrom" 
        PopupButtonID="imgCalendarFrom" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>--%>
       <%-- <cc1:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="txtTransDateTo" 
        PopupButtonID="imgCalendarTo" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
       --%>
   </div>

    </form>
</body>
</html>
