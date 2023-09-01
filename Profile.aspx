<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .headerStyle{           
            font-size:14pt;
            font-family:'Times New Roman', Times, serif;
            width:600px;text-align:center; 
            height:35px; 
            background-color:#F2DEDE; 
            color: #000000;
            height:35px;
        }
        .leftSide
        {
            text-align:right;
            font-size:14pt;
            font-family:'Times New Roman', Times, serif;
            height:40px;
              width: 650px;
        }
         .rightSide
        {
            text-align:left;
            font-size:14pt;
            font-family:'Times New Roman', Times, serif;
            height:40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <center>
        <div class="alert alert-success">           
    <div class="alert alert-warning" style="font-size:14pt;font-family:Arial; height:40px;vertical-align:top ">
          <span class="glyphicon glyphicon-user" style="color:Highlight"></span>About You
    </div>
        <div>
            <table style="width:100%">
              <tr class="headerStyle">
                  <td  colspan="2">
                      Personal Details</td>                  
              </tr>
                <tr>
                    <td class="leftSide">
                        First Name:</td>
                    <td class="rightSide">
                        <asp:Label ID="lblFirstName" runat="server" Font-Size="14pt" ForeColor="#003366"></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td class="leftSide">
                        Last Name:</td>
                    <td class="rightSide">
                        <asp:Label ID="lblLastName" runat="server" Font-Size="14pt" ForeColor="#003366"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">
                        Email-ID:</td>
                    <td class="rightSide">                     
                        <asp:Label ID="lblemail" runat="server" Font-Size="14pt" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">Date of Birth:</td>
                    <td class="rightSide"><asp:Label ID="lblDOB" runat="server" Font-Size="14pt" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                 <tr class="headerStyle">
                  <td colspan="2">
                      Contact Details
                      ..Do You Want To Edit?</td>                  
              </tr>
                 <tr style="height:40px">
                    <td class="leftSide">
                        Address:<asp:Label ID="lblAddress" runat="server" Font-Size="14pt" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="rightSide">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" MaxLength="100"  Width="200px" placeholder="Enter Your Address" Rows="3" TextMode="MultiLine" ValidationGroup="save"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please Enter Address..!" ForeColor="#FF5050" SetFocusOnError="True" ControlToValidate="txtAddress" ValidationGroup="save" Font-Size="8pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style="height:40px">
                    <td class="leftSide">
                        City:<asp:Label ID="lblCity" runat="server" Font-Size="14pt" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="rightSide">                     
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" MaxLength="50" Width="200px" placeholder="Enter City Name" ValidationGroup="save"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Please Enter City Name.!" ForeColor="#FF5050" SetFocusOnError="True" ControlToValidate="txtCity" ValidationGroup="save" Font-Size="8pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">Contact No:<asp:Label ID="lblContact" runat="server" Font-Size="14pt" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="rightSide">
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" MaxLength="10" Width="200px" placeholder="Enter Mobile No" ValidationGroup="save"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtContact_FilteredTextBoxExtender" runat="server" BehaviorID="txtContact_FilteredTextBoxExtender" TargetControlID="txtContact" ValidChars="0123456789" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="Please Enter Contact No..!" ForeColor="#FF5050" SetFocusOnError="True" ControlToValidate="txtContact" ValidationGroup="save" Font-Size="8pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td >

                    </td>
                    <td style="height:40px" class="rightSide">
                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" Text="Save Changes" Width="120px" ValidationGroup="save" Font-Size="10pt" OnClick="btnsave_Click1" />
                    </td>
                </tr>
                <tr class="headerStyle">
                    <td  colspan="2">
                        Do You Want to
                      Change  your Password ?</td>                                    
                </tr>
                <tr>
                    <td class="leftSide">Current Password:</td>
                    <td class="rightSide">
                        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" MaxLength="12" Width="200px" placeholder="Enter old Password" CausesValidation="True" ValidationGroup="Update"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Please Enter Old Password..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Update" Font-Size="8pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide">New Password:</td>
                    <td class="rightSide">
                        <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" MaxLength="12" Width="200px" TextMode="Password" placeholder="Enter New Password" CausesValidation="True" ValidationGroup="Update"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewPass" Display="Dynamic" ErrorMessage="Please Enter New Password..!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Update" Font-Size="8pt"></asp:RequiredFieldValidator>
                        <ajaxToolkit:PasswordStrength ID="txtNewPass_PasswordStrength" runat="server" BehaviorID="txtNewPass_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="6" TargetControlID="txtNewPass" />
                    </td>
                </tr><tr>
                    <td class="leftSide">Confirm Password:</td>
                    <td class="rightSide">
                        <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" MaxLength="12" Width="200px" TextMode="Password" placeholder="Confirm Password" CausesValidation="True" ValidationGroup="Update"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtConfirmPass" Display="Dynamic" ErrorMessage="Please Retype password.!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Update" Font-Size="8pt"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" Display="Dynamic" ErrorMessage="Password Doesn't Match..!" ForeColor="Red" SetFocusOnError="True" Font-Size="8pt"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="leftSide"></td>
                    <td class="rightSide">
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-danger" Text="Update" Width="80px" ValidationGroup="Update" Font-Size="10pt" Height="34px" OnClick="btnUpdate_Click1" />
                    </td>
                </tr>
                <tr>
                    <td class="leftSide"></td>
                    <td class="rightSide"></td>
                </tr>
            </table>
        </div>
             </div>
        </center>
</asp:Content>

