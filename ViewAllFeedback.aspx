<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="ViewAllFeedback.aspx.cs" Inherits="Admin_ViewAllFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .textAlign
        {
            text-align:center;
            border-collapse:collapse;
            vertical-align:bottom;
            height:50px;
        }
       .CenterHeaderText th {
         text-align:center;
         vertical-align:middle;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100% ">
        <tr  class="textAlign">
            <td>
           <asp:Label ID="Label1" runat="server" CssClass="bg-warning" Font-Size="12pt"></asp:Label>
            </td>
        </tr>
       <tr>
           <td>

               <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" Caption="User Feedbacks" CaptionAlign="Top" CellPadding="4" DataKeyNames="FID" DataSourceID="SqlDataSource1" Font-Size="12pt" ForeColor="Black" HorizontalAlign="Center" PageSize="15" Width="1078px">
                   <AlternatingRowStyle BackColor="White" />
                   <Columns>
                       <asp:BoundField DataField="FID" HeaderText="Feedback ID" InsertVisible="False" ReadOnly="True" SortExpression="FID" />
                       <asp:BoundField DataField="FType" HeaderText="Type" SortExpression="FType" />
                       <asp:BoundField DataField="Msg" HeaderText="Message" SortExpression="Msg" />
                       <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                       <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                       <asp:BoundField DataField="MailID" HeaderText="Mail ID" SortExpression="MailID" />
                       <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                       <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" SortExpression="EntryDate" />
                   </Columns>
                   <FooterStyle BackColor="#CCCC99" />
                   <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Height="37px" CssClass="CenterHeaderText" />
                   <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="15" PreviousPageText="Previous" />
                   <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
                   <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#FBFBF2" />
                   <SortedAscendingHeaderStyle BackColor="#848384" />
                   <SortedDescendingCellStyle BackColor="#EAEAD3" />
                   <SortedDescendingHeaderStyle BackColor="#575357" />

               </asp:GridView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT [FID], [FType], [Msg], [FirstName], [LastName], [MailID], [Status], [EntryDate] FROM [Feedback] ORDER BY [FID] DESC"></asp:SqlDataSource>
           </td>
        </tr>
          <tr class="textAlign">
            <td>
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-warning" Font-Size="10pt" PostBackUrl="~/Admin/Feedback.aspx" Text="Go Back" />
            </td>
        </tr>
    </table>
</asp:Content>

