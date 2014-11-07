<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndicatorsDPConsus.aspx.cs" Inherits="AuditMgtNew.IndicatorsDPConsus" %>

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
            ImageUrl="~/Images/dubai_properties_logo.png" Width="178px" />
        <ul>
            <li><a href="Login.aspx">logout</a></li>
			<li><a href="HomeTC.aspx">Tecom</a></li>
			<li><a href="HomeDP.aspx">Dubai Properties</a></li>
			<li><a href="#">Reports</a></li>
			<li><a href="AuditLevelJM.aspx">Home</a></li>
		</ul>
       
	</div>
     <%-- <div id="navigation">
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Contact us</a></li>
		</ul>
	</div>--%>
     
     <div id="content">     
    <center>
     <asp:table ID="tblIndicatorJM" runat="server" border="0" Width ="75%"
            style="font-size: 100%; font-family: Verdana;" BackColor="White" 
            Height="80px" >
    <asp:TableRow>
    <asp:TableCell HorizontalAlign="left" Width="74%" Text="Location:">
        <asp:Label ID="lblLocation" runat="server" Text="Location:" Visible="True"></asp:Label>
    </asp:TableCell>
    </asp:TableRow>    
    <asp:TableRow>
    <asp:TableCell HorizontalAlign="left" Width="40%" Text="Indicators">    
    </asp:TableCell>
    <asp:TableCell HorizontalAlign="right">
    <asp:Image ID="Image211" runat="server" ImageUrl="~/Images/complete_image.png" />    
    </asp:TableCell>   
    <asp:TableCell HorizontalAlign="left" Font-Size="small" Width ="10px" Text = "Complete">
    </asp:TableCell>
     <asp:TableCell HorizontalAlign="right">
    <asp:Image ID="Image232" runat="server" ImageUrl="~/Images/Incomplete_image.png" />    
    </asp:TableCell>   
    <asp:TableCell HorizontalAlign="left" Font-Size="small" Width="10px" Text = "Incomplete">
    </asp:TableCell>
     <asp:TableCell HorizontalAlign="right">
    <asp:Image ID="Image33" runat="server" ImageUrl="~/Images/nodata_image.png" />    
    </asp:TableCell>   
    <asp:TableCell HorizontalAlign="left" Font-Size="small" Width="20px" Text = "NoData">
    </asp:TableCell>
    </asp:TableRow>    
    </asp:Table>     
   <h4 style="background-color: #E2E2E2; color:#787878; width:72%;line-height: 20px; vertical-align: middle; text-align: left; padding: 8px; margin: 2px">Please Select Indicators By Order</h4>
    <br />
    <asp:GridView ID="GridView1" runat="server"  CssClass ="gv1"  Width="80%" BorderStyle="None"  HeaderStyle-BackColor="White"
        HeaderStyle-ForeColor="Red" RowStyle-BackColor="#F0F0F0 " AlternatingRowStyle-BackColor="White"
        RowStyle-ForeColor="#3A3A3A" AutoGenerateColumns="false" PageSize="10" 
            HorizontalAlign="Center"  
            onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="none" 
            ShowHeader="true" AlternatingRowStyle-Wrap="False" 
            onrowdatabound="GridView1_RowDataBound1"> 
            
        <Columns>
           
            <asp:BoundField DataField="sid" />
             <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" Text='<%# Eval("sname") %>' />
            </ItemTemplate>
        </asp:TemplateField>
           <%-- <asp:BoundField DataField="City" HeaderText="City" />--%>
          <%--  <asp:BoundField DataField="Country" HeaderText="Country" />--%>
           <asp:TemplateField>
                    <ItemTemplate>
                      <asp:Image ID="Image2"  runat="server" ImageAlign="Right" ImageUrl="~/images/nodata_image.png" Visible ='<%#  Eval("status").Equals("nodata") %>' /><asp:Image ID="Image3"  runat="server" ImageAlign="Right" ImageUrl="~/images/Incomplete_image.png" Visible ='<%# Eval("status").Equals("Incomplete") %>' />
                       <asp:Image ID="Image4"  runat="server" ImageAlign="Right" ImageUrl="~/images/complete_image.png" Visible ='<%#  Eval("status").Equals("complete") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDetails" runat="server" Text="Start Audit" PostBackUrl='<%# "~/AuditDP.aspx?RowIndex=" + Container.DataItemIndex %>'></asp:LinkButton>
                
            </ItemTemplate> 
                   
        </asp:TemplateField>
         <asp:BoundField DataField="status" HeaderText="id" />
            <asp:TemplateField>
          <ItemTemplate>
                 <asp:LinkButton ID="Button1" runat="server" Text="Edit" PostBackUrl='<%# "~/GridViewEdit.aspx?RowIndex=" + Container.DataItemIndex %>'></asp:LinkButton>
            </ItemTemplate> 
         </asp:TemplateField> 
         <asp:TemplateField>
          <ItemTemplate>
                 <asp:LinkButton ID="Button2" runat="server" Text="Resume" PostBackUrl='<%# "~/AuditSavedDP.aspx?RowIndex=" + Container.DataItemIndex %>' Visible="False"></asp:LinkButton>
            </ItemTemplate> 
         </asp:TemplateField> 
          <asp:TemplateField>
          <ItemTemplate>
                 <asp:LinkButton ID="btnreport" runat="server" Text="View Report" PostBackUrl='<%# "~/ReportAuditor.aspx?RowIndex=" + Container.DataItemIndex %>' Visible="False"></asp:LinkButton>
            </ItemTemplate> 
         </asp:TemplateField>                 
        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Weighting Score" HeaderStyle-Font-Size="Small" ShowHeader="true"  ControlStyle-ForeColor="#000066">
            <ItemTemplate>
                <center><asp:Label ID="lblName1"  Visible ="true" runat="server" Text='<%# Eval("score") %>' /></center>
            </ItemTemplate>

        </asp:TemplateField>
        </Columns>     

    </asp:GridView>
        <br />
        <br />

   
    </center>
     </div>

     <div class="push"></div>
     </div>
     
       <div class="footer">
		<h5 style="color: #FFFFFF">© CONSUS International LTD 2014</h5>
       <%-- <div id="navigation1">--%>
		<ul>
			<li><a href="#">Tecom</a></li>
			<li><a href="#">Dubai Properties</a></li>
			<li><a href="#">Jumeirah</a></li>
			<li><a href="#">Home</a></li>
		</ul>
	<%--</div>--%>
       
	</div>
    </form>
</body>
</html>
