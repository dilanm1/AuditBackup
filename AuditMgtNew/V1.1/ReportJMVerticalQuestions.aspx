<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportJMVerticalQuestions.aspx.cs" Inherits="AuditMgtNew.ReportJMVerticalQuestions" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <link href="Style/StyleJM.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div class="wrapper">
    <div id="header">
        <asp:Image ID="Image1" runat="server" Height="77px" 
            ImageUrl="~/Images/jumeirah_group_logo.png" Width="178px" />
        <ul>
			<li><a href="#">Tecom</a></li>
			<li><a href="#">Dubai Properties</a></li>
			<li><a href="#">Jumeirah</a></li>
			<li><a href="#">Home</a></li>
		</ul>
       
	</div>
    <div id="content">
    <center>  
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="906px" 
        Height="708px">
    </rsweb:ReportViewer>
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
