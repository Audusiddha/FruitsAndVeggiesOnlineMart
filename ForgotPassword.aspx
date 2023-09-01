<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="User_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Boostrap/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
         .rigthSide{
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
            width: 585px;
        }  
        .tableWidth {
            width:100%;
        }      
         body{
        background-color: #080710;
        background-image: url('../images/gif12.gif');

        background-size:1150px,1000px;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
            color: #000000;
            height: 54px;
            vertical-align: middle;
            text-align: right;
            width: 597px;
        }
        .auto-style5 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            margin-left: 3;
            margin-top: 10;
        }
        .auto-style6 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
            color: #000000;
            height: 38px;
            vertical-align: middle;
            text-align: right;
            width: 597px;
        }
        .auto-style7 {
            height: 38px;
            vertical-align: middle;
            text-align: left;
        }
        .auto-style8 {
            height: 119px;
        }
        .auto-style9 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
            color: #000000;
            height: 54px;
            vertical-align: middle;
            text-align: right;
            width: 583px;
        }
    </style>
</head>
<body style="background-color:gainsboro;">
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="font-family: Arial, Helvetica, sans-serif; font-size: 20pt; color: #6699FF; vertical-align: middle; text-align: center; background-color: #99FFCC;height: 58px;">
            Password Recovery
        </div>
         <center>
              <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                  <asp:View ID="View1" runat="server">
                <table class="tableWidth">
                    <tr>
                       <td style="text-align:center; font-size: 16pt; color: #FF6699;" colspan="2" class="auto-style8">Confirm UserName<asp:HiddenField ID="HiddenField1" runat="server" />
                        </td>
                    </tr>                   
                    <tr>
                        <td class="auto-style3">UserName<span style="color:red;">*</span></td>
                        <td class="rigthSide">
                            <asp:TextBox ID="txtUsrname" runat="server" CssClass="auto-style5" MaxLength="50" Width="176px" Height="30px"></asp:TextBox>
                            <ajaxToolkit:TextBoxWatermarkExtender ID="txtUsrname_TextBoxWatermarkExtender" runat="server" BehaviorID="txtUsrname_TextBoxWatermarkExtender" TargetControlID="txtUsrname" WatermarkText="Enter UserName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsrname" Display="Dynamic" ErrorMessage="Please Enter UserName..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                        </td>
                        <td class="auto-style7">
                            <asp:Button ID="btnVerify" runat="server" CssClass="btn btn-primary" Font-Size="10pt" Height="33px" Text="Verify" Width="123px" OnClick="btnVerify_Click" style="margin-left: 41px" />
                        </td>
                    </tr>
                </table>
            </asp:View>
                  <asp:View ID="View2" runat="server">
                      <table class="tableWidth">
                          <tr>
                         <td style="text-align:center; height:120px; font-size: 16pt; color: #FF6699;" colspan="2">Security Question</td>
                    </tr>
                          <tr>
                               <td class="auto-style9">Security ?</td>
                        <td class="rigthSide">

                            <asp:Label ID="lblSecQue" runat="server" CssClass="badge" Font-Size="12pt"></asp:Label>

                            </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">

                                  Answer<span style="color:red;">*</span></td>
                              <td class="rigthSide">
                                  <asp:TextBox ID="txtSecAns" runat="server" CssClass="form-control" MaxLength="50" Width="165px" Height="34px"></asp:TextBox>
                                  <ajaxToolkit:TextBoxWatermarkExtender ID="txtSecAns_TextBoxWatermarkExtender" runat="server" BehaviorID="txtSecAns_TextBoxWatermarkExtender" TargetControlID="txtSecAns" WatermarkText="Enter Security Answer" />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSecAns" Display="Dynamic" ErrorMessage="Please Enter Security Answer..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9"></td>
                              <td class="rigthSide">
                                  <asp:Button ID="btnCheck" runat="server" CssClass="btn btn-info" Font-Size="10pt" Height="36px" OnClick="btnCheck_Click" Text="Check" Width="88px" />
                              </td>
                          </tr>
                      </table>
                  </asp:View>
                   <asp:View ID="View3" runat="server">
                <table class="tableWidth">
                    <tr>
                         <td style="text-align:center; height:120px; font-size: 16pt; color: #FF6699;" colspan="2">Set Password</td>
                    </tr>
                    <tr>
                        <td class="leftSide">New Password<span style="color:red;">*</span></td>
                        <td class="rigthSide">
                            <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" MaxLength="12" TextMode="Password" Width="191px" placeholder="Enter New Password" Height="22px"></asp:TextBox>
                            <ajaxToolkit:PasswordStrength ID="txtNewPass_PasswordStrength" runat="server" BehaviorID="txtNewPass_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="6" TargetControlID="txtNewPass" TextCssClass="alert-warning" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPass" Display="Dynamic" ErrorMessage="Please Enter New Password..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td class="leftSide">Retype Password<span style="color:red;">*</span></td>
                        <td class="rigthSide">
                            <asp:TextBox ID="txtRetypePass" runat="server" CssClass="form-control" MaxLength="12" TextMode="Password" Width="188px" placeholder="Confirm Password" Height="22px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRetypePass" Display="Dynamic" ErrorMessage="Please Retype Password..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtRetypePass" Display="Dynamic" ErrorMessage="Password Doesn't Match..!" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
                         </td>
                    </tr>
                    <tr>
                        <td class="leftSide">
                        </td>
                        <td class="rigthSide">
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Font-Size="10pt" Height="31px" Text="Update" Width="80px" OnClick="btnUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Font-Size="10pt" Height="30px" PostBackUrl="~/User/UserLogin.aspx" Text="Cancel" Width="87px" CausesValidation="False" />

                        </td>
                    </tr>
                </table>
            </asp:View>
                  </asp:MultiView> 
             </center>  
    </div>
        <script src="../Boostrap/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
