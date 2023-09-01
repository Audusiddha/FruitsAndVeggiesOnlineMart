<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="User_MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .rowstyle{
            height: 54px;
             vertical-align: middle;
              text-align: center;
        } 
     .CenterHeaderText th
     {
         text-align:center;
         vertical-align:middle;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
      <table style="width:100%" class="alert-info">           
          <tr style="vertical-align:bottom;">             
              <td>  
                   <div class="rowstyle">
                       <asp:Label ID="Label1" runat="server" Font-Size="12pt" ForeColor="Black"></asp:Label>
                   </div>             
              </td>
          </tr>
          <tr class="rowstyle">
              <td>
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CaptionAlign="Top" CellPadding="3" DataSourceID="SqlDataSource1" Font-Size="12pt" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" PageSize="8" Width="901px" DataKeyNames="OrderID">
                      <AlternatingRowStyle BackColor="#CCCCCC" />
                      <Columns>
                          <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                          <asp:BoundField DataField="PID" HeaderText="Product ID" SortExpression="PID" />
                          <asp:BoundField DataField="PName" HeaderText="Product Name" SortExpression="PName" />
                          <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                          <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                          <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" SortExpression="OrderStatus" />
                          <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
                      </Columns>
                      <FooterStyle BackColor="#CCCCCC" />
                      <HeaderStyle BackColor="#333333" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Height="37px" VerticalAlign="Middle" CssClass="CenterHeaderText" />
                      <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                      <PagerStyle BackColor="#F0F0F0" BorderColor="White" BorderStyle="Solid" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Bottom" />
                      <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="40px" />
                      <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                      <SortedAscendingCellStyle BackColor="#F1F1F1" />
                      <SortedAscendingHeaderStyle BackColor="#808080" />
                      <SortedDescendingCellStyle BackColor="#CAC9C9" />
                      <SortedDescendingHeaderStyle BackColor="#383838" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" OnSelected="SqlDataSource1_Selected" SelectCommand="SELECT * FROM [OrderMst] WHERE ([UserName] = @UserName) ORDER BY [OrderID] DESC">
                      <SelectParameters>
                          <asp:SessionParameter Name="UserName" SessionField="User" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>

              </td>
          </tr>
          <tr class="rowstyle">
              <td> </td>
          </tr>
          <tr class="rowstyle">
              <td>
              <asp:LinkButton ID="lnkPendingOrders" runat="server" Font-Size="12pt" OnClick="lnkPendingOrders_Click" CssClass="btnVisited">Pending Orders</asp:LinkButton>
              </td>
          </tr>
          <tr style="height:200px">
              <td></td>
          </tr>
      </table>
  
</asp:Content>

