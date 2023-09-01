<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="doreply.aspx.cs" Inherits="Admin_doreply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .rigthSide{
            height: 50px;
             vertical-align: middle;
              text-align: left;
              font-size: 12pt;
        }      
       .leftSide {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
            color: #000000;
            height: 50px;
            vertical-align: middle;
            text-align: right;
            width: 553px;
        }    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="alert alert-info">
        <table style="width:100% ">
            <tr style="height:30px">
                <td colspan="2" style="text-align:center; font-size:12pt ">
                    <div class="alert alert-warning">
                        Reply To User Feedback
                    </div>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Feedback ID:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lblFid" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Feedback Type:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lblFType" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Registered Date:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lbldate" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Full Name:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lbluserName" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Email ID:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lblEmailID" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Status:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lblStatus" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Feedback Message:&nbsp;</td>
                <td class="rigthSide">
                    <asp:Label ID="lblMsg" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftSide">Reply:&nbsp;</td>
                <td class="rigthSide">
                    <asp:TextBox ID="txtReply" runat="server" MaxLength="200" Rows="5" TextMode="MultiLine" Width="254px" CssClass="form-control" Height="101px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="txtReply_TextBoxWatermarkExtender" runat="server" BehaviorID="txtReply_TextBoxWatermarkExtender" TargetControlID="txtReply" WatermarkText="Type here..." />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReply" Display="Dynamic" ErrorMessage="Please Enter Feedback Reply..!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="leftSide"></td>
                <td class="rigthSide">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Font-Size="10pt" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

