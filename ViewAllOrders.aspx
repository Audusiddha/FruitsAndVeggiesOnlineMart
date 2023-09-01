<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="ViewAllOrders.aspx.cs" Inherits="Admin_ViewAllOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .textAlign
        {
            text-align:center;
            border-collapse:collapse;
            vertical-align:bottom;
            height:50px;
        }
    .CenterHeaderText th
     {
         text-align:center;
         vertical-align:middle;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100% ">
        <tr>
            <td class="textAlign">
                <asp:Label ID="Label1" runat="server" Font-Size="12pt"></asp:Label>
            </td>
        </tr>
       <tr>
           <td>

               <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Caption="All Orders" CaptionAlign="Top" CellPadding="4" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Font-Size="12pt" ForeColor="#333333" HorizontalAlign="Center" Width="1005px">
                   <AlternatingRowStyle BackColor="White" />
                   <Columns>
                       <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID">
                       <ItemStyle HorizontalAlign="Center" />
                       </asp:BoundField>
                       <asp:BoundField DataField="UID" HeaderText="User ID" SortExpression="UID" />
                       <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                       <asp:BoundField DataField="PID" HeaderText="Product ID" SortExpression="PID" />
                       <asp:BoundField DataField="PName" HeaderText="Product Name" SortExpression="PName" />
                       <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                       <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                       <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" SortExpression="OrderStatus" />
                       <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
                   </Columns>
                   <EditRowStyle BackColor="#7C6F57" />
                   <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#1C5E55" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" Font-Underline="False" ForeColor="White" Height="37px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="CenterHeaderText" />
                   <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPrevious" NextPageText="Next" PageButtonCount="15" PreviousPageText="Previous" />
                   <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Bottom" />
                   <RowStyle BackColor="#E3EAEB" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                   <SortedAscendingCellStyle BackColor="#F8FAFA" />
                   <SortedAscendingHeaderStyle BackColor="#246B61" />
                   <SortedDescendingCellStyle BackColor="#D4DFE1" />
                   <SortedDescendingHeaderStyle BackColor="#15524A" />
               </asp:GridView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT * FROM [OrderMst] ORDER BY [OrderID] DESC"></asp:SqlDataSource>
           </td>
           </tr>
        <tr class="textAlign">
            <td>
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-warning" Font-Size="10pt" PostBackUrl="~/Admin/ViewOrder.aspx" Text="Go Back" />
            </td>
        </tr>
    </table>
</asp:Content>

