<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="FruitKha_Main.admin.admin1" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">

    <br /><br /><br /><br /><br /><br /><br />
       <div class="container-fluid mt-5">
        <h2 class="text-center mb-4">Admin Dashboard</h2>
        <hr />

        <div class="row d-flex justify-content-center">
            <!-- Total Users -->
            <div class="col-md-3">
                <div class="card text-white bg-primary mb-3 shadow-lg">
                    <div class="card-body text-center">
                        <h4 class="card-title">Total Users</h4>
                        <h2>
                            <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                </div>
            </div>

            <!-- Total Orders -->
            <div class="col-md-3">
                <div class="card text-white bg-success mb-3 shadow-lg">
                    <div class="card-body text-center">
                        <h4 class="card-title">Total Orders</h4>
                        <h2>
                            <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                </div>
            </div> 

            <!-- Total Items -->
            <div class="col-md-3">
                <div class="card text-white bg-warning mb-3 shadow-lg">
                    <div class="card-body text-center">
                        <h4 class="card-title">Total Items</h4>
                        <h2>
                            <asp:Label ID="lblTotalItems" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                                        <img src="/assets/img/logo.png" alt=""> </a>&nbsp;</div>

                                    <!-- Menu Start -->
                                    <nav class="main-menu">
                                        <ul>
                                            <li class="current-list-item"><a href="Admin.aspx">Dashboard</a></li>
                                            <li><a href="Item.aspx">Item</a></li>
                                            <li><a href="Order.aspx">Order</a></li>
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
            </asp:Content>