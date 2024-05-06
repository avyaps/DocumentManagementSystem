<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordCode.aspx.cs" Inherits="DocumentManagementSystem.ForgotPasswordCode" %>

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
                 <div class="forgotpwtext">Verification Code</div>
                <div class="uname-email">
                    <asp:TextBox ID="txtCode" runat="server" CssClass="codetextbox" type="text" placeholder="Code"></asp:TextBox>
                    <div class="didnt-receive-a-text">Didn’t receive a code?</div>
                    <div class="resendcode">
                    <asp:LinkButton ID="LinkBtnResendCode" runat="server" CssClass="resendcodebutton" OnClick="LinkBtnResendCode_Click">Resend code</asp:LinkButton>
                    </div>
                </div>
                <div class="submitcode-btn">
                    <asp:Button ID="btnSubmitCode" runat="server" Text="SUBMIT" CssClass="submitcodebutton" OnClick="btnSubmitCode_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>