<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StartReview.aspx.cs" Inherits="AuditMgtNew.StartReview" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h2>Audit Review</h2>
    <table width="100%" bgcolor="#dddddd">
    <tr>
    <td style="width: 531px">
        Indicator Name :
        <asp:Label ID="lblSubject" runat="server" Width="374px" Font-Bold="True" 
            Font-Names="Verdana" ForeColor="Gray"></asp:Label></td>
    <td>
        Question :
        <asp:Label ID="lblQno" runat="server" Font-Bold="True" Font-Names="Verdana" 
            ForeColor="Gray"></asp:Label></td>
           
    </tr>
    <tr>
    <td style="width: 531px">
        Started At :
        <asp:Label ID="lblStime" runat="server" Font-Bold="True" Font-Names="Verdana" 
            ForeColor="Gray"></asp:Label></td>
    <td style="height: 22px">
        Current Time :<asp:Label ID="lblCtime" runat="server" Font-Bold="True" 
            Font-Names="Verdana" ForeColor="Gray"></asp:Label></td>
    </tr>
    </table>
    
    <p />
    <b>Question:</b>
        <br />
        <%--<b><pre runat=server id="question" style="background-color:#eeeeee">question</pre> </b>--%>
    <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="300px" 
            TextMode="MultiLine" Width="100%" BackColor="#dddddd" BorderStyle="None"></asp:TextBox>
    <p>Current Conformance Status:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>Reviwed Conformance Status:</p>
    <table>
    <tr>
    <td>
    <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" Text="0" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="ans1"></pre>
    </td>
        <%-- </tr>    
    <tr>--%>
    <td>
    <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" Text="1" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans2"></pre>
    </td>
        <%-- </tr>    
    <tr>--%>
    <td>
    <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" Text="2" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans3"></pre>
    </td>
        <%-- </tr>    
    <tr>--%>
    <td>
    <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" Text="3" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans4"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns5" runat="server" GroupName="answer" Text="4" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre1"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns6" runat="server" GroupName="answer" Text="5" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre2"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns7" runat="server" GroupName="answer" Text="6" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre3"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns8" runat="server" GroupName="answer" Text="7" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre4"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns9" runat="server" GroupName="answer" Text="8" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre5"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns10" runat="server" GroupName="answer" Text="9" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre6"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns11" runat="server" GroupName="answer" Text="10" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre7"></pre>
    </td>
    
    </tr>
    
    </table>    
    <p />
    <br />
        <%--<b><pre runat=server id="question" style="background-color:#eeeeee">question</pre> </b>--%>
    <asp:TextBox ID="TextBox2" runat="server" ForeColor="Black" Height="100px" 
            TextMode="MultiLine" Width="49%"  BackColor="#dddddd" BorderStyle="None">Evidence</asp:TextBox>
     <asp:TextBox ID="TextBox3" runat="server" ForeColor="Black" Height="100px" 
            TextMode="MultiLine" Width="49%" BackColor="#dddddd" BorderStyle="None">Comments</asp:TextBox>
    <br />
        <br />
        <asp:Button ID="btnPrev" runat="server" Text="Previous" OnClick="btnPrev_Click" 
            Width="115px" />&nbsp;<asp:Button ID="btnNext"
            runat="server" Text="Next" Width="115px" OnClick="btnNext_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Audit" Width="115px" 
            OnClick="btnCancel_Click" />
        
    

        <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" 
            Width="115px" />

       <asp:Button ID="ClientButton" runat="server" Text="Guidance" 
            onclick="ClientButton_Click" Width="115px" />
        <asp:Button ID="Button2" runat="server" Text="Reference" 
            onclick="Button2_Click" Width="115px" />

    <ajax:toolkitscriptmanager ID="ToolkitScriptManager1" runat="server">
    </ajax:toolkitscriptmanager>

    <%-- <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="" Text="New Employee"  />--%>
    <%-- <asp:LinkButton ID="LinkButton2" runat="server" onclick="">Guidance</asp:LinkButton>--%>

    <%--<asp:Panel ID="Panel1" runat="server" BorderColor="Black" BackColor="White" Height="600px"
        Width="800px" HorizontalAlign="Center" BorderStyle="Solid">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Height="90%" onrowdatabound="GridView1_RowDataBound" 
            ShowHeader="true" Width="100%" RowStyle-HorizontalAlign="Left" 
            AutoGenerateColumns="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
           <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button2_Click" margin-bottom="0px"/>
        <asp:Button ID="Button2" runat="server" Text="cancel" onclick="can_Click" margin-bottom="0px" />
    </asp:Panel>    --%>

 <asp:Panel ID="ModalPanel" runat="server" BorderColor="Black" BackColor="White" Height="600px"
        Width="800px" HorizontalAlign="Center" BorderStyle="Solid">
 <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Height="90%" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="False"
         Width="100%" RowStyle-HorizontalAlign="Left">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField HeaderText="Guidance" />
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
           <br />
        <br />
 <asp:Button ID="OKButton" runat="server" Text="Close" />
</asp:Panel>

   <%-- <ajax:ModalPopupExtender ID="MPE" runat="server" TargetControlID="Button3" PopupControlID="Panel1"
        BackgroundCssClass="modalBackground" CancelControlID="can" Drag="True" 
        DropShadow="True"> 
   </ajax:ModalPopupExtender>--%>

   <ajax:modalpopupextender ID="mpe" runat="server" TargetControlId="ClientButton" 
 PopupControlID="ModalPanel" OkControlID="OKButton" 
        BackgroundCssClass="modalBackground" Drag="True" 
 DropShadow="True" PopupDragHandleControlID="header" />

  <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BackColor="White" Height="600px"
        Width="800px" HorizontalAlign="Center" BorderStyle="Solid">
 <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Height="90%" onrowdatabound="GridView2_RowDataBound" 
            ShowHeader="true" Width="100%" RowStyle-HorizontalAlign="Left" 
            AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                <asp:BoundField ReadOnly="True" HeaderText="Guidance" 
                   InsertVisible="False"></asp:BoundField>
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
           <br />
        <br />
 <asp:Button ID="Button1" runat="server" Text="Close" />
</asp:Panel>

<ajax:modalpopupextender ID="ModalPopupExtender1" runat="server" TargetControlId="Button2" 
 PopupControlID="Panel1" OkControlID="Button1" 
        BackgroundCssClass="modalBackground" Drag="True" 
 DropShadow="True" PopupDragHandleControlID="header" />

    <%-- <ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton2" PopupControlID="Panel1"
        BackgroundCssClass="modalBackground" CancelControlID="can" Drag="True" BehaviorID="popUp2"
        DropShadow="True"  PopupDragHandleControlID="header">
    </ajax:ModalPopupExtender>--%>
       
    
</asp:Content>
