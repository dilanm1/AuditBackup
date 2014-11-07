<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewEditConsusDP.aspx.cs" Inherits="AuditMgtNew.GridViewEditConsusDPCorporate" %>

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
     <div class="logo">   <asp:Image ID="Image1" runat="server" Height="77px" 
            ImageUrl="~/Images/dubai_properties_logo.png" Width="178px" /> </div>
        
        <ul>
			<li><a href="#">Tecom</a></li>
			<li><a href="#">Dubai Properties</a></li>
			<li><a href="#">Jumeirah</a></li>
			<li><a href="#">Home</a></li>
		</ul>
       
	</div>
    <div id="content">
        <asp:Label ID="lblLocation" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="lblindicator" runat="server" Text="Label" Visible="false"></asp:Label>
   <br />  
        <asp:Label ID="lblsid" runat="server" Text="Label" Visible="false"></asp:Label>
        <br />
        <center>        
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="examid" HeaderText="examid" 
                        SortExpression="examid">
                    </asp:BoundField>
                    <asp:BoundField DataField="locationid" HeaderText="locationid" 
                        SortExpression="locationid">
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="location" 
                        SortExpression="location">
                    </asp:BoundField>
                    <asp:BoundField DataField="mid" HeaderText="mid" 
                        SortExpression="mid">
                    </asp:BoundField>
                    <asp:BoundField DataField="sid" HeaderText="sid" 
                        SortExpression="sid">
                    </asp:BoundField>
                    <asp:BoundField DataField="qid" HeaderText="qid" 
                        SortExpression="qid">
                    </asp:BoundField>
                    <asp:BoundField DataField="question" HeaderText="question" 
                        SortExpression="question">
                    </asp:BoundField>
                    <asp:BoundField DataField="answer" HeaderText="answer" 
                        SortExpression="answer" />
                    <asp:BoundField DataField="evidence" HeaderText="evidence" 
                        SortExpression="evidence" />
                    <asp:BoundField DataField="comments" HeaderText="comments" 
                        SortExpression="comments" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:examConnectionString %>" 
                DeleteCommand="DELETE FROM [tblSavedAnswersConsus] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [tblSavedAnswersConsus] ([examid], [locationid], [location], [mid], [sid], [qid], [question], [answer], [evidence], [comments]) VALUES (@examid, @locationid, @location, @mid, @sid, @qid, @question, @answer, @evidence, @comments)" 
                SelectCommand="SELECT * FROM [tblSavedAnswersConsus] WHERE (([mid] = @mid) AND ([locationid] = @locationid))" 
                
                
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
                    <asp:SessionParameter Name="mid" SessionField="&quot;mid&quot;" Type="Int32" />
                    <asp:Parameter DefaultValue="14" Name="locationid" Type="Int32" />
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
        </center>

    <%--<div>--%>
      <%--  <asp:GridView ID="gvDetails" DataKeyNames="examid,sid,qid" runat="server"
        AutoGenerateColumns="False" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
        ShowFooter="True" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" onrowediting="gvDetails_RowEditing"
        onrowupdating="gvDetails_RowUpdating" 
            onrowcancelingedit="gvDetails_RowCancelingEdit" 
            AlternatingRowStyle-BackColor="#E6FFFF" 
            onrowdatabound="gvDetails_RowDataBound1">
<AlternatingRowStyle BackColor="#E6FFFF"></AlternatingRowStyle>
      <Columns>
        <asp:TemplateField>
        <EditItemTemplate>
        <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.png" ToolTip="Update" Height="20px" Width="100px" />
        <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/cancel.png" ToolTip="Cancel" Height="20px" Width="100px" />
        </EditItemTemplate>
        <ItemTemplate>
        <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="~/Images/edit.png" ToolTip="Edit" Height="20px" Width="20px" />       
        </ItemTemplate>             
            <ControlStyle Width="100px" />
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Subject ID">
        <EditItemTemplate>
        <asp:Label ID="lbleditusr1" runat="server" Text='<%#Eval("sid") %>'/>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Label ID="lblitemUsr1" runat="server" Text='<%#Eval("sid") %>'/>
        </ItemTemplate>        
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Question ID">
        <EditItemTemplate>
        <asp:Label ID="lbleditusr" runat="server" Text='<%#Eval("qid") %>'/>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Label ID="lblitemUsr" runat="server" Text='<%#Eval("qid") %>'/>
        </ItemTemplate>        
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Question">
        <ItemTemplate>
        <asp:Label ID="lblcity5" runat="server" Text='<%#Eval("question") %>'/>
        </ItemTemplate>       
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Evidence">
        <EditItemTemplate>
        <asp:TextBox ID="txtDesg" runat="server" Text='<%#Eval("evidence") %>'/>
        </EditItemTemplate>
         <ItemTemplate>
        <asp:Label ID="lblcity" runat="server" Text='<%#Eval("evidence") %>'/>
        </ItemTemplate>        
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Comments">
        <EditItemTemplate>
        <asp:TextBox ID="txtDesg3" runat="server" Text='<%#Eval("comments") %>'/>
        </EditItemTemplate>
         <ItemTemplate>
        <asp:Label ID="lblcity3" runat="server" Text='<%#Eval("comments") %>'/>
        </ItemTemplate>        
        </asp:TemplateField>             
        <asp:TemplateField HeaderText="Conformance Score">
        <EditItemTemplate>
        <asp:TextBox ID="txtDesg2" runat="server" Text='<%#Eval("answer") %>'/>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Label ID="lblDesg2" runat="server" Text='<%#Eval("answer") %>'/>
        </ItemTemplate>     
        </asp:TemplateField>
        </Columns>

<HeaderStyle BackColor="#61A6F8" Font-Bold="True" ForeColor="White"></HeaderStyle>
        </asp:GridView>
        </div>

         <div>
             <asp:Label ID="lblresult" runat="server" Text="Label" Visible="False"></asp:Label>
         
         </div>   --%>
  
    


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
