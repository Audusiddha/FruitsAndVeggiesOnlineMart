<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="User_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         .colStyle{
             text-align:center;
             height:50px;
         }
         .textAlign{
             text-align: center;
             font-size:12pt;
         }
          .CenterHeaderText th
     {
         text-align:center;
         vertical-align:middle;
     }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
  <table style="width:100% ">
      <tr>
          <td class="colStyle">  </td>
      </tr>
      <tr>
          <td class="colStyle">
              <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="10pt" NavigateUrl="~/User/Products.aspx" CssClass="btnVisited"><span class="glyphicon glyphicon-shopping-cart" style="width: 60px; height: 40px">Continue Shopping..</asp:HyperLink>
          </td>
      </tr>
        <tr>
            <td class="textAlign">         
                You Have
                <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
                Produtcs In Your cart..</td>
        </tr>      
        <tr>
            <td class="textAlign"> 
         
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Size="11pt" Height="311px" HorizontalAlign="Center" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" Width="890px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="sno" HeaderText="Sr. No">
                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PID" HeaderText="ID">
                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="PImage" HeaderText="Image">
                            <ControlStyle Height="100px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="PName" HeaderText="Product Name">
                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PPrice" HeaderText="Price">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="Quantity">
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:CommandField DeleteText="Remove" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" BorderColor="White" Font-Bold="True" ForeColor="White" Height="25px" />
                    <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="White" Height="35px" CssClass="CenterHeaderText" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
         
            </td>
        </tr>      
        <tr>
            <td class="colStyle">                     
                <asp:Button ID="btnBuy" runat="server" CausesValidation="False" CssClass="btn btn-primary" Font-Size="10pt" Height="33px"  Text="BUY NOW" Width="109px" Enabled="False" PostBackUrl="~/User/Invoice.aspx" />                    
                </td>
        </tr>      
      </table>
        </div>
</asp:Content>

