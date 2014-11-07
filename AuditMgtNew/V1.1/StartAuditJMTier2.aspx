<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartAuditJMTier2.aspx.cs" Inherits="AuditMgtNew.StartAuditJMTier2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link href="Style/StyleSheet3.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div class="wrapper">
    <div id="header">
        <asp:Image ID="Image1" runat="server" Height="97px" 
            ImageUrl="~/Images/jumeirah_group_logo.png" Width="200px" />
        <ul>
            <li><a href="#">Admin</a></li>
			<li><a href="ReportScoreLocation.aspx">Analysis</a></li>
		    <li><a href="ReportAuditor.aspx">Reports</a></li>
		    <li><a href="#">Audits</a></li>			
            <li><a href="JMIndicators.aspx">Indicators</a></li>
		    <li><a href="#">Home</a></li>
		</ul>
       
	</div>
    <div id="content">
    <asp:Label ID="Label11" runat="server" Text="Select Location" 
    Font-Size="Medium" ForeColor="#878787"></asp:Label><br /><asp:Label ID="lbllocation" runat="server"
        Text="Label" Visible="false"></asp:Label><center>
        <asp:RadioButtonList ID="contentcheck" runat="server" 
            RepeatDirection="Horizontal" AutoPostBack="True" 
                ValidationGroup="contentcheck">
            <asp:ListItem>SBU Audit</asp:ListItem>
            <asp:ListItem>Sub SBU Audit</asp:ListItem>
        </asp:RadioButtonList>
              <asp:CustomValidator runat="server" ID="cvmodulelist"
              ClientValidationFunction="ValidateModuleList"
              ErrorMessage="Please Select One!" BackColor="#CC0000"></asp:CustomValidator>
 

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
       </script></center>
    <br />
    <asp:Label ID="Label52" runat="server" ForeColor="#0000CC" Text="Label" 
    Visible="False"></asp:Label>
    <asp:Label ID="Label53" runat="server" Text="Label" Visible="False"></asp:Label>     
  
     <asp:table ID="tbl1" runat="server" border="0" 
            style="font-size: 100%; font-family: Verdana;">
            <asp:TableRow>
                <asp:TableHeaderCell HorizontalAlign="center" style="font-weight:normal; color: white; background-color: #5d7b9d" Font-Size="Small">Select Company</asp:TableHeaderCell>
            </asp:TableRow>
           <asp:TableRow>               
            <asp:TableCell HorizontalAlign="Left">
                 <asp:Label ID="Labeld3" runat="server" Font-Size="X-Small" Height="25px" Width="160px">Name of Business Unit/Entity:</asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#FFFFCC" Font-Size="X-Small" Width="220px" Height="20px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="false"></asp:DropDownList>
                </asp:TableCell>    
            </asp:TableRow>
             <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                 <asp:Label ID="Labeld2" runat="server" Font-Size="X-Small" Height="25px" Width="160px">Name of Sub Business Unit/Entity:</asp:Label>
                </asp:TableCell>
                <asp:TableCell>
              <asp:DropDownList ID="DropDownList2" runat="server" BackColor="#FFFFCC" Font-Size="X-Small" Width="220px" Height="20px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </asp:TableCell>
                </asp:TableRow>                
                <asp:TableRow>
                <asp:TableCell Height="10px"></asp:TableCell>
                </asp:TableRow>            
                <asp:TableRow>
                <asp:TableCell>
                    <asp:Button runat="server" Text="Start Audit" ID="btnStart" onclick="btnStart_Click" />
                </asp:TableCell>
                </asp:TableRow>
       </asp:table>     
  
         
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
