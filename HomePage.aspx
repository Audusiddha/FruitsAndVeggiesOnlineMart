<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="User_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">  
   <style>
       .displayName
       {
           text-align:left; 
           font-size:12pt; 
           font-family:Arial;
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div style="vertical-align:middle;text-align:center">
<div class="displayName">
    &nbsp;&nbsp;
    Welcome,&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblFullName" runat="server"  ForeColor="#000099" ></asp:Label></div>
        <h2>Order Now..!</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:AdRotator ID="AdRotator1" runat="server"  Height="600px" Width="1150px" AdvertisementFile="~/ImageSliderXMLFile.xml" BackColor="White" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
            <asp:Timer ID="Timer1" runat="server" Interval="6000"></asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>

</asp:Content>

