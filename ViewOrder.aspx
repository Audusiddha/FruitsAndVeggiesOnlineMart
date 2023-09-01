<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="ViewOrder.aspx.cs" Inherits="Admin_ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .rowstyle{
            height: 54px;
             vertical-align: middle;
              text-align: center;
        }    
    .hedaerstyle
     {
         font-family:Bahnschrift; 
         font-size: 20pt; 
         color: white; 
         background-color: lightseagreen; 
         vertical-align: middle; 
         text-align: center; 
         height:56px;
     }  
     .CenterHeaderText th {
         text-align:center;
         vertical-align:middle;
     }
          
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    
    <table style="width:100% ">
       <tr>
           <td class="hedaerstyle">
               View Orders
           </td>       
       </tr>
        <tr class="rowstyle">
            <td>                         
                <asp:LinkButton ID="pendingOrders" runat="server" Font-Size="12pt" PostBackUrl="~/Admin/ViewAllOrders.aspx">View All Orders</asp:LinkButton>           
            </td>
       </tr>        
        <tr >
            <td>
                <asp:Label ID="Label1" runat="server" Font-Size="12pt"></asp:Label>                
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" AllowPaging="True"  CaptionAlign="Top" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Font-Size="12pt" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UID" HeaderText="User ID" SortExpression="UID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PID" HeaderText="Product ID" SortExpression="PID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PName" HeaderText="Product Name" SortExpression="PName">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" SortExpression="OrderStatus">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="btnDeliver" runat="server" CausesValidation="False" CommandArgument='<%# Eval("OrderID") %>' CommandName="orderStatus" CssClass="btn btn-info" Font-Size="10pt" OnClick="btnDeliver_Click" Text="Dispatch" Width="112px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="CenterHeaderText" />
                    <PagerSettings FirstPageText="First Page" LastPageText="Last Page" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Bottom" />
                    <RowStyle BackColor="#F7F7DE" Height="40px" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT * FROM [OrderMst] WHERE ([OrderStatus] = @OrderStatus)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Pending" Name="OrderStatus" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
               </td>
        </tr>       
        </table>
            
</asp:Content>

