<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="TakeAudit.aspx.cs" Inherits="AuditMgtNew.TakeAudit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2>Take Examination</h2>
    <h3>Select Subject</h3>
    <asp:DropDownList ID="ddlSubjects" runat="server" DataSourceID="SqlDataSource1" DataTextField="sname"
        DataValueField="sid" Width="163px">
    </asp:DropDownList><br />
    <br />
    <asp:Button ID="btnStart" runat="server" Text="Start Exam" OnClick="btnStart_Click" /><br />
    <p/>
    <b>Note</b>
    <ul>
    <li>Each exam contains 5 question.</li><li>Use Next and Previous buttons to navigate between questions</li><li>Result is displayed after the last questions is answered</li><li>CANCEL button can be used to cancel the exam</li><li>No time limitation. However the time taken is stored in database</li></ul>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
        SelectCommand="SELECT [sid], [sname] FROM [oe_subjects]"></asp:SqlDataSource>


</asp:Content>
