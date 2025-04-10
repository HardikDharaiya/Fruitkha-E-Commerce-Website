<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FruitKha_Main.admin.Order" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Admin Panel - Manage Orders by Hardik Dharaiya" />
    <title>Admin - Manage Orders</title>

    <!-- Favicon -->
    <%-- Corrected: Removed <%= ResolveUrl(...) %> --%>
    <link rel="shortcut icon" type="image/png" href="~/assets/img/favicon.png" />

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet" />

    <!-- CSS Libraries -->
    <%-- Corrected: Removed <%= ResolveUrl(...) %> from all CSS links --%>
    <link rel="stylesheet" href="~/assets/css/all.min.css" />
    <link rel="stylesheet" href="~/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="~/assets/css/owl.carousel.css" />
    <link rel="stylesheet" href="~/assets/css/magnific-popup.css" />
    <link rel="stylesheet" href="~/assets/css/animate.css" />
    <link rel="stylesheet" href="~/assets/css/meanmenu.min.css" />
    <link rel="stylesheet" href="~/assets/css/main.css" />
    <link rel="stylesheet" href="~/assets/css/responsive.css" />

    <style>
        /* Styles for section layout */
        .filter-section, .grid-section {
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #eee;
            border-radius: 5px;
            background-color: #f8f9fa; /* Light background */
        }

        .filter-section h3, .grid-section h3 {
            margin-bottom: 20px;
            color: #051922; /* Dark heading */
        }

        /* Styles for the GridView container and table */
        .grid-view-container {
            overflow-x: auto; /* Horizontal scroll on small screens */
        }

        .grid-view-container table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px; /* Adjust as needed to prevent excessive wrapping */
        }

        .grid-view-container th, .grid-view-container td {
            padding: 8px 10px;
            border: 1px solid #dee2e6;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap; /* Default: prevent wrapping */
        }
         /* Allow specific columns like address to wrap */
         .grid-view-container th.wrap, .grid-view-container td.wrap {
            white-space: normal;
         }


        .grid-view-container th {
            background-color: #051922; /* Header background */
            color: #fff;
        }

        .grid-view-container tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternating row color */
        }

        /* Style for item image within the grid */
        .grid-view-container img.item-image {
            max-height: 50px;
            max-width: 50px;
            object-fit: cover;
            vertical-align: middle;
            margin-right: 5px; /* Add some space next to image */
        }

        /* Pager Styles */
        .pagination-ys {
            padding: 15px 0;
            text-align: center;
        }
        .pagination-ys table > tbody > tr > td {
            border: none;
            padding: 5px;
        }
        .pagination-ys table > tbody > tr > td > span { /* Current page */
            background-color: #F59E0B; /* Orange */
            color: white;
            padding: 5px 10px;
            border-radius: 3px;
            margin: 0 2px;
        }
        .pagination-ys table > tbody > tr > td > a { /* Other page links */
            background-color: #051922; /* Dark Blue */
            color: white;
            padding: 5px 10px;
            border-radius: 3px;
            margin: 0 2px;
            text-decoration: none;
        }
        .pagination-ys table > tbody > tr > td > a:hover {
            background-color: #F59E0B; /* Orange on hover */
        }

        /* Specific styles for Order grid elements */
        .status-dropdown {
            min-width: 120px; /* Ensure dropdown is easily clickable */
            font-size: 0.875rem; /* Slightly smaller font for dropdown */
        }
        .action-button {
             margin-left: 5px; /* Space for update button */
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <!-- PreLoader -->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
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
                                <a href='<%= ResolveUrl("~/admin/Admin.aspx") %>'>
                                    <img src='<%= ResolveUrl("~/assets/img/logo.png") %>' alt="Logo" /></a>
                            </div>
                            <!-- Menu Start -->
                            <nav class="main-menu">
                                <ul>
                                    <li><a href='<%= ResolveUrl("~/admin/Admin.aspx") %>'>Dashboard</a></li>
                                    <li><a href='<%= ResolveUrl("~/admin/Item.aspx") %>'>Item</a></li>
                                    <li class="current-list-item"><a href='<%= ResolveUrl("~/admin/Order.aspx") %>'>Order</a></li>
                                    <li><a href='<%= ResolveUrl("~/admin/Users.aspx") %>'>Users</a></li>
                                    <li class="profile-menu">
                                        <a href="#"><i class="fas fa-user"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href='<%= ResolveUrl("~/admin/AdminInfo.aspx") %>'>Profile</a></li>
                                            <li><a href='<%= ResolveUrl("~/admin/Logout.aspx") %>'>Logout</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                            <div class="mobile-menu"></div>
                            <!-- Menu End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header -->

        <!-- Main Content Area -->
        <div class="container">
             <%-- Breadcrumb Section --%>
            <div class="breadcrumb-section breadcrumb-bg">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <h1>Manage Orders</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <h3>Filter Orders</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="<%= ddlFilterStatus.ClientID %>">Filter by Status:</label> <%-- Corrected label 'for' --%>
                            <asp:DropDownList ID="ddlFilterStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- All Statuses --" Value="All" />
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Processing" Value="Processing" />
                                <asp:ListItem Text="Shipped" Value="Shipped" />
                                <asp:ListItem Text="Delivered" Value="Delivered" />
                                <asp:ListItem Text="Cancelled" Value="Cancelled" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                             <label for="<%= txtFilterStartDate.ClientID %>">Start Date:</label> <%-- Corrected label 'for' --%>
                             <asp:TextBox ID="txtFilterStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col-md-3">
                        <div class="form-group">
                             <label for="<%= txtFilterEndDate.ClientID %>">End Date:</label> <%-- Corrected label 'for' --%>
                             <asp:TextBox ID="txtFilterEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2 align-self-end">
                        <div class="form-group">
                            <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btn btn-info w-100" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-12">
                         <asp:Label ID="lblFilterMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                 </div>
            </div>

            <!-- GridView Section -->
            <div class="grid-section">
                <h3>Order List</h3>
                <asp:Label ID="lblGridMessage" runat="server" EnableViewState="false" CssClass="mb-2 d-block"></asp:Label>
                <div class="grid-view-container">
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="OrderID" CssClass="table table-bordered table-striped"
                        AllowPaging="True" PageSize="10"
                        OnPageIndexChanging="gvOrders_PageIndexChanging"
                        OnRowDataBound="gvOrders_RowDataBound"
                        OnRowCommand="gvOrders_RowCommand">
                         <PagerStyle CssClass="pagination-ys" />
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="ID" ReadOnly="True" SortExpression="OrderID" ItemStyle-Width="3%" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" DataFormatString="{0:dd-MMM-yyyy HH:mm}" ItemStyle-Width="12%" />
                             <asp:TemplateField HeaderText="User" SortExpression="UserName" ItemStyle-Width="12%">
                                 <ItemTemplate>
                                     <%# Eval("UserName") %><br />
                                     <small><%# Eval("UserEmail") %></small>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Item" SortExpression="ItemName" ItemStyle-Width="15%">
                                 <ItemTemplate>
                                     <asp:Image ID="imgItem" runat="server" CssClass="item-image mr-2" /> <%-- Removed trailing space in class --%>
                                     <%# Eval("ItemName") %>
                                 </ItemTemplate>
                             </asp:TemplateField>
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" SortExpression="Quantity" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center"/>
                            <asp:BoundField DataField="TotalPrice" HeaderText="Total (₹)" SortExpression="TotalPrice" DataFormatString="{0:N2}" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right"/>

                             <asp:TemplateField HeaderText="Shipping Address" ItemStyle-Width="25%" ItemStyle-CssClass="wrap">
                                 <ItemTemplate>
                                     <asp:Literal ID="litShippingAddress" runat="server"></asp:Literal>
                                 </ItemTemplate>
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Status" ItemStyle-Width="15%">
                                 <ItemTemplate>
                                     <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control form-control-sm status-dropdown">
                                         <%-- Values should match those in Filter dropdown --%>
                                         <asp:ListItem Text="Pending" Value="Pending" />
                                         <asp:ListItem Text="Processing" Value="Processing" />
                                         <asp:ListItem Text="Shipped" Value="Shipped" />
                                         <asp:ListItem Text="Delivered" Value="Delivered" />
                                         <asp:ListItem Text="Cancelled" Value="Cancelled" />
                                     </asp:DropDownList>
                                 </ItemTemplate>
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Actions" ItemStyle-Width="7%">
                                <ItemTemplate>
                                    <asp:Button ID="btnUpdateStatus" runat="server"
                                        Text="Update"
                                        CssClass="btn btn-sm btn-success action-button"
                                        CommandName="UpdateStatus"
                                        CommandArgument='<%# Eval("OrderID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <EmptyDataTemplate>
                             <div class="text-center p-3">No orders found matching your criteria.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

        </div>
        <!-- End Main Content Area -->

        <!-- Footer -->
         <div class="copyright">
             <div class="container">
                 <div class="row">
                     <div class="col-lg-6 col-md-12">
                         <p>Copyrights © <%= DateTime.Now.Year %>, All Rights Reserved by Hardik Dharaiya</p>
                     </div>
                     <div class="col-lg-6 text-right col-md-12">
                         <%-- Optional Social Icons etc. --%>
                     </div>
                 </div>
             </div>
         </div>
        <!-- End Footer -->

    </form>

    <!-- JavaScript Libraries -->
    <script src='<%= ResolveUrl("~/assets/js/jquery-1.11.3.min.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/bootstrap/js/bootstrap.min.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/jquery.countdown.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/jquery.isotope-3.0.6.min.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/waypoints.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/owl.carousel.min.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/jquery.magnific-popup.min.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/jquery.meanmenu.min.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/sticker.js") %>'></script>
    <script src='<%= ResolveUrl("~/assets/js/main.js") %>'></script>

</body>
</html>