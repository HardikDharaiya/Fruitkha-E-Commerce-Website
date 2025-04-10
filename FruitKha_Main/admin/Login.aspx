<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FruitKha_Main.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="Responsive Bootstrap4 Shop Template by Hardik Dharaiya" />
     <title>Admin Login</title>
        <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/style.css" />
   <%-- Link to Bootstrap CSS --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <%-- Link to your custom CSS if you have one --%>
     <link rel="shortcut icon" type="image/png" href="/assets/img/favicon.png" />
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet" />
	<!-- fontawesome -->
	<link rel="stylesheet" href="/assets/css/all.min.css" />
	<!-- bootstrap -->
	<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
	<!-- owl carousel -->
	<link rel="stylesheet" href="/assets/css/owl.carousel.css" />
	<!-- magnific popup -->
	<link rel="stylesheet" href="/assets/css/magnific-popup.css" />
	<!-- animate css -->
	<link rel="stylesheet" href="/assets/css/animate.css" />
	<!-- mean menu css -->
	<link rel="stylesheet" href="/assets/css/meanmenu.min.css" />
	<!-- main style -->
	<link rel="stylesheet" href="/assets/css/main.css" />
	<!-- responsive -->
	<link rel="stylesheet" href="/assets/css/responsive.css" />

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

    <!-- jquery -->
	<script src="/assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="/assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="/assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="/assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="/assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="/assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="/assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="/assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="/assets/js/main.js"></script>
</body>
</html>
