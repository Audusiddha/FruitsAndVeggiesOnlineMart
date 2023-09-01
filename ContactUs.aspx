<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>
       .Colstyle
       {
       vertical-align: middle; 
       text-align: center; 
       font-family: 'Courier New', Courier, monospace; 
       font-size: 20px; 
       font-weight: normal;  
       color: #0000CC;
       height: 69px;
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table  style="width:100% ">
        <tr>
                 <td style="font-family: Cambria; font-size: 20pt; font-weight: normal; color: #FF66FF; line-height: normal; vertical-align: middle; text-align: center;height: 80px;">CONTACT US</td>
        </tr>
        <tr style="height: 38px">         
              <td >                  
             </td>       
        </tr>
        <tr>
           <td  class="Colstyle">
                <span class="glyphicon glyphicon-envelope" style="width: 40px; height: 30px">&nbsp;</span>Send us an email<br />
                audutgurdehalli@gmail.com</td>
        </tr>
        <tr>
            <td class="Colstyle">
                <span class="glyphicon glyphicon-phone" style="width: 40px; height: 30px">&nbsp;</span>Give Us a Call<br />
                +91-9689408000
            </td>
        </tr>
        <tr>
            <td  class="Colstyle">
                <span class="glyphicon glyphicon-map-marker" style="width: 40px; height: 30px;">&nbsp;
                </span>Come see us<br />
               Model Colony, ShivajiNagar, 
                <br />              
                pune, Maharashtra 411016<br />
                <br />
            </td>
        </tr>
        <tr>
                  <td style="height: 119px;"><div role="alert" style="line-height: normal; vertical-align: middle; text-align: center; font-family:Cambria; font-size: 22px ">
                      If you have any questions or queries a member of staff will always be happy to help.<br />
                    Feel free to contact us by telephone or email  <br />
                      and we will be sure to get back to you as soon as possible
                         </div>
                  </td>
        </tr>
    </table>

  </asp:Content>  

