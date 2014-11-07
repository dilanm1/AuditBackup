<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditLevelConsusTC.aspx.cs" Inherits="AuditMgtNew.AuditLevelConsusTC" %>

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

     <div class="logo">     <asp:Image ID="Image1" runat="server" Height="77px" 
            ImageUrl="~/Images/tecom_logo.png" Width="178px" /> </div>
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
            <asp:TableCell ColumnSpan="1" HorizontalAlign="center" style="font-weight:normal; color: white; font-size: small; color: #FF0000">To Begin, Please Select Audit Level</asp:TableCell> 
            </asp:TableRow>
            <asp:TableRow><asp:TableCell Height="5px"></asp:TableCell></asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            <center><asp:radiobuttonlist id="contentcheck" repeatdirection="Vertical" 
                runat="server" BackColor="White" Height="30px" Font-Size="small">
            <%--<asp:listitem>Introductory Audit</asp:listitem>--%>
            <asp:listitem>First Tier Audit Review</asp:listitem>
            <asp:listitem>Second Tier Audit Review</asp:listitem>
            </asp:radiobuttonlist></center>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell> <asp:CustomValidator runat="server" ID="cvmodulelist"
              ClientValidationFunction="ValidateModuleList"
              ErrorMessage="Please Select One!" BackColor="#CC0000"></asp:CustomValidator></asp:TableCell>
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
       <script language="javascript" type="text/javascript" >
           // javascript to add to your aspx page
           function ValidateModuleList(source, args) {
               var chkListModules = document.getElementById('<%= contentcheck.ClientID%>');
               var chkListinputs = chkListModules.getElementsByTagName("input");
               for (var i = 0; i < chkListinputs.length; i++) {
                   if (chkListinputs[i].checked) {
                       args.IsValid = true;
                       return;
                   }
               }
               args.IsValid = false;
           }
       </script>
    </center>  


    </div>

    <div class="push"></div>
    
    </div>
     <div class="footer">
       <div class="copy">© CONSUS International LTD 2014</div>
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

