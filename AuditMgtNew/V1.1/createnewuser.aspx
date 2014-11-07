<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createnewuser.aspx.cs" Inherits="AuditMgtNew.createnewuser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link href="/Style/Sheet2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div class="wrapper">
    <div id="header">
    <div class="logo">    <asp:Image ID="Image1" runat="server" Height="77px" 
            ImageUrl="~/Images/dubai_holding_logo.png" Width="178px" /> </div>
        <ul>
			<li><a href="/HomePageTC.aspx">Tecom</a></li>
			<li><a href="/HomePageDP.aspx">Dubai Properties</a></li>
			<li><a href="/HomePageJM.aspx">Jumeirah</a></li>
			<li><a href="/Login.aspx">Home</a></li>
		</ul>
       
	</div>
    <div id="content">      
    <center> 

    <h2>
    New User Registration
    </h2>
    <table>
        <tr>
            <td>
                Login name :</td>
            <td >
                <asp:TextBox ID="txtLname" runat="server" style="text-align: left"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLname"
                    ErrorMessage="Login Name Required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                Password :
            </td>
            <td >
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                    ErrorMessage="Password is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                Confirm Password :</td>
            <td >
                <asp:TextBox ID="txtCpwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCpwd"
                    ErrorMessage="Confirm password required!"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                    ControlToValidate="txtCpwd" ErrorMessage="Passwords do not match!"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td >
                Fullname :</td>
            <td >
                <asp:TextBox ID="txtFname" runat="server" Width="243px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFname"
                    ErrorMessage="Fullname is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                Email Address :</td>
            <td >
                <asp:TextBox ID="txtEmail" runat="server" Width="240px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email address is required!"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
    </center>  


    </div>

    <div class="push"></div>
    
    </div>
     <div class="footer">
     <div class="copy">© CONSUS International LTD 2014</div>
       <%-- <div id="navigation1">--%>
		<ul>
			<li><a href="HomePageTC.aspx">Tecom</a></li>
			<li><a href="HomePageDP.aspx">Dubai Properties</a></li>
			<li><a href="HomePageJM.aspx">Jumeirah</a></li>
			<li><a href="MainPage.aspx">Home</a></li>
		</ul>
     </div>  
    </form>
</body>
</html>
