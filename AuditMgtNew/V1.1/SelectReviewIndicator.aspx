<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SelectReviewIndicator.aspx.cs" Inherits="AuditMgtNew.SelectReviewIndicator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>Take Examination</h2>
    Select Subject :
    <asp:DropDownList ID="ddlSubjects" runat="server" DataSourceID="SqlDataSource1" DataTextField="sname"
        DataValueField="examid" Width="163px">
    </asp:DropDownList><br />
    <br />
    <asp:Button ID="btnStart" runat="server" Text="Start Review" 
        OnClick="btnStart_Click" /><br />
    <p/>
    <b>Note</b>
    <ul>
    <li>Each exam contains 5 question.</li><li>Use Next and Previous buttons to navigate between questions</li><li>Result is displayed after the last questions is answered</li><li>CANCEL button can be used to cancel the exam</li><li>No time limitation. However the time taken is stored in database</li></ul>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
        SelectCommand="SELECT [examid],[sname],[qid] FROM [tblFinalData]"></asp:SqlDataSource>

</asp:Content>
