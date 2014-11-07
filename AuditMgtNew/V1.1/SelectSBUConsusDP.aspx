<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectSBUConsusDP.aspx.cs" Inherits="AuditMgtNew.SelectSBUConsusDP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/Sheet2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div class="wrapper">
    <div id="header">
        <asp:Image ID="Image1" runat="server" Height="77px" 
            ImageUrl="~/Images/dubai_properties_logo.png" Width="178px" />
        <ul>
			<li><a href="#">Tecom</a></li>
			<li><a href="#">Dubai Properties</a></li>
			<li><a href="#">Jumeirah</a></li>
			<li><a href="#">Home</a></li>
		</ul>
       
	</div>
    <div id="content">
       <center>  
        <asp:table ID="tblLoginJM" runat="server" border="0" 
            style="font-size: 100%; font-family: Verdana;" BackColor="White" 
            Height="100px" >
            <asp:TableRow>
            <asp:TableCell ColumnSpan="1" HorizontalAlign="center" style="font-weight:normal; color: white; font-size: small; color: #FF0000">To Begin, Please Select a Location</asp:TableCell> 
            </asp:TableRow>
            <asp:TableRow><asp:TableCell Height="5px"></asp:TableCell></asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            <center>
                <asp:DropDownList ID="ddlCountries" runat="server">
                </asp:DropDownList>
            </center>
            </asp:TableCell>
            </asp:TableRow>            
            <asp:TableRow></asp:TableRow>          
            <asp:TableRow>
            <asp:TableCell HorizontalAlign="center">            
             <asp:ImageButton ID="ImageButton2" runat="server"  
                ImageUrl="~/Images/login_button.png" 
                 onclick="ImageButton1_Click" /> 
            </asp:TableCell>                 
            </asp:TableRow>            
            
    </asp:table>  
      
    </center>  


    </div>

    <div class="push"></div>
    
    </div>
     <div class="footer">
     <h5 style="color: #FFFFFF">© CONSUS International Solutions FZE 2014</h5>
       <%-- <div id="navigation1">--%>
		<ul>
			<li><a href="#">Tecom</a></li>
			<li><a href="#">Dubai Properties</a></li>
			<li><a href="#">Jumeirah</a></li>
			<li><a href="#">Home</a></li>
		</ul>
     </div>  
    </form>
</body>
</html>

