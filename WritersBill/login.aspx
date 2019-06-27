<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Writers Bill :: login</title>

    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />   
   
    <script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
    
    <style type="text/css">
        
      
        
    </style>


    <script type="text/javascript">

        $(document).ready(function () {

            $("#shadeBG").css("visibility", "hidden");
            $("#pop").css("visibility", "hidden");

        });

        function forgetLoginInfo() 
        {
            
            $("#shadeBG").css("visibility", "visible");
            $("#pop").css("visibility", "visible");
            
            
        }
                

        function clsPOP() {
            $("#shadeBG").css("visibility", "hidden");
            $("#pop").css("visibility", "hidden");
        }

        function numberOnly() {
            var key_code = window.event.keyCode;
            var oElement = window.event.srcElement;
            if (!window.event.shiftKey && !window.event.ctrlKey && !window.event.altKey) {
                if ((key_code > 47 && key_code < 58) || (key_code > 95 && key_code < 106)) {

                    if (key_code > 95)
                        key_code -= (95 - 47);
                    oElement.value = oElement.value;
                }
                else if (key_code == 8) {
                    oElement.value = oElement.value;
                }
                else if (key_code != 9) {
                    event.returnValue = false;
                    alert('Please input number only....');
                }

            }
        }



        function checkemail() {

            var mailId = document.getElementById('<%= txtEmail.ClientID %>').value;

            var testresults;

            if (mailId != null && mailId != "") {

                var str = document.getElementById('<%= txtEmail.ClientID %>').value;
                var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
                if (filter.test(str))
                    testresults = true
                else {
                    alert("Please input a valid email address!")
                    testresults = false
                }
                return (testresults)
            }
        }

        function checkbae() {
            if (document.layers || document.getElementById || document.all)
                return checkemail()
            else
                return true
        }

       
    </script>

</head>
<body>
    <form id="form1" runat="server">    
    
    <div id="divFrame" class="loginFrm">
    
        <div id="divLogin" style="position:absolute;height:250px; width:400px; background-color:#086A87;">

            <asp:Label ID="lblName"  runat="server" Text="User Name"  style="position:absolute; top:33px; left:40px; color:White;"  ></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="textBox" style="position:absolute; top:30px; left:140px;" AutoComplete="off" ></asp:TextBox>

            <asp:Label ID="lblPassword"  runat="server" Text="Password"  style="position:absolute; top:83px; left:40px; color:White;"  ></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="textBox" TextMode="Password" style="position:absolute; top:80px; left:140px;"  ></asp:TextBox>
            
            <div id="divError" runat="server" visible="false">
                <img  src="Images/xbutton.png" style="position:absolute; height:20px; width:20px; left:40px; top: 112px;"/>

                <asp:Label ID="lblInavlid" runat="server" Text="Invalid Login, Please Try Again !" 
                           style="position:absolute; left:70px; top: 115px; width: 285px; color:Maroon; font-weight:bold; font-size:14px;">
                </asp:Label>
            </div>

            <%--<hr style="position:absolute; top:140px; color:Red;  width:398px; left:0px;" />--%>
            <hr style="position:absolute; top:140px; color:#57677F; width:398px; left:0px;" />

            <asp:Label ID="lblToday" runat="server" CssClass="labelTextField" Text="Today :" style="position:absolute; left:40px; top:165px; color:Black;"></asp:Label>
            <asp:Label ID="lblDate" runat="server" CssClass="labelTextField"  style="position:absolute; left:90px; top:165px; color:White;"></asp:Label>
            
            <asp:Label ID="lblTime" runat="server" CssClass="labelTextField" Text="Now :" style="position:absolute; left:40px; top:185px; color:Black;"></asp:Label>
           
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Timer ID="Timer1" runat="server" Interval="60" OnTick="Timer1_Tick">
            </asp:Timer>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:Label runat="server" ID="lblTime1" Font-Names="Book Antiqua" Font-Size="10"
            ForeColor="White" style="position:absolute; left:90px; top:185px;" />
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            </asp:UpdatePanel>




            <asp:Button id="btnLogin" CssClass="Submitbutton" runat="server" 
            Text="Login" style="position:absolute; top:160px; left:275px; height:30px; width:70px; color:Black;" 
                onclick="btnLogin_Click"  />

            <asp:CheckBox ID="chkKeepMeLogin" runat="server" Text="Remember Me" style="position:absolute; top:208px; left:36px; font-size:13px;" />
            <asp:HyperLink ID="hlForgotPass" NavigateUrl="#" runat="server" Text="Forgot Your Password ?" 
            style="position:absolute; top:210px; left:225px; font-size:12px; color:White;" OnClick="javascript:forgetLoginInfo();"></asp:HyperLink>
        
        </div>

    </div>

    <%--*****************************************************retrive user name & password *********************************************************--%>

        <div id="shadeBG"></div>

        <div id="pop">

            <div id="dghc" style="position:absolute; top:0px; left:0px; height:40px; width:100%; border:0px solid black; background-image:url(Images/labelHeader.png); font-family: Helvetica, Arial;" >
               
                <img src="Images/invalid.png" alt="Close"  style="height:25px; width:25px; margin-left:537px; margin-top:-10px; cursor:hand;" onclick="javascipt:clsPOP();"/>
                 
                <asp:Label ID="Label1"  runat="server" Text="Find Your Account"  style="position:absolute; top:8px; left:10px;"></asp:Label>
            
            </div>

            <asp:Label ID="lblRtvUserName"  runat="server" CssClass="labelTextField" Text="User Name :"  style="position:absolute; top:50px; left:130px;"></asp:Label>
            <asp:TextBox ID="txtRtvUserName" Width="300" runat="server" CssClass="textBox" style="position:absolute; top:75px; left:130px;"  ></asp:TextBox>
            
             <asp:Label ID="lblMobile" CssClass="labelTextField" runat="server" Text="Mobile No. :"  style="position:absolute; top:115px; left:130px;"  ></asp:Label>
            <asp:TextBox ID="txtMobile" runat="server" Width="300" CssClass="textBox" style="position:absolute; top:140px; left:130px;" onkeydown="javascript:numberOnly()"  ></asp:TextBox>

            <asp:Label ID="lblEmail" CssClass="labelTextField" runat="server" Text="Email :"  style="position:absolute; top:180px; left:130px;"  ></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Width="300" CssClass="textBox" style="position:absolute; top:205px; left:130px;" onBlur="javascript: checkemail();" ></asp:TextBox>


            <asp:Button id="btnRtvPassword" CssClass="Submitbutton" runat="server" 
            Text="Submit" 
                style="position:absolute; top:265px; left:335px; height:30px; color:Black;" 
                onclick="btnRtvPassword_Click"  />

           <asp:Label ID="lblError" runat="server" Visible="false" CssClass="labelTextField" Text="Wrong user name or password"></asp:Label>

        </div>

     <%--*****************************************************retrive user name & password *********************************************************--%>

    </form>
</body>
</html>
