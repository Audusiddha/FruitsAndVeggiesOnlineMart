<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="ProdUpdate.aspx.cs" Inherits="Admin_ProdUpdate" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="alert alert-success">
    <div class="alert alert-warning" style="text-align:center;font-size:12pt">
         Product Details
         <br />
             Edit Quantity And Price Of Products .
            </div>
        <div>
            <center>
                <table style="width:100%">                    
                    <tr>                        
                        <td colspan="2" style="text-align:center">
                            <asp:Image ID="ProdImage" runat="server" style="width:150px; height:150px "/>
                        </td> 
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Product ID:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="lblPID" runat="server" ForeColor="Blue"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Registered Time:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="regDate" runat="server" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Product Name:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pName" runat="server" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Product Detail:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pDes" runat="server" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">Unit:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pUnit" runat="server" ForeColor="#0000CC"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">&nbsp; Old Price:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pPrice" runat="server" ForeColor="#FF0066"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">New Price</td> 
                        <td class="rigthSide">                           
                            <asp:TextBox ID="txtPrice" runat="server" Width="122px"  CssClass="form-control" MaxLength="4" CausesValidation="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Please Enter New Price..!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="txtPrice_FilteredTextBoxExtender" runat="server" BehaviorID="txtPrice_FilteredTextBoxExtender" TargetControlID="txtPrice" ValidChars="0123456789" />
                            <ajaxToolkit:TextBoxWatermarkExtender ID="txtPrice_TextBoxWatermarkExtender" runat="server" BehaviorID="txtPrice_TextBoxWatermarkExtender" TargetControlID="txtPrice" WatermarkText="Enter Price" />
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide"> Quantity:</td> 
                        <td class="rigthSide">                           
           <asp:Label ID="pQty" runat="server" ForeColor="#FF0066"></asp:Label>                 
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide"> ADD/Remove Quantity</td> 
                        <td class="rigthSide">                           
                            <asp:TextBox ID="txtQty" runat="server" Width="109px" CssClass="form-control" MaxLength="4" CausesValidation="True"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="txtQty_FilteredTextBoxExtender" runat="server" BehaviorID="txtQty_FilteredTextBoxExtender" TargetControlID="txtQty" ValidChars="0123456789-1-2-3-4-5-6-7-8-9" />
                            <ajaxToolkit:TextBoxWatermarkExtender ID="txtQty_TextBoxWatermarkExtender" runat="server" BehaviorID="txtQty_TextBoxWatermarkExtender" TargetControlID="txtQty" WatermarkText="Quantity" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Please Enter Quantity.!" Font-Size="8pt" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>                                                
                       </tr>  
                    
                    <tr>                        
                        <td class="leftSide">&nbsp;</td> 
                        <td class="rigthSide">                           
                            <asp:Button ID="btnPUpdate" runat="server" CssClass="btn btn-primary" Font-Size="10pt" Text="Update" Width="83px" OnClick="btnPUpdate_Click" />
                        </td>                                                
                       </tr>  
                    <tr>                        
                        <td class="leftSide">&nbsp;</td> 
                        <td class="rigthSide">                           
                            &nbsp;</td>                                                
                       </tr>  
                </table>                                           
            </center>  
    </div>
        </div>
</asp:Content>

