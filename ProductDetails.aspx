<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Admin_ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style>
     .hedaerstyle
     {
         font-family:Arial;
         font-size: 20pt; 
         color: white; 
         background-color: lightseagreen; 
         vertical-align: middle; 
         text-align: center; 
         height:56px;
     }
     .CenterHeaderText th
     {
         text-align:center;
         vertical-align:middle;
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <center>
        <table style="width:100%">
            <tr>
              <td colspan="3" class="hedaerstyle"><span class="glyphicon glyphicon-list"></span>
               Product Details</td>        
            </tr>              
            <tr style="height:55px;">               
                <td style="text-align:center;width: 3438px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" ForeColor="#333333" OnClick="LinkButton1_Click">View All Products</asp:LinkButton>
                        </td>
                <td style="text-align:right;vertical-align:top; width:200px " >
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" MaxLength="50" placeholder="Search here..!" ValidationGroup="A" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch" Display="Dynamic" ErrorMessage="Please Mention Name.!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>

                </td>
               <td style="vertical-align:top;text-align:left">
                 <asp:ImageButton ID="btnSearch" runat="server" Height="35px" ImageUrl="~/images/Search.jpg" ValidationGroup="A" Width="120px" OnClick="btnSearch_Click"  />
             </td>
            </tr>
              
            <tr >
                <td colspan="3">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="12pt" ForeColor="#333333" Height="264px" Width="985px" AllowPaging="True" CaptionAlign="Top" DataKeyNames="PID" OnRowCommand="GridView1_RowCommand" HorizontalAlign="Center" PageSize="5" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="PID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="PID" />
                            <asp:ImageField DataImageUrlField="PImage" HeaderText="Image">
                                <ControlStyle Height="75px" Width="75px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:ImageField>
                            <asp:BoundField DataField="PName" HeaderText="Name" SortExpression="PName" />
                            <asp:BoundField DataField="CID" HeaderText="Category ID" SortExpression="CID">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PPrice" HeaderText="Price" SortExpression="PPrice">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PQty" HeaderText="Quantity" SortExpression="PQty">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PUnit" HeaderText="Unit" SortExpression="PUnit">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PDetail" HeaderText="Description" SortExpression="PDetail">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EntryDate" HeaderText="Entry Details" SortExpression="EntryDate">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:ButtonField ButtonType="Image" CommandName="Ed" HeaderText="Edit" ImageUrl="~/images/Edit2.png">
                            <ControlStyle Height="40px" Width="60px" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:ButtonField>
                            <asp:ButtonField ButtonType="Image" CommandName="Del" HeaderText="Delete" ImageUrl="~/images/delete.jpg">
                            <ControlStyle Height="40px" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:ButtonField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6699FF" Font-Bold="True" ForeColor="White" Font-Size="12pt" CssClass="CenterHeaderText" />
                        <PagerSettings FirstPageText="First" LastPageText="  Last" Mode="NextPreviousFirstLast" NextPageText="Next   " PreviousPageText="Previous" />
                        <PagerStyle BackColor="Silver" ForeColor="White" HorizontalAlign="Center" Font-Size="12pt" Height="10px" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT [PID], [PImage], [PName], [CID], [PPrice], [PQty], [PUnit], [PDetail], [EntryDate] FROM [ProductMst] ORDER BY [EntryDate] DESC" OnSelected="SqlDataSource1_Selected"></asp:SqlDataSource>

                </td>
            </tr>
        </table>
            </center>
    </div>
</asp:Content>

