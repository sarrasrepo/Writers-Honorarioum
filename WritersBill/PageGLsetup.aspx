<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageGLsetup.aspx.cs" Inherits="PageGLsetup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>:::Page GL Setup:::</title>

     <script type="text/javascript" language="javascript">

         function writerFinder() {


             document.getElementById('divVendor').style.display = 'block';

         }
         function hideDiv() 
         {
             document.getElementById('divVendor').style.display = 'none';
             document.getElementById('<%= txtVSearch.ClientID %>').value == "";
         }     

  </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:LinkButton ID="lnkPageAssign" runat="server" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; top:20px; left:1040px; height:25px; width:50px;"  ></asp:LinkButton>
    <div style="position:relative; height:600px;width:700px; float:left; margin-left:300px; margin-top:20px; background:#F0F6F8; border:2px solid #42839B;  border-radius: 10px; box-shadow: 5px 5px 5px #888888;">
        <div style="position:absolute; height:100px;width:690px; margin-left:0px; color:#071914; font-weight:bold; margin-top:0px; padding-left:10px; font-family:Verdana, Geneva, Sans Serif; background: -webkit-linear-gradient(#42839B, white);border-top-left-radius: 7px; border-top-right-radius: 7px;">
            <p style="position:absolute; color:#ffffff; font-family:Arial Black, Gadget, sans-serif; top:-20px; left:5px;" >Page GL Setup </p>
        
            <asp:Label ID="lblPageName"  runat="server" CssClass="labelTextField" Text="Page"  style="position:absolute; color:#071914; top:28px; left:10px;"  ></asp:Label>
            <asp:DropDownList ID="ddlPageName"  runat="server"   CssClass="dropdownlist"             
                style="position:absolute; color:#071914; top:25px; left:50px; width:150px;  text-align:center;"></asp:DropDownList>
            
            <asp:Label ID="lblGLId"  runat="server" CssClass="labelTextField" Text="GL Head"  style="position:absolute; color:#071914; top:28px; left:210px;"  ></asp:Label>
            <asp:TextBox ID="txtGLID"  runat="server"   CssClass="textBox"  ReadOnly="true"           
                style="position:absolute; color:#071914; top:25px; left:270px; width:130px;  text-align:left;"></asp:TextBox>

             <asp:TextBox ID="txtGLDesc"  runat="server"   CssClass="textBox"  ReadOnly="true"            
                style="position:absolute; color:#071914; top:25px; left:408px; width:237px;  text-align:left;"></asp:TextBox>
                
            <asp:HiddenField ID="hdnId" runat="server" />
             <asp:Button id="btnFind" CssClass="Submitbutton" runat="server" Text="Find"  onclientclick="javascript:writerFinder();"            
            
                style="position:absolute; top:25px; left:650px; height:25px; width:40px; color:#071914; font-weight:normal;" 
                onclick="btnFind_Click"/> 

            <asp:Button id="btnAdd" CssClass="Submitbutton" runat="server" Text="Add"             
            
                style="position:absolute; top:60px; left:270px; height:25px; width:70px; color:#071914; font-weight:normal;" 
                onclick="btnAdd_Click"/> 
             <asp:Button id="btnUpdate" CssClass="Submitbutton" runat="server" Text="Update"             
            
                style="position:absolute; top:60px; left:270px; height:25px; width:70px; color:#071914; font-weight:normal;" 
                onclick="btnUpdate_Click"/> 

             <asp:Button id="btnRemove" CssClass="Submitbutton" runat="server" Text="Remove"          
                
                style="position:absolute; top:60px; left:345px; height:25px; width:70px; color:#071914; font-weight:normal;" 
                onclick="btnRemove_Click" /> 
        
        </div>
        <div style="position:absolute; height:480px;width:690px; left:0px; color:#2A120A; font-weight:normal; top:110px; font-family:Verdana, Geneva, Sans Serif; overflow:scroll;">
            
            <asp:GridView ID="grdGLHead" runat="server" Style="position: absolute; top:0px;
                left:10px; height:auto; width:670px; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                 onrowcreated="grdGLHead_RowCreated" 
                 onselectedindexchanging="grdGLHead_SelectedIndexChanging"  
                 onrowdatabound="grdGLHead_RowDataBound"              
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
                <asp:BoundField DataField="PNAME" SortExpression="PNAME" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="GLHEAD" SortExpression="GLHEAD"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="200px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="GLDESC" SortExpression="GLDESC"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="440px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="ID" SortExpression="ID"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
             </Columns>
            </asp:GridView>
        </div>
  </div>
  <div id="divVendor" style="position:absolute; height:590px;width:620px; margin-left:300px; margin-top:20px; z-index:20px; background:#F0F6F8; border:2px solid #42839B; box-shadow: 5px 5px 5px #888888; display:none;">
    <asp:Label ID="lblClose"  runat="server" Text="X" onclick="javascript:hideDiv();"  style="position:absolute; color:Red; cursor:pointer; margin-left:600px; margin-top:0px;"></asp:Label>
    
    <asp:Label ID="Label1"  runat="server" CssClass="labelTextField" Text="Search by ID/NAME"  style="position:absolute; top:13px; left:10px;"  ></asp:Label>
    <asp:TextBox ID="txtVSearch" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtVSearch_TextChanged"  style="position:absolute; top:10px; left:160px; width:150px; " ></asp:TextBox>
    
    <div id="div1" style="position:absolute; height:500px;width:600px; margin-left:0px; margin-top:50px; z-index:30px; background:#F0F6F8;  overflow:scroll; ">
             <asp:GridView ID="grdGL" runat="server" Style="position: absolute; top:0px;
                5left:0px; height:auto; width:570px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" 
                GridLines="Both" AllowSorting = "True"
                AutoGenerateSelectButton="false" ShowHeader="false"
                RowStyle-HorizontalAlign="Left" PageSize="50" onselectedindexchanging="grdGL_SelectedIndexChanging"
                onrowcreated="grdGL_RowCreated" >

                <Columns>
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="30px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                         <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Select" Font-Names="Verdana" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="ACCTID" SortExpression="ACCTID" ItemStyle-Font-Names="Verdana" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="140px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray" /> 

                        <asp:BoundField DataField="ACCTDESC" SortExpression="ACCTDESC" 
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="360px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        

                </Columns>

         </asp:GridView>
    
    </div>

 </div>
    </form>
</body>
</html>
