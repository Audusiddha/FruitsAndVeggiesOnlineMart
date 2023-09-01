<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSignUp.aspx.cs" Inherits="User_UserSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Boostrap/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">                              
       .textAlignCenter{
           text-align:center;
           vertical-align:central;
           background-image: url('../images/smile.gif');
           background-size:500px,800px

       }
        .copmlsry {
            color: red;
        }
        .leftcolstyle{
            font-size: 14pt;
            vertical-align: middle;
            text-align: left;
            font-family: 'Sitka Display';
            height: 60px;
            width:auto;
        }
         .righttcolstyle{
            font-size: 10pt;
            vertical-align: middle;
            text-align: left;
            font-family: 'Sitka Display';
            height: 60px;
        }
        .headerStyle{
            font-size: 16pt;
            color: #FFFFFF;
            line-height: normal;
            vertical-align: middle; 
            text-align: center;
            height: 38px;
            background-color: #3399FF;
        }
        .tableStyle{
            margin: 180px 500px auto 600px; 
            border: 1px solid black; 
            background-color: #99FFCC; 
            width: 346px; 
            height: 362px;

        }
        body{
        background-color: #080710;
        background-image: url('../images/gif8.gif');
        background-size:800px,800px;
        }
        .auto-style1 {
            width: 100%;
            height: 840px;
        }
        </style>
</head>
<body style="background-color:gainsboro ">
    <form id="form1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>       
    <div>
        <asp:MultiView ID="MultiviewUserSignup" runat="server" ActiveViewIndex="0">
                           
        <asp:View ID="View1" runat="server">
                <table class="tableStyle">
                <tr>
                    <td colspan="2" class="headerStyle">                        
                        Personal Details</td>
                </tr>
                <tr>
                    <td class="leftcolstyle">First Name<span class="copmlsry">*</span></td>
                    <td class="righttcolstyle">
                        <asp:TextBox ID="txtFirstName" placeholder="Enter FirstName" runat="server" Width="194px" MaxLength="50" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtFirstName_FilteredTextBoxExtender" runat="server" BehaviorID="txtFirstName_FilteredTextBoxExtender" TargetControlID="txtFirstName" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Please Enter First Name..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="PersonalDetails"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td class="leftcolstyle">
                      Last Name<span class="copmlsry">*</span></td>
                    <td  class="righttcolstyle">
                        <asp:TextBox ID="txtLastName" runat="server" Width="194px" MaxLength="50" CssClass="form-control" placeholder="Enter LastName"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtLastName_FilteredTextBoxExtender" runat="server" BehaviorID="txtLastName_FilteredTextBoxExtender" TargetControlID="txtLastName" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Please Enter Last Name..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="PersonalDetails"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td  class="leftcolstyle">
                        Gender<span class="copmlsry">*</span></td>
                    <td  class="righttcolstyle">                        
                        <asp:RadioButton ID="radiobtnMale" runat="server" Text="Male" GroupName="A" Checked="True" />                                            
                        <asp:RadioButton ID="radioBtnFemale" runat="server" Text="Female" GroupName="A" />                       
                    </td>
                </tr>
                <tr>
                    <td class="leftcolstyle">
                        DOB<span class="copmlsry">*</span> </td>
                    <td class="righttcolstyle">
                        <asp:TextBox ID="txtDOB" runat="server" MaxLength="50" Width="194px" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtDOB" Display="Dynamic" ErrorMessage="Please Select DOB..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="PersonalDetails"></asp:RequiredFieldValidator>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="txtDOB_TextBoxWatermarkExtender" runat="server" BehaviorID="txtDOB_TextBoxWatermarkExtender" TargetControlID="txtDOB" WatermarkText="Select Date Of Birth" />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtDOB" Display="Dynamic" ErrorMessage="Invalid Date Of Birth" ForeColor="#FF3300" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date" ValidationGroup="PersonalDetails"></asp:CompareValidator>
                    </td>
                </tr>
                    <tr>
                        <td class="leftcolstyle">
                           </td>
                        <td class="textAlignCenter">
                            <asp:Button ID="btnNextPersonal" runat="server" CssClass="btn btn-success" Height="34px" Text="Next" Width="102px" ValidationGroup="PersonalDetails" OnClick="btnNextPersonal_Click" Font-Size="10pt" />
                        </td>
                    </tr>
            </table>
        </asp:View>        
                  
<asp:View ID="View2" runat="server">
              <table class="tableStyle" >
                <tr>
                    <td colspan="2" class="headerStyle">                        
                        Contact Details</td>
                </tr>
                <tr>
                  <td class="leftcolstyle">
                      Mobile No<span class="copmlsry">*</span></td>
                    <td  class="righttcolstyle">
                        <asp:TextBox ID="txtMobileNo" runat="server" Width="194px" MaxLength="10" CssClass="form-control" placeholder="Enter Mobile No"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtMobileNo_FilteredTextBoxExtender" runat="server" BehaviorID="txtMobileNo_FilteredTextBoxExtender" TargetControlID="txtMobileNo" ValidChars="0123456789" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Please Enter Mobile No..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="ContactDetails"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td  class="leftcolstyle">
                        Address<span class="copmlsry">*</span></td>
                    <td class="righttcolstyle">
                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="100" Width="194px" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Your Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Please Enter Your Address..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="ContactDetails"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                        <td  class="leftcolstyle">City<span class="copmlsry">*</span></td>
                        <td class="righttcolstyle">
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" MaxLength="10" Width="194px" placeholder="Enter City Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Please Enter City Name.!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="ContactDetails"></asp:RequiredFieldValidator>
                        </td>
                  </tr>
                  <tr>
                      <td class="leftcolstyle">Pincode<span class="copmlsry">*</span></td>
                      <td class="righttcolstyle">
                          <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" MaxLength="6" Width="194px" placeholder="Enter Pincode"></asp:TextBox>
                          <ajaxToolkit:FilteredTextBoxExtender ID="txtPincode_FilteredTextBoxExtender" runat="server" BehaviorID="txtPincode_FilteredTextBoxExtender" TargetControlID="txtPincode" ValidChars="0123456789" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPincode" Display="Dynamic" ErrorMessage="Please Enter Your Pincode..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="ContactDetails"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPincode" Display="Dynamic" ErrorMessage="Enter Valid Pincode..!" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{6}" ValidationGroup="ContactDetails"></asp:RegularExpressionValidator>
                      </td>
                  </tr>
                    <tr>
                        <td class="textAlignCenter">
                            <asp:Button ID="btnBackcontact" runat="server" CausesValidation="False" CssClass="btn btn-primary" Height="34px" Text="Back" Width="102px" OnClick="btnBackcontact_Click" Font-Size="10pt" />
                        </td>
                        <td class="textAlignCenter">
                            <asp:Button ID="btnNextContact" runat="server" CssClass="btn btn-success" Height="34px" Text="Next" ValidationGroup="ContactDetails" Width="102px" OnClick="btnNextContact_Click" Font-Size="10pt" />
                        </td>
                    </tr>
            </table>
        </asp:View>

                <asp:View ID="View3" runat="server">
              <table class="tableStyle">
                <tr>
                    <td colspan="2" class="headerStyle">                        
                        Create Account </td>
                </tr>
                <tr>
                    <td class="leftcolstyle" >Security Question<span class="copmlsry">*</span></td>
                    <td class="righttcolstyle">
                        <asp:DropDownList ID="ddlSecurity" runat="server" Height="23px" Width="164px">
                            <asp:ListItem Selected="True">Your Favourite color</asp:ListItem>
                            <asp:ListItem>Your Favourite Place</asp:ListItem>
                            <asp:ListItem>Your Favourite Actor </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                    <tr>
                        <td class="leftcolstyle">Security Answer<span class="copmlsry">*</span></td>
                        <td class="righttcolstyle">
                            <asp:TextBox ID="txtSecAns" runat="server" CssClass="form-control" MaxLength="50" Width="180px" placeholder="Enter security Answer"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSecAns" Display="Dynamic" ErrorMessage="Please Enter Security Answer..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="account"></asp:RequiredFieldValidator>
                        </td>
                  </tr>
                  <tr>
                      <td class="leftcolstyle">(UserName)E-mail<span class="copmlsry">*</span> </td>
                      <td class="righttcolstyle">
                          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="50" placeholder="Enter Username" Width="180px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please Enter Mail-ID...!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="account"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please Enter Valid Email..!" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="account"></asp:RegularExpressionValidator>
                      </td>
                  </tr>
                    <tr>
                        <td class="leftcolstyle">Password<span class="copmlsry">*</span></td>
                        <td  class="righttcolstyle">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" MaxLength="12" Width="180px" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                            <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" BehaviorID="txtPassword_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="6" TargetControlID="txtPassword" BarBorderCssClass="" PrefixText="Strength:" TextCssClass="label-info" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Please Enter Password..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="account"></asp:RequiredFieldValidator>
                        </td>
                  </tr>
                    <tr>
                        <td class="leftcolstyle">Confirm Password<span class="copmlsry">*</span></td>
                        <td  class="righttcolstyle">
                            <asp:TextBox ID="txtReenterPassword" runat="server" CssClass="form-control" MaxLength="12" Width="180px" placeholder="Retype Password" TextMode="Password"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtReenterPassword" Display="Dynamic" ErrorMessage="Re-enter Password..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="account"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtReenterPassword" Display="Dynamic" ErrorMessage="Password Doesn't Match..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="account"></asp:CompareValidator>
                        </td>
                  </tr>
                    <tr>
                        <td class="textAlignCenter">
                            <asp:Button ID="btnBackAccount" runat="server" CausesValidation="False" CssClass="btn btn-primary" Height="36px" Text="Back" Width="109px" OnClick="btnBackAccount_Click" Font-Size="10pt" />
                        </td>
                        <td class="textAlignCenter">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Height="36px" Text="Submit" ValidationGroup="account" Width="109px" OnClick="btnSubmit_Click" Font-Size="10pt" />
                        </td>
                    </tr>
            </table>
        </asp:View>

                <asp:View ID="View4" runat="server">
                    <center>              
                              <table class="auto-style1">
                        <tr class="textAlignCenter">
                            <td>                                            
                                  <h3>Your Acount has been  Created Successfully...!
                                      <asp:LinkButton ID="lnkPassUserLogin" runat="server" Font-Size="16pt" PostBackUrl="~/User/UserLogin.aspx">Click Here To Login</asp:LinkButton>
                                  </h3>
                          </td>
                        </tr>
                    </table>
                        </center>
                </asp:View>
 
    </asp:MultiView>          
    </div>
        <script src="../Boostrap/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
