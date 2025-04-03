<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="FruitKha_Main.register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>

<div class="register-container">
    <form id="form1" runat="server" class="register-form">
        <h2>Register</h2>

        <div class="input-group">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" 
                ErrorMessage="Username is required!" CssClass="error-message" ForeColor="Red" Display="Dynamic" />
        </div>

        <div class="input-group">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                ErrorMessage="Email is required!" CssClass="error-message" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Invalid email format!" CssClass="error-message" ForeColor="Red" Display="Dynamic"
                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" />
        </div>

        <div class="input-group">
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                ErrorMessage="Password is required!" CssClass="error-message" ForeColor="Red" Display="Dynamic" />
        </div>

        <div class="input-group">
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" 
                ErrorMessage="Confirm Password is required!" CssClass="error-message" ForeColor="Red" Display="Dynamic" />
            <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword"
                ControlToCompare="txtPassword" ErrorMessage="Passwords do not match!" CssClass="error-message"
                ForeColor="Red" Display="Dynamic" />
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />

         <div class="extra-links">
            <p style="color:forestgreen">(Note: Username is case-sensitive! Please add username carefully!)</p>
            
        </div>
        <div class="extra-links">
            
            Already have an account? <a href="Login.aspx">Login</a>
        </div>
    </form>
</div>

</body>
</html>