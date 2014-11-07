<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewEditConsusJM.aspx.cs" Inherits="AuditMgtNew.GridViewEditConsusJM" %>

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
      <asp:table ID="tblAudit" runat="server" border="0" style="font-size: 100%; font-family: Verdana;" >
       <asp:TableRow>
        <asp:TableCell Width="30%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small">
                    <asp:Label ID="lblLocation" runat="server" Text="Please select a Location:"></asp:Label><asp:Label
                        ID="lblLoc" runat="server" Text="Label" Visible="false"></asp:Label></asp:TableCell> 
       </asp:TableRow>          
    </asp:table>
    <center>
        <asp:DropDownList ID="ddlCountries" runat="server"
    AutoPostBack = "True" 
            DataSourceID="SqlDataSource1" DataTextField="location" 
            DataValueField="location">
    </asp:DropDownList>
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" 
            ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="20">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="examid" HeaderText="examid" SortExpression="examid" 
                    Visible="False" />
                <asp:BoundField DataField="locationid" HeaderText="locationid" 
                    SortExpression="locationid" Visible="False" />
                <asp:BoundField DataField="location" HeaderText="Location" 
                    SortExpression="location" >
                </asp:BoundField>
                <asp:BoundField DataField="mid" HeaderText="User" SortExpression="mid" />
                <asp:BoundField DataField="sid" HeaderText="Indicator ID" 
                    SortExpression="sid" >
                </asp:BoundField>
                <asp:BoundField DataField="qid" HeaderText="QID" 
                    SortExpression="qid" />
                <asp:BoundField DataField="question" HeaderText="Question" 
                    SortExpression="question" >
                </asp:BoundField>
                <asp:BoundField DataField="answer" HeaderText="Answer" 
                    SortExpression="answer">
                </asp:BoundField>
                <asp:BoundField DataField="evidence" HeaderText="Evidance" 
                    SortExpression="evidence">
                </asp:BoundField>
                <asp:BoundField DataField="comments" HeaderText="Comments" 
                    SortExpression="comments">
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:examConnectionString %>" 
            
            
            SelectCommand="SELECT * FROM [tblSavedAnswersConsus] WHERE (([location] = @location) AND ([mid] = @mid))" 
            DeleteCommand="DELETE FROM [tblSavedAnswersConsus] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [tblSavedAnswersConsus] ([examid], [locationid], [location], [mid], [sid], [qid], [question], [answer], [evidence], [comments]) VALUES (@examid, @locationid, @location, @mid, @sid, @qid, @question, @answer, @evidence, @comments)" 
            UpdateCommand="UPDATE [tblSavedAnswersConsus] SET [examid] = @examid, [locationid] = @locationid, [location] = @location, [mid] = @mid, [sid] = @sid, [qid] = @qid, [question] = @question, [answer] = @answer, [evidence] = @evidence, [comments] = @comments WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="examid" Type="Int32" />
                <asp:Parameter Name="locationid" Type="Int32" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="mid" Type="Int32" />
                <asp:Parameter Name="sid" Type="Int32" />
                <asp:Parameter Name="qid" Type="String" />
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="answer" Type="String" />
                <asp:Parameter Name="evidence" Type="String" />
                <asp:Parameter Name="comments" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCountries" Name="location" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:SessionParameter Name="mid" SessionField="mid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="examid" Type="Int32" />
                <asp:Parameter Name="locationid" Type="Int32" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="mid" Type="Int32" />
                <asp:Parameter Name="sid" Type="Int32" />
                <asp:Parameter Name="qid" Type="String" />
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="answer" Type="String" />
                <asp:Parameter Name="evidence" Type="String" />
                <asp:Parameter Name="comments" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:examConnectionString %>" 
            
            
            
            SelectCommand="SELECT [locationid], [location] FROM [tbllocation] WHERE ([verticalid] = @verticalid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="verticalid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <hr />
        
    </center>   
   
     <div style="clear:both"></div>
    </div>
         
    <div class="push"></div>
    
    </div>
     <div class="footer">
     <div class="copy">© CONSUS International LTD FZE 2014</div>
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
