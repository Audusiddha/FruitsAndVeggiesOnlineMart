<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="User_ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .rigthSide{
            height: 42px;
             vertical-align: middle;
              text-align: left;
              font-size:12pt;
        }      
       .leftSide {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
            color: #000000;
            height: 42px;
            vertical-align: middle;
            text-align: right;
            width: 700px;
        }       
  
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="alert alert-success">
    <div class="alert alert-warning" style="text-align:center;font-size:12pt">
         Product Details
            </div>
        <div>
            <center>
                <table style="width:100%">                    
                    <tr>                        
                        <td colspan="2" style="text-align:center">
                            <asp:Image ID="ProdImage" runat="server" Height="173px" Width="186px"/>
                        </td> 
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Product ID:&nbsp;&nbsp; 
                        </td> 
                        <td class="rigthSide">                           
           <asp:Label ID="lblPID" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Name:&nbsp;&nbsp;&nbsp;</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pName" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Price:&nbsp;&nbsp;&nbsp; </td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pPrice" runat="server" CssClass="label" Font-Size="12pt" ForeColor="#003300"></asp:Label>                 
                            Rs</td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Packing:&nbsp;&nbsp;&nbsp;</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pUnit" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Description:&nbsp;&nbsp;&nbsp;</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pDes" runat="server" Font-Size="12pt" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td colspan="2"> </td> 
                       </tr>  
                    <tr>                        
                        <td style="height:56px;text-align:center;vertical-align:top " colspan="2">
                            <asp:Button ID="btnBack" runat="server" CssClass="btn btn-info" Font-Size="10pt" Height="34px" Text="Go Back" Width="100px" PostBackUrl="~/User/Products.aspx" />
                        </td> 
                       </tr>  
                    <tr>                        
                        <td style="height:56px; " colspan="2"></td> 
                       </tr>  
                    </table>                                           
            </center>  
    </div>
        </div>  
</asp:Content>

