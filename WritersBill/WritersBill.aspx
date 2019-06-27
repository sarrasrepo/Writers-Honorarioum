<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WritersBill.aspx.cs" Inherits="WritersBill" %>

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


         function writerFinder() 
         {
             document.getElementById('divVendor').style.display = 'block';
             document.getElementById('<%= txtVSearch.ClientID %>').focus();
         }
         function hideDiv() 
         {
             document.getElementById('divVendor').style.display = 'none';
         }

         
         function chkField() 
         {
             if (document.getElementById('<%= txtTransDate.ClientID %>').value == "") {
                 alert('Select transaction date....');
                 return false;
             }
             if (document.getElementById('<%= txtWriterName.ClientID %>').value == "") {
                 alert('Input writer name....');
                 return false;
             }
             if (document.getElementById('<%= txtHeadLine.ClientID %>').value == "") {
                 alert('Input head line....');
                 return false;
             }
             if (document.getElementById('<%= ddlPageName.ClientID %>').value == "-- Select --") 
             {
                 alert('Select Page....');
                 return false;
             }
             if (document.getElementById('<%= txtPamount.ClientID %>').value == "") {
                 alert('Input amount....');
                 return false;
             }

         }

    </script>
</head>


<body>
    
    <form id="form1" runat="server">
    <%--<div id="divSearchWriter" style="position:absolute; top:0px; left:0px; height:250px; width:300px; border:1px solid red; text-align:left; overflow:auto; z-index:20;  display:none; ">         
    </div>--%>
    <asp:LinkButton ID="lnkBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:20px; left:1040px; height:25px; width:50px; "  ></asp:LinkButton>
    <div style="position:absolute; height:650px;width:938px; margin-left:450px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -238px;">
        
        <div style="position:absolute; height:30px;width:928px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">WRITERS BILL ENTRY</div>
        <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  style="position:absolute; font-style:italic; top:5px; left:550px;"  ></asp:Label>

        <asp:Label ID="lblTransDate"  runat="server" CssClass="labelTextField" Text="Pub.Date"  style="position:absolute; top:35px; left:10px;"  ></asp:Label>
        
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox"   AutoPostBack="true"
            style="position:absolute; top:33px; left:90px; width:140px; " 
            ontextchanged="txtTransDate_TextChanged" ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:233px; top:35px; width:23px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />
        
        <asp:Button id="btnNew" CssClass="Submitbutton" runat="server" Text="+" 
            style="position:absolute; top:33px; left:262px; height:20px; width:25px; font-weight:bold;" 
            onclick="btnNew_Click" /> 
        <asp:Label ID="lblWriterName"  runat="server" CssClass="labelTextField" Text="Writer Name"  style="position:absolute; top:35px; left:290px;"  ></asp:Label>
        <asp:TextBox ID="txtHdnWCODE" runat="server" autocomplete="off" 
            CssClass="textBox"   AutoPostBack="true" 
            style="position:absolute; font-size:10px; top:33px; left:378px; width:50px; " 
            BackColor="#FFFF66"  ontextchanged="txtHdnWCODE_TextChanged" ></asp:TextBox>

            
        <asp:TextBox ID="txtWriterName" runat="server" autocomplete="off"   
            CssClass="textBox"  
            style="position:absolute; top:33px; left:428px; width:205px; font-family:Prothoma;  " 
            Font-Size="15pt" ></asp:TextBox>
        


        <%--<asp:Image ID="imgVendorFinder" runat="server" ToolTip="Find Vendor" onclick="javascript:writerFinder();" style="position:absolute; top:33px; left:640px; height:25px; width:50px;"
                             ImageUrl="~/Images/Finder.jpg"  />--%>
        
        <%--<asp:Button id="btnFinder" CssClass="Submitbutton" runat="server" Text="Find" onclientclick="javascript:writerFinder();"
            style="position:absolute; top:33px; left:373px; height:25px; width:50px; right: 515px;" 
            onclick="btnFinder_Click"/> --%>

        <asp:ImageButton ID="ImageButtonTo" runat="server" onclick="btnFinder_Click"  ToolTip="Find Agent"  
            onclientclick="javascript:writerFinderTo();" style="position:absolute; top:35px; height:20px; width:30px; right: 258px;" 
            ImageUrl="~/Images/Finder.jpg"  />

        <asp:Label ID="lblHeadLine"  runat="server" CssClass="labelTextField" Text="Head Line"  style="position:absolute; top:65px; left:10px;"  ></asp:Label>
        <asp:TextBox ID="txtHeadLine" runat="server" autocomplete="off" 
            CssClass="textBox"  
            style="position:absolute;  top:63px; left:90px; width:593px;  " 
            Font-Size="15pt" ></asp:TextBox>
        
        <asp:Label ID="lblPamount"  runat="server" CssClass="labelTextField" Text="Amount"  style="position:absolute; top:96px; left:10px;"  ></asp:Label>
        <asp:TextBox ID="txtPamount" autocomplete="off"  runat="server" 
            CssClass="textBox"  
            style="position:absolute; top:93px; left:90px; width:170px; " 
            Font-Size="15pt" ></asp:TextBox>

        <asp:Label ID="lblPageName"  runat="server" CssClass="labelTextField" Text="Page Name"  style="position:absolute; top:96px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPageName"  runat="server"   CssClass="dropdownlist" AutoPostBack="true"
            style="position:absolute; top:93px; left:373px; width:312px;  text-align:center;" 
            onselectedindexchanged="ddlPageName_TextChanged"  ></asp:DropDownList>

        <asp:Label ID="lblRemarks" autocomplete="off"  runat="server" CssClass="labelTextField" Text="Remarks"  style="position:absolute; top:127px; left:10px;"  ></asp:Label>
        <asp:TextBox ID="txtRemarks" runat="server" CssClass="textBox"  style="position:absolute; top:124px; left:90px; width:593px; font-family:ProthomaUNew; " ></asp:TextBox>
        
        <asp:TextBox ID="txtHdnSL" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>
        <%--<asp:TextBox ID="txtHdnWCODE" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:70px; width:50px; display:none; " ></asp:TextBox>--%>
        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>

        <%--<asp:Button id="btnPrint" CssClass="Submitbutton" runat="server" Text="Print" 
            style="position:absolute; top:160px; left:440px; height:30px; width:70px;" 
            onclick="btnPrint_Click"/>--%>


        <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server" Text="Add" onclientclick="javascript: return chkField();"
            style="position:absolute; top:160px; left:90px; height:30px; width:70px;" 
            onclick="btnAdd_Click"/>

        <asp:Button id="btnEdit" CssClass="Submitbutton" runat="server" Text="Save" 
            style="position:absolute; top:160px; left:90px; height:30px; width:70px; " onclick="btnEdit_Click" />

        <asp:Button id="btnDelete" CssClass="Submitbutton" runat="server" Text="Delete" onclientclick="confirm('Press OK to Delete');"
            style="position:absolute; top:160px; left:310px; height:30px; width:70px;" 
            onclick="btnDelete_Click"/>

        <asp:Button id="btnConfirm" CssClass="Submitbutton" runat="server" 
            Text="Confirm" onclientclick="confirm('Press OK to Confirm');"
            style="position:absolute; top:160px; left:390px; height:30px; width:70px;" 
            onclick="btnConfirm_Click"/>
            
            
        <asp:Button id="btnPrint" CssClass="Submitbutton" runat="server" Text="Print" 
            style="position:absolute; top:160px; left:617px; height:30px; width:70px;" 
            onclick="btnPrint_Click"/>

        <asp:LinkButton ID="linkButtonLogout" Font-Names="Verdana"  PostBackUrl="~/login.aspx"
            runat="server" Text="Logout" 
            style="position:absolute; top:32px; left:849px; height:30px; width:70px;" ></asp:LinkButton>

       <div style="position:absolute; height:30px;width:928px; left:0px; color:#2A120A; font-weight:bold; top:200px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white); border-top-left-radius: 7px; border-top-right-radius: 7px; ">DETAILS
        
       </div>

       <div style="position:absolute; height:413px;width:930px; left:0px; margin-top:235px; overflow:scroll; background:#F0F6F8; top: 0px;">
      

       <asp:GridView ID="grdDetails" runat="server" 
               Style="position: absolute; border: 0px solid #ADB1AF; top:0px;
                left:0px; height:auto; width:908px; font-family:Verdana;  font-size: 11px; color: Black;  position: absolute; overflow:auto; " 
               AutoGenerateColumns="False" CellSpacing="1" AllowSorting = "True" ShowHeader="False" 
                RowStyle-HorizontalAlign="Left" PageSize="50"
                onrowcreated="grdDetails_RowCreated" 
               onrowdatabound="grdDetails_RowDataBound" 
               onselectedindexchanging="grdDetails_SelectedIndexChanging" >  
                             
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Select" ></asp:LinkButton>
                            </ItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="40px"></ItemStyle>
                        </asp:TemplateField>


                        <asp:BoundField DataField="TRANSDATE" SortExpression="TRANSDATE" 
                            ItemStyle-Font-Names="Verdana" DataFormatString="{0:dd-MMM-yy}"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="70px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="SL" SortExpression="SL"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>

                        
                        <asp:BoundField DataField="WCODE" SortExpression="WCODE" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="70px" Font-Size="10pt"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="WNAME" SortExpression="WNAME" ItemStyle-Font-Names="Prothoma"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="150px" Font-Size="15pt"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="HLINE" SortExpression="HLINE" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="160px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" >                        

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="160px" Font-Size="15pt"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="PNAME" SortExpression="PNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="80px" ></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="PRPAMOUNT" SortExpression="PRPAMOUNT" ItemStyle-Font-Names="Prothoma"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px"  BorderStyle="Solid" Width="60px" Font-Size="15pt"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="APVAMOUNT" SortExpression="APVAMOUNT" ItemStyle-Font-Names="Prothoma"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">                       

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="60px" Font-Size="15pt" ></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="STATUS" SortExpression="STATUS"  ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">                        

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Width="50px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="REMARKS" SortExpression="REMARKS" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">                        
                            <%--DataFormatString="{0:dd-MMM-yy}"--%>
                                                                       
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="70px"></ItemStyle>
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="UPRPAMOUNT" SortExpression="UPRPAMOUNT" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" 
                            ItemStyle-BorderColor="Gray">                        
                            <%--DataFormatString="{0:dd-MMM-yy}"--%>
                            
                                                                       
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="70px"></ItemStyle>
                        </asp:BoundField>

                                                                       
                 </Columns>
                    
            </asp:GridView>
       
       </div>

    </div>
    <div id="divVendor" style="position:absolute; height:590px;width:620px; margin-left:300px; margin-top:20px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
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

                        <asp:BoundField DataField="NAME" SortExpression="NAME" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-Font-Size="15" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="VENDNAME" SortExpression="VENDNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-Font-Size="10" ItemStyle-BorderColor="Gray"/>
                       

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
