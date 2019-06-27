<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: Home Page :::</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        
</head>
<body>
    <form id="form1" runat="server">
    <asp:LinkButton ID="linkButtonLogout" Font-Names="Verdana"  PostBackUrl="~/login.aspx"
            runat="server" Text="Logout" 
            
        style="position:absolute; top:32px; left:929px; height:30px; width:70px;" ></asp:LinkButton>
    <div style="position:relative; height:430px;width:500px; float:left; margin-left:400px; margin-top:20px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888;">
        <div style="position:absolute; height:60px;width:490px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">
            <h1 style="position:absolute; color:#ffffff; font-family:vardana, Gadget, sans-serif; top:-10px; left:110px;" >:::MASTER SETUP:::</h1>

    <div style="position:relative; height:313px; width:220px; float:left; margin-left:-20px; margin-top:20px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 60px; left: 32px;">
            
            <h3 style="position:absolute; color:#000000; font-family:vardana, Gadget, sans-serif; top:-10px; left:40px;" >:::WRITERS:::</h3>
            <a href="WritersBill.aspx" class="myButton" style="position:absolute; top:40px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Writers Bill</a>
            <%--<a href="#" class="myButton" style="position:absolute; top:105px; left:10px; width:140px; text-align:center; padding-top:5px;  height:25px;">Lineage Bill</a>--%>
            <a href="userPageAssign.aspx" class="myButton" style="position:absolute; top:75px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Page & Writer Setup</a>
            <a href="PageGLsetup.aspx" class="myButton" style="position:absolute; top:110px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Page GL Head Setup</a>
    </div>

    <div style="position:relative; height:313px; width:220px; float:left; margin-left:215px; margin-top:-317px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 60px; left: 32px;">
            
            <h3 style="position:absolute; color:#000000; font-family:vardana, Gadget, sans-serif; top:-10px; left:40px;" >:::LINEAGE:::</h3>

            <a href="LineageBillPost.aspx" class="myButton" style="position:absolute; top:40px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Physical Checking</a>
            <a href="LineageSalaryPro.aspx" class="myButton" style="position:absolute; top:75px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Process Salary</a>
            <a href="ecomponent.aspx" class="myButton" style="position:absolute; top:107px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Pay Component</a>
            <a href="categorysetup.aspx" class="myButton" style="position:absolute; top:140px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Category</a>
            <a href="Edition.aspx" class="myButton" style="position:absolute; top:175px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Edition</a>
            <a href="Rate.aspx" class="myButton" style="position:absolute; top:207px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Rate Setup</a>
            <a href="componentsetup.aspx" class="myButton" style="position:absolute; top:240px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Component Setup</a>
            <a href="rptLineageSalarySlip.aspx" class="myButton" style="position:absolute; top:273px; left:35px; width:140px; text-align:center; padding-top:5px;  height:25px;">Reports</a>
    </div>
        </div>
    </div>

    </form>
</body>
</html>
