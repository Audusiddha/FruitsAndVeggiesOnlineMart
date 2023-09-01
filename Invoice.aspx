<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="User_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .rowHeight
    {
    height:30px;
    }
    .colLeft{
        text-align:center;
        font-size:12pt;
        vertical-align:middle;
    }   
     .borderstyle{
        border: medium double #000000;
        height:30px;
    }
    .borderbottonstyle{
        border-style: solid double double double; 
        border-width: 1px medium medium medium; 
        border-color: #000000;
        height:30px;
        
        
    }
    .tablestyle{
        width:auto; 
        border-right-style: double; 
        border-left-style: double;
        border-right-width: medium; 
        border-left-width: medium; 
        border-right-color: #000000; 
        border-left-color: #000000;         
    }
    .rwostyle{
        border-right-style: double;
        border-left-style: double;
        border-bottom-style: double; 
        border-right-width: medium; 
        border-left-width: medium;         
        border-bottom-width: medium;                 
        border-right-color: #000000; 
        border-left-color: #000000;
        border-bottom-color: #000000;
        height:30px;
    }
    .rightandbottom{
        text-align:left; 
        font-size:12pt; 
        border-right-style:double; 
        border-bottom-width:medium; 
        border-bottom-color:black; 
        width: 400px;
    }
   
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
        <div>
        <asp:Panel ID="Panel1" runat="server">
            <center>
        <table class="tablestyle">
            <tr class="borderstyle">
                <td style="text-align:center;font-size:12pt" colspan="2"><strong><span style="background-color: #FFFFCC;font-size: 15pt " >*Invoice*</span></strong></td>
            </tr>
            <tr class="borderstyle">
                <td class="rightandbottom"><span style="text-decoration: underline;"><strong>Seller Address</strong></span><br /> Fruits & Vegetables Mart<br /> <br /> Address: Nodel Colony,  ShivajiNagar,<br /> Pune, Maharashtra 411016<br /> Contact No: 91+9689408000<br /> For More details Visit Contact Us On your Site<br /> </td>                             
                <td style="text-align:left;font-size:12pt"><span style="text-decoration: underline;"><strong>Buyer Address</strong></span><br /> Order Date:<asp:Label ID="lblOrderdate" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>
                    <br />
                    FullName:<asp:Label ID="lblName" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>
                    <br />
                    Billing Address:<asp:Label ID="lblBillAddr" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>
                    <br />
                    City:<asp:Label ID="lblCity" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>
                    <br />
                    Contact No :
                    <asp:Label ID="lblcontactNo" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>
                </td>
            </tr>
            <tr style="height:50px">
                <td class="colLeft" colspan="2">  </td>
            </tr>
            <tr class="tablestyle">
                <td class="colLeft" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="List Of Products that you Purchased..!" CaptionAlign="Top" Font-Size="12pt" HorizontalAlign="Center" ShowFooter="True" Width="644px">
                        <Columns>
                            <asp:BoundField DataField="sno" HeaderText="Sr No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PID" HeaderText="ID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PName" HeaderText="Product Name">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PPrice" HeaderText="Price">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle Font-Size="12pt" ForeColor="#003300" HorizontalAlign="Center" />
                    </asp:GridView>                    
                </td>
            </tr>
            <tr class="borderbottonstyle">
                <td colspan="2"></td>
            </tr>
            <tr class="rowHeight">
                <td class="colLeft" colspan="2">
                    <span style="color:red">*</span>Payment Mode: Only Cash on Delivery is Accepted..
                    <br />
                </td>                             
            </tr>
            <tr class="rowHeight">
                <td colspan="2"></td>
            </tr>
            <tr class="borderbottonstyle">
                <td class="colLeft" colspan="2">
                    Thank You For You Purchase..!</td>                             
            </tr>
             
        </table>
                </center>
            </asp:Panel>
            <table style="width:100%">
                <tr>
                    <td style="width:700px">
                    </td>
                    <td class="colLeft">
                        <asp:ImageButton ID="imgBtnDownload" runat="server" ImageUrl="~/images/PDF.png" Width="131px" Height="40px" OnClick="imgBtnDownload_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="colLeft">
                         <asp:Button ID="btnPlaceOrder" runat="server" CssClass="btn btn-success" Font-Size="10pt" OnClick="btnPlaceOrder_Click" Text="Place Order" Width="131px" />
                    </td>
                </tr>
                </table>              
    </div>
       
</asp:Content>

