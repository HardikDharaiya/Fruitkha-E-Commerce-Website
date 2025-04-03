<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FruitKha_Main.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Admin Login</title>
        <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="/assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
         <div class="container login-container">
            <div class="login-box">
                <h2>Admin Login</h2>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:CheckBox ID="chkRememberMe" runat="server" /> Remember Me
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                <p class="text-center mt-3">
                    <a href="Register.aspx">Register Here</a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
