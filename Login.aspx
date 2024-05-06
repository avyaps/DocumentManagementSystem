<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DocumentManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="CSS/LoginLayout.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500&display=swap" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="login">
            <img class="login-child" alt="" src="Images/Rectangle 1.png"/>
            <div class="loginborder">
                <img class="bellevuelogo" alt="" src="Images/Rectangle 3.png"/>
                 <div class="welcome">Welcome!</div>
                <div class="uname-textbox">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="unametextbox" type="text" placeholder="Username"></asp:TextBox>
                </div>
                <div class="pword-textbox">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="pnametextbox" type="password" placeholder="Password"></asp:TextBox>
                </div>
                <div class="forgot-pw">
                    <a href="ForgotPassword.aspx">Forgot Password?</a>
                </div>
                <div class="login-btn">
                    <asp:Button ID="btnLogin" runat="server" Text="LOG IN" CssClass="loginbutton" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>