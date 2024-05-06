<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordNewPw.aspx.cs" Inherits="DocumentManagementSystem.ForgotPasswordNewPw" %>

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
        <div class="login">
            <img class="resetcode-child" alt="" src="Images/Rectangle 1.png"/>
            <div class="resetcodeborder">
                <img class="bellevuelogo" alt="" src="Images/Rectangle 3.png"/>
                 <div class="pwtext">Enter new password</div>
                <div class="newpw-textbox">
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="newpwtextbox" TextMode="Password" placeholder="New Password"></asp:TextBox>
                </div>
                <div class="confirmpw-textbox">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="confirmpwtextbox" type="password" placeholder="Re-Enter New Password"></asp:TextBox>
                </div>
                <div class="submitpass-btn">
                    <asp:Button ID="btnSubmitPass" runat="server" Text="SUBMIT" CssClass="submitpassbutton" OnClick="btnSubmitPass_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>