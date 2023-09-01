<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        *{
            padding: 0;
            margin: 0;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        .bg__color{
            width: 100%;
            height: 100vh;
           background-image: url('../images/8.jpg');
           background-size:1500px,1500px;
            filter:drop-shadow(1px);

        }
        .center{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 350px;
            height: 500px;
            background-image: url('../images/image1.jpg');
            border-radius: 10px;
        }
        .center h2{
            color: white;
            font-size: 35px;
            text-align: center;
            letter-spacing: 2px;
            font-weight: 300;
            margin-top: 70px;
            margin-bottom: 40px;
        }
        .center__item input{
            width:calc(100% - 40px);
            display: block;
            margin: auto;
            padding: 10px 10px;
            border-radius: 5px;
           /* font-weight:bold;*/
            font-size:15px;
        }
        ::placeholder{
            color: black;
            letter-spacing: 2px;
        }
        .center__item__btn input{
            color: white;
            background-color: rgb(61, 44, 219);
            font-size: 20px;
            font-weight: 600;
            margin-top: 30px;
            margin-bottom: 20px;
            cursor: pointer;
            border-radius: 5px;
        }
        .center__item__btn :hover{
    background-color: rgb(16, 16, 224);
        }
        .fpassward{
            padding-left: 180px;
        }
        .fpassward a{
            color: white;
            text-decoration: none;
            text-align: left;
            font-size: 17px;

        }
        .fpassward a:hover{
            color: rgb(116, 116, 243);
        }
        
    </style>
</head>
   

<body>
     <form id="form1" runat="server">
         <div class="bg__color">
       <div class="center">
           <h2>Login</h2>
           <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
           <div class="center__item" >
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter username" ControlToValidate="txtUserName" Font-Bold="False" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
               <asp:TextBox ID="txtUserName" runat="server" placeholder="Username"></asp:TextBox>
               <%--<input type="text" name="username" id="username" placeholder="Username" required>--%>
           </div><br />
           <div class="center__item">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter password" ControlToValidate="txtPassword" Font-Bold="False" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
               <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
               <%--<input type="text" name="Passward" id="Passward" placeholder="Passward" required><br>--%>
               <div class="center__item__btn">
                   <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
               <%--<input type="submit" value="Login">--%>
               </div>
            </div>
        
  <asp:CheckBox ID="chkRemember" runat="server" Text="Remember Me" Font-Size="Small" ForeColor="White" />
           
       </div>
   </div>
    </form>
</body>
</html>
