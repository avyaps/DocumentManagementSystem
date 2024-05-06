<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="DocumentManagementSystem.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="CSS/ForgotPwLayout.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500&display=swap" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="resetcode">
            <img class="resetcode-child" alt="" src="Images/Rectangle 1.png"/>
            <div class="resetcodeborder">
                <img class="bellevuelogo" alt="" src="Images/Rectangle 3.png"/>
                 <div class="forgotpwtext">Forgot Password?</div>
                <div class="uname-email">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="emailtextbox" type="text" placeholder="Email"></asp:TextBox>
                </div>
                <div class="resetcode-btn">
                    <asp:Button ID="btnResetCode" runat="server" Text="SEND VERIFICATION CODE" CssClass="resetcodebutton" OnClick="btnResetCode_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>