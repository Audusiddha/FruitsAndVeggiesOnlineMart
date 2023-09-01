<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="User_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
  <style>
      .tablewidth{
          width:100%;
      }
      .rowStyle
      {
          border-bottom-style: solid; 
          border-bottom-width: 1px; 
          border-bottom-color: #000000;
      }
      .textAlign{
          text-align:center;
          height:20px;
      }
      .verticalAlign{
          vertical-align: top;
      }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
     <table class="tablewidth">
         <tr class="rowStyle">
             <td style=" vertical-align:middle; width: 940px" class="textAlign" >
                 <div class="text-right">
                 </div>
                <asp:LinkButton ID="lnkBtnViewAll" runat="server" Font-Size="11pt" OnClick="lnkBtnViewAll_Click" CausesValidation="False" CssClass="btnVisited">View All Products</asp:LinkButton>
             </td>
             <td style="text-align: right; width: 162px " class="verticalAlign">
                 <asp:TextBox ID="txtSearch" runat="server" MaxLength="50" Width="180px" ValidationGroup="A" CssClass="form-control" placeholder="Search here..!"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch" Display="Dynamic" ErrorMessage="Please Mention Name.!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
             </td>
             <td class="verticalAlign">
                 <asp:ImageButton ID="btnSearch" runat="server" Height="35px" ImageUrl="~/images/Search.jpg" ValidationGroup="A" Width="120px" OnClick="btnSearch_Click" />
             </td>
         </tr>
         <tr style="height:35px ">
             <td  colspan="3" class="textAlign">  You Have
                 <asp:Label ID="Label1" runat="server"></asp:Label>
                &nbsp;Produtcs In Your cart..</td>
         </tr>
     </table>
 </div>  
  <div>
      <asp:DataList ID="DataList1" runat="server" DataKeyField="PID" DataSourceID="SqlDataSource1" Height="24px" HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal" Width="1018px" GridLines="Horizontal" BackColor="White" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" OnItemCommand="DataList1_ItemCommand" >
          <AlternatingItemStyle BackColor="#F7F7F7" />
          <FooterStyle ForeColor="#4A3C8C" />
          <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
          <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
          <ItemTemplate>
              <table style="width:100% ">
                  <tr>
                      <td class="textAlign">
                      </td>
                  </tr>
                  <tr>
                      <td class="textAlign">
                          <asp:Image ID="Image2" runat="server" Height="145px" ImageUrl='<%# Eval("PImage") %>' Width="177px" />
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 40px " class="textAlign">
                          <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("PID") %>' CommandName="view" Font-Size="12pt" Text='<%# Eval("PName") %>'></asp:LinkButton>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 41px" class="textAlign">
                          <asp:Label ID="Label2" runat="server" Font-Size="12pt" ForeColor="Blue" Text="Price:"></asp:Label>
                          &nbsp;
                          <asp:Label ID="Label3" runat="server" Font-Size="11pt" ForeColor="Black" Text='<%# Eval("PPrice") %>'></asp:Label>
                          &nbsp;Rs Per&nbsp;
                          <asp:Label ID="Label4" runat="server" Font-Size="10pt" ForeColor="Black" Text='<%# Eval("PUnit") %>'></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 39px " class="textAlign">
                          <asp:Label ID="Label5" runat="server" Font-Size="11pt" ForeColor="Blue" Text="Quantity:"></asp:Label>
                          <asp:DropDownList ID="DropDownList1" runat="server" Width="40px">
                              <asp:ListItem>1</asp:ListItem>
                              <asp:ListItem>2</asp:ListItem>
                              <asp:ListItem>3</asp:ListItem>
                              <asp:ListItem>4</asp:ListItem>
                              <asp:ListItem>5</asp:ListItem>
                              <asp:ListItem>6</asp:ListItem>
                          </asp:DropDownList>
                      </td>
                  </tr>
                  <tr>
                      <td class="textAlign">
                          <asp:ImageButton ID="btnCart" runat="server" CssClass="btn active" Height="40px" ImageUrl="~/images/cart3.jpg" Width="108px" CommandArgument='<%# Eval("PID")%>' CommandName="addtocart" />
                          <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("PID") %>' />
                      </td>
                  </tr>
              </table>
              <br />
          </ItemTemplate>
          <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
      </asp:DataList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT * FROM [ProductMst]" ></asp:SqlDataSource>
  </div>
</asp:Content>

