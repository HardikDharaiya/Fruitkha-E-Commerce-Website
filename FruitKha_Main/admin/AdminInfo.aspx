<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInfo.aspx.cs" Inherits="FruitKha_Main.admin.AdminInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="Responsive Bootstrap4 Shop Template by Hardik Dharaiya" />
    <title>Admin Profile</title>
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
    <style>
        body {
            background-color: #f5f5f5;
        }
       
        .card {
            max-width: 500px;
            margin: auto;
            padding: 20px;
        }
    </style>
</head>
<body>

    <!-- ✅ FORM MUST WRAP THE CONTENT PROPERLY -->
    <form id="AdminEditForm" runat="server">  
        <div class="sale-percent">
        <div class="shop-banner">
            <div class="container">
            <div class="card shadow">
                <h3 class="text-center">Admin Profile</h3>
                <hr>

                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtAdminName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Email Address (Read-Only):</label>
                    <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>New Password:</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Confirm Password:</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-save btn-block" OnClick="btnUpdate_Click" />

                <a href="admin.aspx" class="btn btn-secondary btn-block mt-2">Back to Dashboard</a>
            </div>
                </div>
        </div>
            </div>
    </form>  <!-- ✅ Closing form tag here -->
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
</body>
</html>