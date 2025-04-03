<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FruitKha_Main.admin.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container login-container">
            <div class="login-box">
                <h2>Admin Registration</h2>
                <div class="form-group">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                </div>
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success btn-block" OnClick="btnRegister_Click" />
                <p class="text-center mt-3">
                    <a href="Login.aspx">Already have an account? Login</a>
                </p>
            </div>
        </div>

    </form>
</body>
</html>
