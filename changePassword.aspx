<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="Admin_changePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style type="text/css">
    .rigthSide {
        height: 54px;
        vertical-align: middle;
        text-align: left;
    }

    .leftSide {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12pt;
        color: #000000;
        height: 54px;
        vertical-align: middle;
        text-align: right;
        width: 553px;
    }

    .redcolor {
        color: red;
    }

    .hedaerstyle {
        font-family: Bahnschrift;
        font-size: 20pt;
        color: white;
        background-color: lightseagreen;
        vertical-align: middle;
        text-align: center;
        height: 56px;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table style="width:100%">
        <tr>
            <td  colspan="2" class="hedaerstyle"><span class="glyphicon glyphicon-lock" style="color:whitesmoke"></span>
          Change Password</td>    
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

        <asp:View ID="View1" runat="server">
             <table style="width:100%;">
       <tr>
           <td class="leftSide" colspan="2"></td>   
       </tr>
            <tr>
                <td class="leftSide">                    
                </td>
                <td class="rigthSide">
                    <asp:HiddenField ID="hdfUsr" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="leftSide">   
                    UserName(E-Mail)<span class="redcolor">*</span>                
                </td>
                <td class="rigthSide">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" MaxLength="50" Width="210px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="txtUsername_TextBoxWatermarkExtender" runat="server" BehaviorID="txtUsername_TextBoxWatermarkExtender" TargetControlID="txtUsername" WatermarkText="Enter UserName" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Please Enter UserName..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="leftSide">                    
                </td>
                <td class="rigthSide">
                    <asp:Button ID="btnVerify" runat="server" CssClass="btn btn-primary" Font-Size="10pt" Text="Verify" Width="92px" OnClick="btnVerify_Click1" />
                </td>
            </tr>          
            </table>
        </asp:View>

        <asp:View ID="View2" runat="server">
            <table>
                 <tr>
           <td class="leftSide" colspan="2">
               &nbsp;</td>   
                  </tr>
                <tr>
                    <td class="leftSide">
                        Old Password<span class="redcolor">*</span>
                    </td>
                    <td class="rigthSide">

                        <asp:TextBox ID="txtOldPass" runat="server" CssClass="form-control" MaxLength="12" Width="184px"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="txtOldPass_TextBoxWatermarkExtender" runat="server" BehaviorID="txtOldPass_TextBoxWatermarkExtender" TargetControlID="txtOldPass" WatermarkText="Enter Old Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOldPass" Display="Dynamic" ErrorMessage="Enter Old Password..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">
                        New Password<span class="redcolor">*</span>
                    </td>
                    <td class="rigthSide">
                        <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" MaxLength="12" Width="184px" TextMode="Password"></asp:TextBox>                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPass" Display="Dynamic" ErrorMessage="Enter New Password..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <ajaxToolkit:PasswordStrength ID="txtNewPass_PasswordStrength" runat="server" BarBorderCssClass="bg-warning" BehaviorID="txtNewPass_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="6" TargetControlID="txtNewPass" />
                        <ajaxToolkit:TextBoxWatermarkExtender ID="txtNewPass_TextBoxWatermarkExtender" runat="server" BehaviorID="txtNewPass_TextBoxWatermarkExtender" TargetControlID="txtNewPass" WatermarkText="Enter New Password" />
                       
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">Retype Password<span class="redcolor">*</span></td>
                    <td class="rigthSide">
                        <asp:TextBox ID="txtRetypePass" runat="server" CssClass="form-control" MaxLength="12" TextMode="Password" Width="184px"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="txtRetypePass_TextBoxWatermarkExtender" runat="server" BehaviorID="txtRetypePass_TextBoxWatermarkExtender" TargetControlID="txtRetypePass" WatermarkText="Retype Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRetypePass" Display="Dynamic" ErrorMessage="Retype Password..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtRetypePass" Display="Dynamic" ErrorMessage="Password Doesn't Password..!" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">

                    </td>
                    <td class="rigthSide">
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-warning" Font-Size="10pt" Height="36px" Text="Update" Width="92px" OnClick="btnUpdate_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn btn-info" Font-Size="10pt" OnClick="btnUpdate_Click" PostBackUrl="~/Admin/Default.aspx" Text="Cancel" Width="92px" />
                    </td>
                </tr>
            </table>
        </asp:View>

    </asp:MultiView>

       
</asp:Content>

