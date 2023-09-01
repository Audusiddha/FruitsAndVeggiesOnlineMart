<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="User_Feedback.cs" Inherits="User_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .emptyrow{
            width:75px; 
            height:30px;                             
               }
        .colStyle{
            text-align:left; 
            font-size:12pt;
            font-family:Arial;
        }
        .feedreply{
            height:60px; 
            text-align:center;
            font-size:12pt
        }
 </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <div>
        <asp:HiddenField ID="hdfUserName" runat="server" />
   <center>
       <table>
           <tr style="height:60px">
               <td style="border: 2px solid #FF66CC;" colspan="2">
                   <span class="colStyle"> Feedback Form <br/></span>  
                 <span class="colStyle">
                     We would love to hear thoughts, suggestions, concerns or problems with anything so we can improve! 
                 </span>     
               </td>
           </tr>
           <tr class="emptyrow">
               <td colspan="2"></td>
           </tr>
           <tr>
               <td class="emptyrow"></td>
                <td class="colStyle">Feedback Type</td>
           </tr>
           <tr>
               <td class="emptyrow"></td>
               <td class="colStyle" >
                   <asp:RadioButton ID="radioCmt" runat="server" Font-Size="10pt" Text="Comment" Checked="True" GroupName="Feed" />  
                   &nbsp; &nbsp;&nbsp; <asp:RadioButton ID="radioQue" runat="server" Font-Size="10pt" Text="Question" GroupName="Feed" />&nbsp;&nbsp;&nbsp;&nbsp;                  
                      <asp:RadioButton ID="radioSug" runat="server" Font-Size="10pt" Text="Suggestion" GroupName="Feed" />
               </td>
           </tr>
           <tr class="colStyle">
               <td colspan="2"></td>
           </tr>
           <tr>
               <td class="emptyrow"> </td>              
                  <td  class="colStyle">
                     Describe Your Feedback<span style="color:red;">*</span> 
                  </td>
           </tr>
           <tr>
               <td class="emptyrow"></td>
                  <td  class="colStyle">
                      <asp:TextBox ID="txtfeedback" runat="server" Height="103px" MaxLength="200" TextMode="MultiLine" Width="400px" CssClass="form-control"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfeedback" Display="Dynamic" ErrorMessage="Please Mention Feedback..!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      <ajaxToolkit:TextBoxWatermarkExtender ID="txtfeedback_TextBoxWatermarkExtender" runat="server" BehaviorID="txtfeedback_TextBoxWatermarkExtender" TargetControlID="txtfeedback" WatermarkText="Type here..!" />
                  </td>
           </tr>
          <tr class="colStyle">
               <td colspan="2">
               </td>
           </tr>
           <tr>
               <td class="emptyrow"></td>               
                  <td  class="colStyle">
                      Name<span style="color:red">*</span></td>
           </tr>
           <tr>
               <td class="emptyrow"></td>               
                  <td  class="colStyle">
                      <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control" MaxLength="50" Width="231px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname" Display="Dynamic" ErrorMessage="Please Enter FirstName..!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      <ajaxToolkit:FilteredTextBoxExtender ID="txtFirstname_FilteredTextBoxExtender" runat="server" BehaviorID="txtFirstname_FilteredTextBoxExtender" TargetControlID="txtFirstname" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
                      <ajaxToolkit:TextBoxWatermarkExtender ID="txtFirstname_TextBoxWatermarkExtender" runat="server" BehaviorID="txtFirstname_TextBoxWatermarkExtender" TargetControlID="txtFirstname" WatermarkText="Enter FirstName" />
                       </td>
           </tr>
           <tr style="height:20px">
               <td colspan="2">
               </td>
           </tr>
           <tr>
               <td class="emptyrow"></td>
               
                  <td  class="colStyle">
                      <asp:TextBox ID="txtLastnName" runat="server" CssClass="form-control" MaxLength="50" Width="231px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastnName" Display="Dynamic" ErrorMessage="Please Enter LastName..!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      <ajaxToolkit:FilteredTextBoxExtender ID="txtLastnName_FilteredTextBoxExtender" runat="server" BehaviorID="txtLastnName_FilteredTextBoxExtender" TargetControlID="txtLastnName" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
                      <ajaxToolkit:TextBoxWatermarkExtender ID="txtLastnName_TextBoxWatermarkExtender" runat="server" BehaviorID="txtLastnName_TextBoxWatermarkExtender" TargetControlID="txtLastnName" WatermarkText="Enter LastName" />
                       </td>
           </tr>
           <tr style="height:20px">
               <td colspan="2"></td>             
           </tr>
           <tr>
               <td class="emptyrow"></td>
               <td class="colStyle"> E-mail<span style="color:red">*</span></td>
           </tr>
           <tr>
               <td class="emptyrow"></td>             
                  <td  class="colStyle"">
                      <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="50" Width="231px"></asp:TextBox>
                      <ajaxToolkit:TextBoxWatermarkExtender ID="txtEmail_TextBoxWatermarkExtender" runat="server" BehaviorID="txtEmail_TextBoxWatermarkExtender" TargetControlID="txtEmail" WatermarkText="Enter E-mail ID" />
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Enter valid Email-ID..!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please Enter E-Mail ID..!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </td>
           </tr>
           <tr style="height:20px">
               <td colspan="2" >
               </td>
           </tr>
           <tr>
               <td class="emptyrow"></td>             
                  <td  class="colStyle">
                      <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Font-Size="10pt" Text="Submit Feedback" Width="153px" OnClick="btnSubmit_Click" />
                      </td>
           </tr>
           <tr>
               <td class="emptyrow"></td>
               <td></td>
           </tr>
           <tr>
               <td class="colStyle"></td>
               <td>
                   <asp:LinkButton ID="lnkStatus" runat="server" CausesValidation="False" Font-Size="10pt" OnClick="lnkStatus_Click" CssClass="btnVisited">Check Feedback Status</asp:LinkButton>
               </td>
           </tr>
       </table>
   </center>
    </div>
    <div>
        <center>        
                   <asp:Panel ID="Panel1" runat="server" Visible="False">
                       <table style="width:100%">
                           <tr class="feedreply">
                               <td style="text-decoration: underline; font-size: 14pt; color: #0000FF;">Feedback Reply </td>
                           </tr>
                           <tr class="feedreply">
                               <td >
                                   <asp:Label ID="lblque" runat="server" CssClass="badge" Font-Size="12pt">Your Feedback</asp:Label>
                                   <asp:Label ID="lblqueshow" runat="server" Font-Size="12pt"></asp:Label>
                               </td>
                           </tr>
                           <tr class="feedreply">
                               <td>
                                   <asp:Label ID="lblStatus" runat="server" CssClass="badge" Font-Size="12pt">Feedback Status</asp:Label>
                                   <asp:Label ID="lblStatusShow" runat="server" Font-Size="12pt"></asp:Label>
                               </td>
                           </tr>
                           <tr class="feedreply">
                               <td>
                                   <asp:Label ID="lblReply" runat="server" CssClass="badge" Font-Size="12pt"></asp:Label>
                                   <asp:Label ID="lblReplyShow" runat="server" Font-Size="12pt"></asp:Label>
                               </td>
                           </tr>
                       </table>
                   </asp:Panel>                   
            </center>
    </div>
</asp:Content>

