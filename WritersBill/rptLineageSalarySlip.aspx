<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rptLineageSalarySlip.aspx.cs" Inherits="rptLineageSalarySlip" %>

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
        function writerFinderTo() {
            document.getElementById('divVendorTo').style.display = 'block';
            document.getElementById('<%= txtVSearch.ClientID %>').focus();
        }
        
        function hideDiv() {
            document.getElementById('divVendor').style.display = 'none';
        }

        function hideDivTo() {
            document.getElementById('divVendorTo').style.display = 'none';
        }

        function chkField() {
                    }

        
//        function Confirmed() {
//            alert('Salary Processed Succesfully...');
//            return true;

//        }

//        $(document).ready(function () {
//            $('#btnProcess').click(function () {
//                showDialog('#Munna');
//            });
        //        });
        
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <%--<asp:LinkButton ID="LinkButton1" runat="server" Text="Back" 
        PostBackUrl="~/Home.aspx" 
        style="position:absolute; top:20px; left:950px; height:25px; width:50px; "  ></asp:LinkButton>--%>
    <asp:LinkButton ID="lnkBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:10px; left:950px; height:25px; width:50px; "  ></asp:LinkButton>

    <div style="position:absolute; height:300px;width:511px; margin-left:500px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -95px;" 
        class="style1">
    <div style="position:absolute; height:30px;width:500px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white); border-top-left-radius:7px; border-top-right-radius:7px;">LINAGE REPORT</div>
    <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  style="position:absolute; font-style:italic; top:5px; left:350px;"  ></asp:Label>

    <asp:Label ID="lblDateFrom"  runat="server" CssClass="labelTextField" 
            Text="Date"  style="position:absolute; top:35px; left:10px; width: 82px;"  ></asp:Label>
        <asp:TextBox ID="txtTransDateFrom" runat="server" CssClass="textBox"   
            style="position:absolute; top:33px; left:115px; width:140px; " ></asp:TextBox>
        <asp:Image ID="imgCalendarFrom" runat="server" ToolTip="Select Date" 
            Style="position: absolute; left:265px; top:35px; width:23px; height:20px;" 
            ImageUrl="~/Images/Calendar.jpg" />

        <asp:TextBox ID="txtTransDateTo" runat="server" CssClass="textBox"   
            style="position:absolute; top:33px; left:315px; width:140px; " ></asp:TextBox>
        <asp:Image ID="imgCalendarTo" runat="server" ToolTip="Select Date" 
            Style="position: absolute; left:467px; top:35px; width:23px; height:20px;" 
            ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblVendor"  runat="server" CssClass="labelTextField" 
            Text="Vendor"  
            style="position:absolute; top:89px; left:10px; width: 82px;"  ></asp:Label>
        <asp:TextBox ID="txtVendorFrom" runat="server" CssClass="textBox"   
            
            style="position:absolute; top:86px; left:115px; width:140px; right: 256px;" ></asp:TextBox>
            
            <asp:ImageButton ID="imgCustomerFinder" runat="server" 
            onclick="btnFinder_Click"  ToolTip="Find Agent"  Text="1"
            onclientclick="javascript:writerFinder();" 
            Style="position: absolute; left:265px; top:87px; width:20px; height:20px; right: 226px;" 
            ImageUrl="~/Images/Finder.jpg"  />

            <asp:ImageButton ID="ImageButtonTo" runat="server" 
            onclick="btnFinderTo_Click"  ToolTip="Find Agent"  
            onclientclick="javascript:writerFinderTo();" 
            Style="position: absolute; left:474px; top:87px; width:20px; height:20px;" 
            ImageUrl="~/Images/Finder.jpg"  />

            <asp:TextBox ID="txtVendorTo" runat="server" CssClass="textBox" 
            style="position:absolute; top:86px; left:315px; width:140px; " ></asp:TextBox>

            <asp:Label ID="lblReportName"  runat="server" CssClass="labelTextField" Text="Report Name"  
            style="position:absolute; top:138px; left:10px; width: 82px;"  ></asp:Label>
   
            <asp:DropDownList ID="ddlReportName"  runat="server" CssClass="dropdownlist" 
            style="position:absolute; top:135px; left:114px; width:158px;  text-align:center;" >
                <asp:ListItem>Pay Slip</asp:ListItem>
                <asp:ListItem>Payment Statement</asp:ListItem>                
            </asp:DropDownList>


                    
        <%--<asp:CheckBox ID="chkRegularSalary" runat="server"   Text="RegularSalary" style="position:absolute; top:80px; left:110px;" />
        <asp:CheckBox ID="chkLine" runat="server" Text="Line" style="position:absolute; top:110px; left:110px;" />
        <asp:CheckBox ID="chkPhoto" runat="server" Text="Photo" style="position:absolute; top:140px; left:110px;" />--%>

        <asp:Button id="btnPreview" CssClass="Submitbutton" runat="server"  
            Text="Preview" onclientclick="javascript: return chkField(); "
            style="position:absolute; top:199px; left:115px; height:30px; width:70px;" 
            onclick="btnPreview_Click" />
            <%--onclientclick="confirm('Press OK to Delete');"--%>


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

                        <%--<asp:BoundField DataField="NAME" SortExpression="NAME" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-Font-Size="15" ItemStyle-BorderColor="Gray"/>--%>

                        <asp:BoundField DataField="VENDNAME" SortExpression="VENDNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-Font-Size="10" ItemStyle-BorderColor="Gray"/>
                       

                </Columns>

         </asp:GridView>
    </div>

    </div>

    <div id="divVendorTo" style="position:absolute; height:590px;width:620px; margin-left:-50px; margin-top:0px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
    <asp:Label ID="Label2"  runat="server" Text="X" onclick="javascript:hideDivTo();"  style="position:absolute; color:Red; cursor:pointer; margin-left:600px; margin-top:0px;"></asp:Label>
    
    <asp:Label ID="Label3"  runat="server" CssClass="labelTextField" Text="Search by ID/NAME"  style="position:absolute; top:13px; left:10px;"  ></asp:Label>
    <asp:TextBox ID="txtVToSearch" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtVToSearch_TextChanged"  style="position:absolute; top:10px; left:160px; width:150px; " ></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Go" CssClass="Submitbutton" AutoPostBack="true" OnTextChanged="txtVToSearch_TextChanged"  style="position:absolute; top:10px; left:320px; width:30px; height:25px; " ></asp:Button>

    <div id="div3" style="position:absolute; height:500px;width:600px; margin-left:0px; margin-top:50px; z-index:30px; background:#F0F6F8;  overflow:scroll; ">
     <asp:GridView ID="grdVendorTo" runat="server" Style="position: absolute; top:0px;
                left:0px; height:auto; width:600px;font-family: prothoma; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"
                RowStyle-HorizontalAlign="Left" PageSize="50" onselectedindexchanging="grdVendorTo_SelectedIndexChanging"
                onrowcreated="grdVendorTo_RowCreated" >

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
    </div>


    <div id="Calendar">
        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarOrderDate" runat="server"  TargetControlID="txtTransDateFrom" 
        PopupButtonID="imgCalendarFrom" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="txtTransDateTo" 
        PopupButtonID="imgCalendarTo" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
       
   </div>

    </form>
</body>
</html>
