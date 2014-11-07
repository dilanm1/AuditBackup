<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditReviewConsus.aspx.cs" Inherits="AuditMgtNew.AuditReviewConsus" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   
    <link href="Style/StyleSheet3.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
    <div id="header">
        <asp:Image ID="Image1" runat="server" Height="77px" 
            ImageUrl="~/Images/dubai_holding_logo.png" Width="178px" />
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
                    <asp:Label ID="lblLocation" runat="server" Text="Location:"></asp:Label><asp:Label
                        ID="lblLoc" runat="server" Text="Label"></asp:Label></asp:TableCell> 
       </asp:TableRow>
            <asp:TableRow Width="84%">
                <asp:TableCell  Width="50%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small">
                    <asp:Label ID="lblIndicatorName" runat="server" Text="Name"></asp:Label></asp:TableCell>
                    
                <asp:TableCell Width="50%" HorizontalAlign="right" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small">
                    <asp:Label ID="lblQnum" runat="server" Text="Qnum"  style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:Label ID="lblQid" runat="server" Text="Label"  style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"></asp:Label>
            </asp:TableCell>
            </asp:TableRow>
    </asp:table>
    
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
  <%--  <asp:CustomValidator id="CustomValidator1" runat="server" Visible="true" 
            Display="Dynamic" ErrorMessage="Conformance status is missing!" 
            ClientValidationFunction="CustomValidator1_ClientValidate" ForeColor="White" 
            OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>--%>
    <p>
    <br />
        <asp:Label ID="Label3" runat="server" Text="Estimated Conformance Status:" 
            ForeColor="#878787"></asp:Label><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="Evidence is missing!" 
                Font-Bold="True" 
                style="width: 5px; height: 19px" BackColor="#FF3300">Required</asp:RequiredFieldValidator>--%>
        </p>
        <br />
        <br />
    <br />
    <table id="table1">
    <tr>
    <td>
    <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" Text="0" 
            Font-Bold="True" ForeColor="#FF3300" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="ans1"></pre>
    </td>
        <%-- </tr>    
    <tr>--%>
    <td>
    <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" Text="1" 
            Font-Bold="True" ForeColor="Red" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans2"></pre>
    </td>
        <%-- </tr>    
    <tr>--%>
    <td>
    <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" Text="2" 
            Font-Bold="True" ForeColor="Red" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans3"></pre>
    </td>
        <%-- </tr>    
    <tr>--%>
    <td>
    <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" Text="3" 
            Font-Bold="True" ForeColor="Red" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans4"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns5" runat="server" GroupName="answer" Text="4" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre1"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns6" runat="server" GroupName="answer" Text="5" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre2"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns7" runat="server" GroupName="answer" Text="6" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre3"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns8" runat="server" GroupName="answer" Text="7" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre4"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns9" runat="server" GroupName="answer" Text="8" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre5"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns10" runat="server" GroupName="answer" Text="9" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre6"></pre>
    </td>
     <td>
    <asp:RadioButton ID="rbAns11" runat="server" GroupName="answer" Text="10" 
             Font-Bold="True" ForeColor="Red" />
    </td>    
    <td style="width: 3px">
    <pre runat="server" id="Pre7"></pre>
    </td>    
    </tr>      
   </table>
  
   <%--<script language="javascript" type="text/javascript" >
    function CustomValidator1_ClientValidate(source,args)
    {
        if (document.getElementById("<%= rbAns1.ClientID %>").checked || document.getElementById("<%= rbAns2.ClientID %>").checked || document.getElementById("<%= rbAns3.ClientID %>").checked)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    
    }
</script>--%>
  <br />
   <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="false" 
                ForeColor="red"  Font-Size="medium" HeaderText="Please correct the following errors:" 
                DisplayMode="SingleParagraph"  EnableClientScript="False" ClientIDMode="Static" />--%>
   <br />      
        <asp:table ID="tblAudit2" runat="server" border="0" style="font-size: 100%; font-family: Verdana;" >
            <asp:TableRow Width="100%">
                <asp:TableCell  Width="400" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small">Evidence</asp:TableCell>
                <asp:TableCell Width="400" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small">Auditors Comments</asp:TableCell>
                
            </asp:TableRow>
            <asp:TableRow Width="100%">
                <asp:TableCell  Width="49%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="97%"></asp:TextBox> <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Evidence is missing!" 
                Font-Bold="True" 
                style="width: 5px; height: 19px" BackColor="#FF3300" EnableClientScript="False" ClientIDMode="Static">Required</asp:RequiredFieldValidator>--%></asp:TableCell>
                <asp:TableCell Width="49%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:TextBox ID="TextBox3"
            runat="server" TextMode="MultiLine" Width="97%"></asp:TextBox><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="Comments is missing!" 
                Font-Bold="True" 
                style="width: 5px; height: 19px" BackColor="#FF3300" EnableClientScript="False" ClientIDMode="Static">Required</asp:RequiredFieldValidator>--%></asp:TableCell>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="Comments is missing!" 
                Font-Bold="True" 
                style="width: 5px; height: 19px" BackColor="#FF3300" EnableClientScript="False" ClientIDMode="Static">Required</asp:RequiredFieldValidator>--%>
           </asp:TableRow>

    </asp:table>
    
      <asp:table ID="tblButtons" runat="server" border="0" style="font-size: 100%; font-family: Verdana;" >
            <asp:TableRow Width="100%">
                <asp:TableCell  Width="5%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"> <asp:ImageButton ID="ImageButton6" runat="server"  ImageUrl="~/Images/guidance_button.png" /></asp:TableCell>
                <asp:TableCell Width="5%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Images/references_button.png" /></asp:TableCell>
                <asp:TableCell Width="5%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:ImageButton ID="ImageButton1" runat="server" onclick="ImageButton1_ServerClick" ImageUrl="~/Images/glossary_button.png" Visible="True" /></asp:TableCell>
                 <asp:TableCell Width="5%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:ImageButton ID="ImageButton3" runat="server" onclick="ImageButton3_ServerClick" ImageUrl="~/Images/cancel.png" Visible="True" /></asp:TableCell>
                
                 
                 <asp:TableCell Width="5%" HorizontalAlign="Left" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:ImageButton ID="ImageButton8" runat="server" onclick="ImageButton8_ServerClick" ImageUrl="~/Images/save_button.png"/></asp:TableCell>
              <%--   <asp:TableCell Width="5%" HorizontalAlign="right" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:ImageButton ID="ImageButton9" runat="server" onclick="ImageButton9_ServerClick" ImageUrl="~/Images/previous_button.png" /></asp:TableCell>
                 <asp:TableCell Width="5%" HorizontalAlign="right" style="font-weight:normal; color: #878787; background-color: " Font-Size="Small"><asp:ImageButton ID="btnNext" runat="server" onclick="btnNext_ServerClick" ImageUrl="~/Images/next_button.png" /><asp:ImageButton ID="ImageButton2" runat="server" Visible="false" onclick="ImageButton2_ServerClick" ImageUrl="~/Images/viewreport_button.png" /></asp:TableCell>--%>
            </asp:TableRow>
           
    </asp:table>
    <br />
    
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajax:ToolkitScriptManager>

    <%-- <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="" Text="New Employee"  />--%>    <%-- <asp:LinkButton ID="LinkButton2" runat="server" onclick="">Guidance</asp:LinkButton>--%>
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

 <asp:Panel ID="ModalPanel" runat="server" BorderColor="Black" BackColor="White" Height="550px"
        Width="600px" HorizontalAlign="Center" BorderStyle="Solid">
        <h3 style="text-align: center;"id="h1">Guidance</h3>
  <asp:TextBox ID="TextBox4" runat="server" ForeColor="Black" Height="450px" 
            TextMode="MultiLine" Width="500px"  BackColor="White" BorderStyle="None" 
            BorderColor="White" ontextchanged="TextBox4_TextChanged">Evidence</asp:TextBox>
          
 <asp:Button ID="OKButton1" runat="server" Text="Close" />
</asp:Panel>

   <%-- <ajax:ModalPopupExtender ID="MPE" runat="server" TargetControlID="Button3" PopupControlID="Panel1"
        BackgroundCssClass="modalBackground" CancelControlID="can" Drag="True" 
        DropShadow="True"> 
   </ajax:ModalPopupExtender>--%>

   <ajax:ModalPopupExtender ID="mpe" runat="server" TargetControlId="ImageButton6" 
 PopupControlID="ModalPanel" OkControlID="OKButton1" BackgroundCssClass="modalBackground" Drag="True" 
 DropShadow="True" PopupDragHandleControlID="header" />

  <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BackColor="White" Height="550px"
        Width="600px" HorizontalAlign="Center" BorderStyle="Solid">
        <h3 style="text-align: center;"id="header1">Reference</h3>
        <asp:TextBox ID="TextBox5" runat="server" ForeColor="Black" Height="450px" 
            TextMode="MultiLine" Width="500px"  BackColor="White" BorderStyle="None" 
            BorderColor="Silver" ontextchanged="TextBox5_TextChanged">Evidence</asp:TextBox>
<%-- <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Height="90%" onrowdatabound="GridView2_RowDataBound" 
          Width="100%" RowStyle-HorizontalAlign="Left" 
            AutoGenerateColumns="False">
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
        </asp:GridView>--%>
          
 <asp:Button ID="Button123" runat="server" Text="Close" />
</asp:Panel>

<ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlId="ImageButton7" 
 PopupControlID="Panel1" OkControlID="Button123" BackgroundCssClass="modalBackground" Drag="True" 
 DropShadow="True" PopupDragHandleControlID="header" />

    <%-- <ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton2" PopupControlID="Panel1"
        BackgroundCssClass="modalBackground" CancelControlID="can" Drag="True" BehaviorID="popUp2"
        DropShadow="True"  PopupDragHandleControlID="header">
    </ajax:ModalPopupExtender>--%>
   
     <div style="clear:both"></div>
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
