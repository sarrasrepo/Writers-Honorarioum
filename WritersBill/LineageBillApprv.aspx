<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LineageBillApprv.aspx.cs" Inherits="LineageBillApprv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: Physical Checking :::</title>
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
             if (document.getElementById('<%= ddlStatus.ClientID %>').value == "") {
                 alert('Input amount....');
                 return false;
             }

         }


//                 function startCalc() {
//                     alert('Test');
//                     var grid = document.getElementById("<%= grdDetails.ClientID%>");
//                     for (var i = 0; i < grid.rows.length - 1; i++) {
//                         var rate = $("input[id*=txtRateGr]");
//                         var qty = $("input[id*=txtApprvLinePhoto]");
//                         var totalamount = rate[i].value * qty[i].value;
//                         $("input[id*=txtApprvAmnd]") = totalamount[i].value;
//                         
//                     }
//                 }l


         function CalculateTotals() {
             lP = document.getElementsByClassName("linePhoto");
             rt = document.getElementsByClassName("rate");
             aM = document.getElementsByClassName("apvAmount");


             for (var i = 0; i < lP.length; i++) {
                 //get line/photo
                 qty = lP[i].value;

                 //get the rate
                 rate = rt[i].innerHTML;

                 //calculate the amount and display
                 amount = parseInt(qty) * parseFloat(rate);

                 if (isNaN(amount)) aM[i].innerHTML = 0;
                 else aM[i].innerHTML = amount;
             }


         }

//                 function CalculateTotals() {
//                     var gv = document.getElementById("<%= grdDetails.ClientID %>");
//                     var tb = gv.getElementsByTagName("input");
//                     var lb = gv.getElementsByTagName("span");

//                     var sub = 0;
//                     //var total = 0;
//                     var indexQ = 1;
//                     var indexP = 0;

//                     for (var i = 0; i < tb.length; i++) {
//                         if (tb[i].type == "text") {
//                             sub = parseFloat(lb[indexP].innerHTML) * parseFloat(tb[i].value);
//                             
//                             if (isNaN(sub)) {
//                                 lb[i + indexQ].innerHTML = "";
//                                 sub = 0;
//                             }
//                             else {
//                                 lb[i + indexQ].innerHTML = sub;
//                             }

//                             indexQ++;
//                             indexP = indexP + 2;

//                             //total += parseFloat(sub);
//                         }
//                     }
//                     //lb[lb.length - 1].innerHTML = total;
//                 }
                 

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
    <asp:LinkButton ID="lnkBack" runat="server" Text="Back" 
        PostBackUrl="~/Home.aspx" 
        style="position:absolute; top:20px; left:1140px; height:25px; width:50px; "  ></asp:LinkButton>
    <%--<div id="divSearchWriter" style="position:absolute; top:0px; left:0px; height:250px; width:300px; border:1px solid red; text-align:left; overflow:auto; z-index:20;  display:none; ">         
    </div>--%>
    <div style="position:absolute; height:648px;width:911px; margin-left:300px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -95px;" 
        class="style1">
        
        <div style="position:absolute; height:30px;width:900px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">LINAGE BILL APPROVE</div>
        <asp:Label ID="lblWelcome"  runat="server" CssClass="labelTextField"  Text="Welcome :"
            style="position:absolute; font-style:italic; top:5px; left:376px;"  ></asp:Label>
        <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  
            style="position:absolute; font-style:italic; top:5px; left:449px;"  ></asp:Label>

        <asp:Label ID="lblUserGroup"  runat="server" CssClass="labelTextField"  
            style="position:absolute; font-style:italic; top:5px; left:719px;"  ></asp:Label>
        <asp:Label ID="lblPubDate"  runat="server" CssClass="labelTextField" 
            Text="Publish Date"  
            style="position:absolute; top:35px; left:10px; width: 82px;"  ></asp:Label>
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox"   
            style="position:absolute; top:33px; left:105px; width:140px; " 
            ontextchanged="txtTransDate_TextChanged" ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" 
            Style="position: absolute; left:256px; top:35px; width:23px; height:20px;" 
            ImageUrl="~/Images/Calendar.jpg" />

        <asp:TextBox ID="txtTransDateTo" runat="server" CssClass="textBox"   
            style="position:absolute; top:68px; left:105px; width:140px; " 
            ontextchanged="txtTransDate_TextChanged"></asp:TextBox>
        <asp:Image ID="imgCalendarTo" runat="server" ToolTip="Select Date" 
            Style="position: absolute; left:257px; top:72px; width:23px; height:20px;" 
            ImageUrl="~/Images/Calendar.jpg" />
            
        <asp:Label ID="lblStatus"  runat="server" CssClass="labelTextField" Text="Status"
            style="position:absolute; top:36px; left:403px; width: 59px; right: 449px;"  ></asp:Label>
        <%--<asp:TextBox ID="txtPamount" runat="server" CssClass="textBox"  style="position:absolute; top:93px; left:90px; width:170px; font-family:Prothoma; " ></asp:TextBox>--%>
        <asp:DropDownList ID="ddlStatus"  runat="server"   CssClass="dropdownlist" 
            style="position:absolute; top:32px; left:475px; width:140px;  text-align:center;" 
            OnSelectedIndexChanged="ddlStatus_TextChanged"  ></asp:DropDownList>

        <asp:Label ID="lblEdition"  runat="server" CssClass="labelTextField" Text="Edition"
            style="position:absolute; top:73px; left:403px; width: 61px; right: 447px;"  ></asp:Label>        
        <asp:DropDownList ID="ddlEdition"  runat="server"   CssClass="dropdownlist" 
            style="position:absolute; top:70px; left:475px; width:140px;  text-align:center;" 
            OnSelectedIndexChanged="ddlEdition_TextChanged"  ></asp:DropDownList>

            <asp:Label ID="lblCategory"  runat="server" CssClass="labelTextField" Text="Category"
            
            
            
            style="position:absolute; top:112px; left:403px; width: 61px; right: 447px;"  ></asp:Label>        
        <asp:DropDownList ID="ddlCategory"  runat="server"   CssClass="dropdownlist" 
            style="position:absolute; top:108px; left:475px; width:140px;  text-align:center;" 
            OnSelectedIndexChanged="ddlEdition_TextChanged"  ></asp:DropDownList>

        <asp:TextBox ID="txtHdnSL" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px;visibility:hidden; " ></asp:TextBox>
        <%--<asp:TextBox ID="txtHdnWCODE" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:70px; width:50px; display:none; " ></asp:TextBox>--%>
        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:30px; width:50px; display:none; " ></asp:TextBox>
        <asp:TextBox ID="txtApvLinePhoto" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:80px; width:80px; visibility:hidden; " ></asp:TextBox>
        <asp:TextBox ID="txtPageNo" runat="server" CssClass="textBox"  style="position:absolute; top:60px; left:80px; width:80px; visibility:hidden;  " ></asp:TextBox>
        <asp:TextBox ID="txtApprvAmnt" runat="server" CssClass="textBox"  
            style="position:absolute; top:160px; left:200px; width:150px; visibility:hidden; " 
             ></asp:TextBox>

             <asp:TextBox ID="txtRate" runat="server" CssClass="textBox"  
            style="position:absolute; top:160px; left:200px; width:150px; visibility:hidden; " 
             ></asp:TextBox>
        
        <asp:Button id="btnFinder" CssClass="Submitbutton" runat="server" Text="Find" onclientclick="javascript:writerFinder();"
            style="position:absolute; top:108px; left:335px; height:25px; width:50px;" 
            onclick="btnFinder_Click"/>

        <asp:TextBox ID="txtHdnWCODE" runat="server" autocomplete="off" CssClass="textBox" ReadOnly="true"  
            style="position:absolute; font-size:10px; top:107px; left:104px; width:50px; right: 757px;" 
            BackColor="#FFFF66" ></asp:TextBox>
        <asp:TextBox ID="txtWriterName" runat="server" autocomplete="off" CssClass="textBox" ReadOnly="true"
            style="position:absolute; top:107px; left:156px; width:170px; font-family:Prothoma;  " 
            Font-Size="15pt" ></asp:TextBox>
            
        <asp:Button id="btnGo" CssClass="Submitbutton" runat="server" Text="Go" 
            style="position:absolute; top:147px; left:104px; height:25px; width:50px;" 
            OnClick="btnGo_Click"/>

       <div style="position:absolute; height:30px;width:896px; left:0px; color:#2A120A; font-weight:bold; top:180px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px; ">DETAILS </div>
       <%--<div style="position:absolute; height:30px;width:900px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">LINEAGE BILL ENTRY</div>--%>
       <div style="position:absolute; height:435px; width:908px; left:2px; margin-top:285px; overflow:scroll; background:#F0F6F8; top: -77px;">
      

       <asp:GridView ID="grdDetails" runat="server" 
               Style="position: absolute; border: 0px solid #ADB1AF; top:2px;
                left:2px; height:auto; width:884px; font-family:Prothoma;  font-size: 11px; color: Black;  position: absolute; overflow:auto; bottom: 381px;" 
               AutoGenerateColumns="False" CellSpacing="1" AllowSorting = "True" ShowHeader="False" 
                RowStyle-HorizontalAlign="Left" PageSize="50"
                onrowcreated="grdDetails_RowCreated" 
                onrowdatabound="grdDetails_RowDataBound" 
                onselectedindexchanging="grdDetails_SelectedIndexChanging" >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                
                        <asp:BoundField DataField="TRANSDATE" SortExpression="TRANSDATE" 
                            ItemStyle-Font-Names="Verdana" DataFormatString="{0:dd-MMM-yy}"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray"> 
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="70px"></ItemStyle>
                        </asp:BoundField>
                                
                        <asp:BoundField DataField="EDITION" SortExpression="EDITION" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-Height="22px" 
                         ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                         ItemStyle-BorderColor="Gray">
                                                
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Height="22px" Width="10px"></ItemStyle>
                     </asp:BoundField>
                                                
                        <asp:BoundField DataField="SL" SortExpression="SL"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" 
                         ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                         ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                     </asp:BoundField>

                        <asp:BoundField DataField="LINEPHOT" SortExpression="LINEPHOT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="110px"></ItemStyle>
                     </asp:BoundField>
                                                
                            <asp:TemplateField  ItemStyle-Font-Names="Verdana">
                                <ItemTemplate>                            
                                    <asp:TextBox ID="txtPgNo" runat="server" Width="40px" BorderStyle="None" style="Text-Align:Center" autocomplete="off" BackColor="Pink" Text='<%# Eval("PGNO") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                        <asp:BoundField DataField="HLINE" SortExpression="HLINE" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="300px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-Font-Size="15" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Size="15pt" Width="300px"></ItemStyle>
                     </asp:BoundField>

                        <asp:BoundField DataField="CRNAME" SortExpression="CRNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 
                        
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="150px"></ItemStyle>
                     </asp:BoundField>
                        
                        <asp:BoundField DataField="PNOLINEPHOT" SortExpression="PNOLINEPHOT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                         ReadOnly="true" ItemStyle-Font-Size="8"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"  >                        
                                                
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="8pt" Width="50px"></ItemStyle>
                     </asp:BoundField>
                                                
                        <asp:BoundField DataField="PAMOUNT" SortExpression="PAMOUNT" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                         ReadOnly="true" ItemStyle-Font-Size="8"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="8pt" Width="50px"></ItemStyle>
                     </asp:BoundField>
                        
                        <asp:BoundField DataField="RATE" SortExpression="RATE" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                         ReadOnly="True" ItemStyle-Font-Size="10"
                        ItemStyle-Width="20px" ItemStyle-BorderStyle="Solid" 
                         ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" 
                         ItemStyle-BackColor="#FFCCFF" >
                        
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCCFF" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="10pt" Width="50px"></ItemStyle>
                     </asp:BoundField>
                        
                            <asp:TemplateField  ItemStyle-Font-Names="Verdana">
                            <ItemTemplate>
                            <asp:Label ID="lblRateGr" runat="server" Width="40px" CssClass="rate" style="Text-Align:Center"   Text='<%# Eval("RATE") %>' > </asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Names="Verdana"></ItemStyle>
                            </asp:TemplateField>

                        <asp:TemplateField   >
                        <ItemTemplate>
                        <asp:TextBox ID="txtApprvLinePhoto" runat="server" Width="40px" CssClass="linePhoto" BorderStyle="None" style="Text-Align:Center" autocomplete="off" onkeyup='CalculateTotals()'  BackColor="Pink" Text='<%# Eval("ANOLINEPHOT") %>' />  
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField ItemStyle-Font-Names="Verdana" >
                            <ItemTemplate >
                                <%--<asp:Label ID="txtApprvAmnt" runat="server" Width="40px" style="Text-Align:Center"  BackColor="Pink" Text="<% String.Format("{0:c}", ((Convert.ToInt16(<%# Eval("RATE") %>) * Convert.ToInt16(<%# Eval("ANOLINEPHOT") %>) )  )  %>"></asp:Label>--%>
                                <asp:Label ID="lblApprvAmnd" runat="server" CssClass="apvAmount"  Width="50px" style="Text-Align:Center"   BackColor="" Text='<%# Eval("APVAMOUNT") %>  '> </asp:Label>   
                            </ItemTemplate>
                        <ItemStyle Font-Names="Verdana" Font-Size="10" Font-Bold="true" ></ItemStyle>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Check" ></asp:LinkButton>
                            </ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="30px"></ItemStyle>
                        </asp:TemplateField>

                     <asp:HyperLinkField DataNavigateUrlFields="EPLink" ItemStyle-Font-Names="Verdana" ItemStyle-Width="60px" 
                         SortExpression="EPLink" Text="E-Paper" Target="_blank" >

<ItemStyle Font-Names="Verdana" Width="60px"></ItemStyle>
                     </asp:HyperLinkField>

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
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="txtTransDateTo" PopupButtonID="imgCalendarTo" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
       
       
   </div>
    </form>
</body>
</html>
