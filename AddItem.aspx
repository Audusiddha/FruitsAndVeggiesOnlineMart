<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="Admin_AddItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <style type="text/css">
        .rigthSide{
            height: 54px;
             vertical-align: middle;
              text-align: left;
        }      
       .leftSide {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
            color: #000000;
            height: 54px;
            vertical-align: middle;
            text-align: right;
            width: 553px;
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
         .cmplsry{
             color:red;
         }

        .auto-style3 {
            width: 193px;
        }

    </style>

    <script src="../Boostrap/bootstrap-3.4.1-dist/Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_ShowProdImg').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#PImg").change(function () {
            readURL(this);
        });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <center>
    <table style="width:100%; height:548px">
       <tr>
           <td  colspan="3" class="hedaerstyle"><span class="glyphicon glyphicon-plus-sign"></span> Add Products</td>       
       </tr>
        <tr>
            <td style="height: 40px;" colspan="3"> </td>
        </tr>
         <tr>
            <td class="leftSide" >
                Product Name<span class="cmplsry">*</span></td>
            <td class="rigthSide" colspan="2">
                <asp:TextBox ID="txtPName" runat="server" CssClass="form-control" MaxLength="50" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPName" Display="Dynamic" ErrorMessage="Please Enter Product Name...!" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtPName_TextBoxWatermarkExtender" runat="server" BehaviorID="TextBox1_TextBoxWatermarkExtender" TargetControlID="txtPName" WatermarkText="Enter Product Name" />
            </td>
        </tr>
        <tr>
            <td class="leftSide">
                Category<span class="cmplsry">*</span></td>
            <td class="rigthSide" colspan="2">            
                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="CName" DataValueField="CID" Height="26px" Width="100px">              
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT [CID], [CName] FROM [CategoryMst]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="leftSide">
                Price<span class="cmplsry">*</span></td>
            <td class="rigthSide" colspan="2">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" MaxLength="4" Width="128px"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="txtPrice_FilteredTextBoxExtender" runat="server" BehaviorID="txtPrice_FilteredTextBoxExtender" TargetControlID="txtPrice" ValidChars="0123456789" />
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtPrice_TextBoxWatermarkExtender" runat="server" BehaviorID="txtPrice_TextBoxWatermarkExtender" TargetControlID="txtPrice" WatermarkText="Enter Price" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Please Enter Product Price...!" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>              
            </td>
        </tr>
         <tr>
            <td class="leftSide">
               Quantity<span class="cmplsry">*</span></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" MaxLength="4" Width="128px"></asp:TextBox>                             
                <ajaxToolkit:FilteredTextBoxExtender ID="txtQty_FilteredTextBoxExtender" runat="server" BehaviorID="txtQty_FilteredTextBoxExtender" TargetControlID="txtQty" ValidChars="0123456789" />
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtQty_TextBoxWatermarkExtender" runat="server" BehaviorID="txtQty_TextBoxWatermarkExtender" TargetControlID="txtQty" WatermarkText="Enter Quantity" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Please Enter Product Quantity...!" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
           </td>
            <td class="rigthSide">
                <asp:DropDownList ID="ddlUnit" runat="server" Height="23px" Width="75px" CssClass="col-xs-offset-0">
                    <asp:ListItem>100GM</asp:ListItem>
                    <asp:ListItem>10KG</asp:ListItem>
                    <asp:ListItem>500GM</asp:ListItem>
                    <asp:ListItem Selected="True">250GM</asp:ListItem>
                    <asp:ListItem>5KG</asp:ListItem>
                    <asp:ListItem Value="KG">KG</asp:ListItem>
                    <asp:ListItem>25KG</asp:ListItem>
                    <asp:ListItem>DOZEN</asp:ListItem>
                </asp:DropDownList>
           </td>
        </tr>
        <tr>
            <td class="leftSide">
                Description<span class="cmplsry">*</span>
            </td>
            <td  class="rigthSide" colspan="2">
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" MaxLength="100" TextMode="MultiLine" Width="200px"></asp:TextBox>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtDescription_TextBoxWatermarkExtender" runat="server" BehaviorID="txtDescription_TextBoxWatermarkExtender" TargetControlID="txtDescription" WatermarkText="Enter Product Details" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="Please Enter Product Details...!" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="leftSide">
                Image<span class="cmplsry">*</span>
            </td>
            <td  class="rigthSide" colspan="2">
                <asp:FileUpload ID="PImg" runat="server" Height="25px" onchange="readURL(this)"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PImg" Display="Dynamic" ErrorMessage="Browse Product Image..!" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="leftSide">
            </td>
            <td colspan="2"  class="rigthSide">
                <asp:Image ID="ShowProdImg" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" Height="125px" Width="171px" ImageUrl="~/images/NotAvailable.jfif" />
                </td>
        </tr>
        <tr>
            <td >
            </td>
            <td colspan="2" class="rigthSide">
                <asp:Button ID="btnAddProduct" runat="server" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" Text="ADD" Width="86px" Height="37px" />
            </td>
        </tr>
   </table>
       </center>
</asp:Content>

