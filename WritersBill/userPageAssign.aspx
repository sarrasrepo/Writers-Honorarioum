<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userPageAssign.aspx.cs" Inherits="userPageAssign" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::User Page Assign:::</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript"> 
         function writerFinder() {


             document.getElementById('divVendor').style.display = 'block';

         }
         function hideDiv() 
         {
             document.getElementById('divVendor').style.display = 'none';
         }    
     </script>    

</head>
<body>
    <form id="form1" runat="server">
    <asp:LinkButton ID="lnkPageAssign" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:20px; left:1240px; height:25px; width:50px;"  ></asp:LinkButton>
    <div style="position:relative; height:600px;width:500px; float:left; margin-left:150px; margin-top:20px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888;">
        <div style="position:absolute; height:70px;width:490px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">
        <p style="position:absolute; color:#ffffff; font-family:Arial Black, Gadget, sans-serif; top:-20px; left:5px;" >Page Assign </p>
        <%--<asp:Label ID="Label1"  runat="server" CssClass="labelTextField" Text="Page Assign"  style="position:absolute; color:#071914; top:0px; left:0px;"  ></asp:Label>--%>
        <asp:Label ID="lblUserName"  runat="server" CssClass="labelTextField" Text="User"  style="position:absolute; color:#071914; top:28px; left:5px;"  ></asp:Label>
        <asp:DropDownList ID="ddlUserName" runat="server" CssClass="dropdownlist"  style="position:absolute;  top:25px; left:40px; width:130px; " ></asp:DropDownList>
        <asp:Label ID="lblPageName"  runat="server" CssClass="labelTextField" Text="Page"  style="position:absolute; color:#071914; top:28px; left:180px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPageName"  runat="server"   CssClass="dropdownlist" 
            
        style="position:absolute; color:#071914; top:25px; left:220px; width:150px;  text-align:center;"></asp:DropDownList>

         <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server" Text="Add" 
            
            style="position:absolute; top:25px; left:375px; height:25px; width:40px; color:#071914; font-weight:normal;" 
            onclick="btnAdd_Click" /> 
        <asp:Button id="btnRemove" CssClass="Submitbutton" runat="server" Text="Remove" 
            
                style="position:absolute; top:25px; left:420px; height:25px; width:70px; color:#071914; font-weight:normal;" 
                onclick="btnRemove_Click" /> 

        <%--<asp:Label ID="lblHeaderName"   runat="server" CssClass="labelTextField" Text="User Name"  style="position:absolute; vertical-align:middle; width:240px; background:#E6E6E6; height:25px; color:#071914; top:40px; left:0px; text-align:center;"  ></asp:Label>--%>
        
        <div style="position:absolute; height:530px;width:490px; left:0px; color:#2A120A; font-weight:normal; top:80px; font-family:Verdana, Geneva, Sans Serif; overflow:scroll;">
            
            <asp:GridView ID="grdPage" runat="server" Style="position: absolute; top:0px;
                left:10px; height:auto; width:480px; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                 onrowcreated="grdPage_RowCreated" 
                 onselectedindexchanging="grdPage_SelectedIndexChanging"               
                AllowPaging="false" AutoGenerateColumns="false"  CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"  HeaderStyle-ForeColor="#071914" 
                RowStyle-HorizontalAlign="Left" PageSize="50"  >
            <Columns>

            <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Select" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="USERNAME" SortExpression="USERNAME" ItemStyle-Font-Names="Verdana" 
                            ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                            ItemStyle-Width="200px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="PNAME" SortExpression="PNAME"
                            ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                            ItemStyle-Width="260px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
             </Columns>
            </asp:GridView>
        </div>
        </div>
    </div>
    <div style="position:relative; height:600px;width:500px; float:left;  margin-left:10px; margin-top:20px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888;">
         <div style="position:absolute; height:70px;width:490px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">
         <p style="position:absolute; color:#ffffff; font-family:Arial Black, Gadget, sans-serif; top:-20px; left:5px;" >Writers Assign </p>

        <asp:Label ID="lblWUser"  runat="server" CssClass="labelTextField" Text="User"  style="position:absolute; color:#071914; top:28px; left:5px;"  ></asp:Label>
        <asp:DropDownList ID="ddlUserForWriter" runat="server" CssClass="dropdownlist"  style="position:absolute;  top:25px; left:40px; width:110px; " ></asp:DropDownList>
        <asp:Label ID="lblWriter"  runat="server" CssClass="labelTextField" Text="Writer"  style="position:absolute; color:#071914; top:28px; left:150px;"  ></asp:Label>
        <asp:TextBox ID="txtWriter"  runat="server"   CssClass="textBox" 
            
        style="position:absolute; color:#071914; top:25px; left:195px; width:150px;  text-align:center; font-family:Prothoma;"></asp:TextBox>
        <asp:TextBox ID="txtHdnWCODE" runat="server" CssClass="textBox"  style="position:absolute; top:50px; left:195px; width:50px; display:none; " ></asp:TextBox>

        <asp:TextBox ID="txtWriterNameEng" runat="server" CssClass="textBox"   style="position:absolute; top:50px; left:40px; width:445px; height:16px; " ></asp:TextBox>

        <asp:Button id="btnFinder" CssClass="Submitbutton" runat="server" Text="Find" onclientclick="javascript:writerFinder();"
            style="position:absolute; top:25px; left:350px; height:25px; text-align:center; width:40px; font-weight:normal;" 
           onclick="btnFinder_Click" /> 

         <asp:Button id="btnWriterAdd" CssClass="Submitbutton" runat="server" Text="Add" 
            
            
                 style="position:absolute; top:25px; left:390px; height:25px; width:40px; text-align:center; color:#071914; font-weight:normal;" onclick="btnWriterAdd_Click" 
             /> 
        <asp:Button id="btnRemoveWriter" CssClass="Submitbutton" runat="server" Text="Remove" 
            
                 style="position:absolute; top:25px; left:430px; height:25px; width:60px; text-align:center; color:#071914; font-weight:normal;" 
                 onclick="btnRemoveWriter_Click" /> 
            </div>

            <div style="position:absolute; height:530px;width:490px; left:0px; color:#2A120A; font-weight:normal; top:80px; font-family:Verdana, Geneva, Sans Serif;overflow:scroll;">
            
            <asp:GridView ID="grdWriter" runat="server" Style="position: absolute; top:0px;
                left:10px; height:auto; width:480px; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                 onrowcreated="grdWriter_RowCreated" 
                 onselectedindexchanging="grdWriter_SelectedIndexChanging"               
                AllowPaging="false" AutoGenerateColumns="false"  CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"  HeaderStyle-ForeColor="#071914" 
                RowStyle-HorizontalAlign="Left" PageSize="50"  >
            <Columns>

            <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit" Font-Names="Verdana"  CommandName="Select" runat="server" Text="Select" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:BoundField DataField="USERNAME" SortExpression="USERNAME" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="200px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="WCODE" SortExpression="WCODE" ItemStyle-Font-Names="VERDANA" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="260px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="WNAME" SortExpression="WNAME" ItemStyle-Font-Names="Prothoma" ItemStyle-Font-Size="15"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="260px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
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

                      <%--  <asp:BoundField DataField="NAME" SortExpression="NAME" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
--%>
                        <asp:BoundField DataField="VENDNAME" SortExpression="VENDNAME" ItemStyle-Font-Names="Verdana"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="230px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                       

                </Columns>

         </asp:GridView>
    </div>

    </div>

    </form>
</body>
</html>
