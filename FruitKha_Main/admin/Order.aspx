<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FruitKha_Main.admin.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Responsive Bootstrap4 Shop Template"/>
    <title>Admin Panel - Order</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png"/>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"/>

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="/assets/css/all.min.css"/>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/css/owl.carousel.css"/>
    <link rel="stylesheet" href="/assets/css/magnific-popup.css"/>
    <link rel="stylesheet" href="/assets/css/animate.css"/>
    <link rel="stylesheet" href="/assets/css/meanmenu.min.css"/>
    <link rel="stylesheet" href="/assets/css/main.css"/>
    <link rel="stylesheet" href="/assets/css/responsive.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <!-- PreLoader -->
                <div class="loader">
                    <div class="loader-inner">
                        <div class="circle">
                        </div>
                    </div>
    </div>
                <!-- PreLoader Ends -->
                <!-- Header -->
                <div class="top-header-area" id="sticker">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 text-center">
                                <div class="main-menu-wrap">
                                    <!-- Logo -->
                                    <div class="site-logo">
                                        <a href="admin.aspx">
                                        <img src="/assets/img/logo.png" alt=""/></a>&nbsp;</div>

                                    <!-- Menu Start -->
                                    <nav class="main-menu">
                                        <ul>
                                            <li><a href="Admin.aspx">Dashboard</a></li>
                                            <li><a href="Item.aspx">Item</a></li>
                                            <li class="current-list-item"><a href="Order.aspx">Order</a></li>
                                            <li><a href="Users.aspx">Users</a></li>
                                            <li class="profile-menu"><a href="#"><i class="fas fa-user"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="AdminInfo.aspx">Profile</a></li>
                                                    <li><a href="Logout.aspx">Logout</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                    <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                                    <div class="mobile-menu">
                                    </div>
                                    <!-- Menu End -->
                                </div>
                            </div>
                        </div>
                    </div>
    </div>
                <!-- End Header -->

             <br /><br /><br /><br /><br /><br /><br />



        </div>
    </form>


    
    <!-- JavaScript Libraries -->
    <script src="/assets/js/jquery-1.11.3.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery.countdown.js"></script>
    <script src="/assets/js/jquery.isotope-3.0.6.min.js"></script>
    <script src="assets/js/waypoints.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/jquery.meanmenu.min.js"></script>
    <script src="/assets/js/sticker.js"></script>
    <script src="/assets/js/main.js"></script>

</body>
</html>
