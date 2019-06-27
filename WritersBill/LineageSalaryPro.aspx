<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LineageSalaryPro.aspx.cs" Inherits="LineageSalaryPro" %>

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

        function chkField() {
            if (document.getElementById('<%= txtTransDate.ClientID %>').value == "") {
                alert('Select transaction date....');
                return false;
            }
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
    <div style="position:absolute; height:30px;width:500px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">LINAGE PROCESS SALARY</div>
    <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  style="position:absolute; font-style:italic; top:5px; left:350px;"  ></asp:Label>

    <asp:Label ID="lblDate"  runat="server" CssClass="labelTextField" 
            Text="Date"  
            style="position:absolute; top:35px; left:10px; width: 82px;"  ></asp:Label>
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox"   AutoPostBack="true"
            style="position:absolute; top:33px; left:115px; width:140px; " 
            ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" 
            Style="position: absolute; left:265px; top:35px; width:23px; height:20px;" 
            ImageUrl="~/Images/Calendar.jpg" />
                    
        <asp:CheckBox ID="chkRegularSalary" runat="server"   Text="RegularSalary" style="position:absolute; top:80px; left:110px;" />
        <asp:CheckBox ID="chkLine" runat="server" Text="Linage Bill" style="position:absolute; top:110px; left:110px;" />
        <asp:CheckBox ID="chkPhoto" runat="server" Text="Photo Bill" style="position:absolute; top:140px; left:110px;" />

        <asp:Button id="btnProcess" CssClass="Submitbutton" runat="server"  
            Text="Process" onclientclick="javascript: return chkField(); "
            style="position:absolute; top:180px; left:115px; height:30px; width:70px;" 
            onclick="btnProcess_Click" />
            <%--onclientclick="confirm('Press OK to Delete');"--%>
    </div>


    <div id="Calendar">
        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 
        <cc1:CalendarExtender ID="calendarOrderDate" runat="server"  TargetControlID="txtTransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
       
   </div>

    </form>
</body>
</html>
