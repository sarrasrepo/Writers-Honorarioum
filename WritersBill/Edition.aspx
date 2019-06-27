﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edition.aspx.cs" Inherits="Edition" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: Edition Setup :::</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-1.10.3.js" type="text/javascript"></script>
    <script src="Scripts/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    <link href="jquery-ui-1.10.3.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript" language="javascript">
     
         function hideDiv() 
         {
             document.getElementById('divVendor').style.display = 'none';
         }        

         
         function chkField() 
         {

         }

    </script>
</head>


<body>
    
    <form id="form1" runat="server">
    <asp:LinkButton ID="LinkButton1" runat="server" Text="Back" 
        PostBackUrl="~/Home.aspx" 
        style="position:absolute; top:10px; left:1170px; height:25px; width:50px; "  ></asp:LinkButton>
    <%--<div id="divSearchWriter" style="position:absolute; top:0px; left:0px; height:250px; width:300px; border:1px solid red; text-align:left; overflow:auto; z-index:20;  display:none; ">         
    </div>--%>
    <asp:LinkButton ID="lnkBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:20px; left:1040px; height:25px; width:50px; "  ></asp:LinkButton>
    <div style="position:absolute; height:650px;width:938px; margin-left:450px; margin-top:2px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888; top: 0px; left: -238px;">
        
        <div style="position:absolute; height:30px;width:928px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">
            Edition Setup</div>
        <asp:Label ID="lblUser"  runat="server" CssClass="labelTextField"  style="position:absolute; font-style:italic; top:5px; left:550px;"  ></asp:Label>

        <asp:Label ID="lblEditionCode"  runat="server" CssClass="labelTextField" 
            Text="Edition Code"  style="position:absolute; top:35px; left:10px;"  ></asp:Label>
        <asp:TextBox ID="txtEditionCode" runat="server" autocomplete="off" CssClass="textBox" 
            style="position:absolute; font-size:10px; top:33px; left:128px; width:113px; right: 697px;" ></asp:TextBox>
        <asp:TextBox ID="txtSl" runat="server" autocomplete="off"   Visible="false"
            CssClass="textBox" ReadOnly="true"
            style="position:absolute; top:33px; left:478px; width:205px; font-family:Prothoma;  " 
            Font-Size="15pt" ></asp:TextBox>
    
        <asp:Label ID="lblEditionName"  runat="server" CssClass="labelTextField" 
            Text="Edition Name"  style="position:absolute; top:35px; left:290px;"  ></asp:Label>
        <asp:TextBox ID="txtEditionName" runat="server" autocomplete="off" 
            CssClass="textBox"  
            style="position:absolute; top:33px; left:398px; width:278px; " ></asp:TextBox>
        
    
        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox"  style="position:absolute; top:160px; left:10px; width:50px; display:none; " ></asp:TextBox>

        <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server" Text="Add" onclientclick="javascript: return chkField();"
            style="position:absolute; top:63px; left:398px; height:30px; width:70px;" 
            onclick="btnAdd_Click"/>

        <asp:Button id="btnEdit" CssClass="Submitbutton" runat="server" Text="Save" 
            style="position:absolute; top:64px; left:396px; height:30px; width:70px; " 
            onclick="btnEdit_Click" />

        <asp:Button id="btnDelete" CssClass="Submitbutton" runat="server" Text="Delete" onclientclick="confirm('Press OK to Delete');"
            style="position:absolute; top:64px; left:485px; height:30px; width:70px;" 
            onclick="btnDelete_Click"/>

        <%--<asp:LinkButton ID="linkButtonLogout" Font-Names="Verdana"  PostBackUrl="~/login.aspx"
            runat="server" Text="Logout" 
            style="position:absolute; top:32px; left:849px; height:30px; width:70px;" ></asp:LinkButton>--%>

       <div style="position:absolute; height:30px;width:928px; left:0px; color:#2A120A; font-weight:bold; top:121px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);  border-top-left-radius: 7px; border-top-right-radius: 7px; ">DETAILS
        
       </div>

       <div style="position:absolute; height:486px; width:930px; left:0px; margin-top:235px; overflow:scroll; background:#F0F6F8; top: -73px;">
      

       <asp:GridView ID="grdDetails" runat="server" 
               Style="position: absolute; border: 0px solid #ADB1AF; top:0px;
                left:0px; height:auto; width:908px; font-family:Prothoma;  font-size: 11px; color: Black;  position: absolute; overflow:auto; " 
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

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="SL" SortExpression="SL"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="EDCODE" SortExpression="EDCODE" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                        
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" Height="22px" Width="10px"></ItemStyle>
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="EDNAME" SortExpression="EDNAME" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" 
                            ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"> 

<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" BorderColor="Gray" BorderWidth="1px" 
                            BorderStyle="Solid" Width="150px" ></ItemStyle>
                        </asp:BoundField>

                                                                       
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
