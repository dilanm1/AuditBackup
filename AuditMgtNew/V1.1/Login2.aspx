<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="AuditMgtNew.Login" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   
<center>               
        
        <br />
        <br />
        <asp:Panel ID="panel1" runat="server" BackColor="White" Width="600px" 
            Height="410px" HorizontalAlign="Center" BorderStyle="Solid">
                  
        <br />
                   
                
                <asp:TextBox ID="txtLname" runat="server" Width="150px" Height="20px" 
                        
                style="margin-left: 0px; z-index: 1; left: 379px; top: 210px; position: absolute; right: 181px; margin-top: 3px;" 
                ForeColor="#CCCCCC" BorderStyle="Outset"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtLname" ErrorMessage="Llogin name is missing!" 
                Font-Bold="True" 
                style="z-index: 1; left: 581px; top: 218px; position: absolute; width: 5px; height: 19px">*</asp:RequiredFieldValidator>
                     
               
                <asp:Label ID="Label1" runat="server" 
                style="z-index: 1; left: 299px; top: 215px; position: absolute; height: 19px; width: 64px" 
                Text="Username:" ForeColor="#878787"></asp:Label>
            <asp:Label ID="Label2" runat="server" 
                style="z-index: 1; left: 299px; top: 245px; position: absolute; width: 63px;" 
                Text="Password:" ForeColor="#878787"></asp:Label>
                     
               
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px" 
                        Height="20px" ForeColor="#CCCCCC" 
                        style="z-index: 1; left: 379px; top: 244px; position: absolute" 
                BorderStyle="Outset" ontextchanged="txtPwd_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtPwd" ErrorMessage="Password is missing!" Font-Bold="True" 
                style="z-index: 1; left: 581px; top: 247px; position: absolute; width: 8px; height: 19px">*</asp:RequiredFieldValidator>
                    
         
             &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Images/login_button.png" 
                style="z-index: 1; left: 380px; top: 310px; position: absolute" 
                onclick="ImageButton1_Click" />
            <br />
            <br />
            <telerik:spellcheckvalidator runat="server"></telerik:spellcheckvalidator>
            <p> <asp:CheckBox ID="chkRemember" runat="server" Text="Remember Me" 
                    oncheckedchanged="chkRemember_CheckedChanged" 
                    style="z-index: 1; left: 381px; top: 281px; position: absolute" 
                    ForeColor="#878787" /> </p>                
        <asp:Label ID="lblMsg" runat="server" 
                style="z-index: 1; left: 414px; top: 349px; position: absolute" 
                ForeColor="#878787"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="False" 
                ForeColor="#878787" HeaderText="Please correct the following errors:" 
                DisplayMode="List" />
        <br />
        <br />
            <br />
            <p>
                <a href="newuser.aspx"style="color: #878787">New User?</a>
                <a href="all/forgotpassword.aspx" style="color: #878787">Forgot Password?</a>
            </p>
        </asp:Panel>
        <asp:SqlDataSource ID="dsLogin" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
            SelectCommand="select * from members where  lname = @lname and pwd = @pwd">
            <SelectParameters>
                <asp:Parameter Name="lname" />
                <asp:Parameter Name="pwd" />
            </SelectParameters>
        </asp:SqlDataSource>
   
    </center>    
    
</asp:Content>
