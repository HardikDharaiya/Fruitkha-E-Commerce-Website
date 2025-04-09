<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="FruitKha_Main.admin.Users" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Admin Panel - Manage Users"/>
    <title>Admin - Manage Users</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="~/assets/img/favicon.png"/>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"/>

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="~/assets/css/all.min.css"/>
    <link rel="stylesheet" href="~/assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="~/assets/css/owl.carousel.css"/>
    <link rel="stylesheet" href="~/assets/css/magnific-popup.css"/>
    <link rel="stylesheet" href="~/assets/css/animate.css"/>
    <link rel="stylesheet" href="~/assets/css/meanmenu.min.css"/>
    <link rel="stylesheet" href="~/assets/css/main.css"/>
    <link rel="stylesheet" href="~/assets/css/responsive.css"/>

    <%-- Styles copied/adapted from Item/Order.aspx --%>
    <style>
        .filter-section, .grid-section {
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #eee;
            border-radius: 5px;
            background-color: #f8f9fa;
        }

        .filter-section h3, .grid-section h3 {
            margin-bottom: 20px;
            color: #051922;
        }

        .grid-view-container {
            overflow-x: auto;
        }

        .grid-view-container table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px; /* Adjust as needed */
        }

        .grid-view-container th, .grid-view-container td {
            padding: 8px 10px;
            border: 1px solid #dee2e6;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
        }
         .grid-view-container th.wrap, .grid-view-container td.wrap {
            white-space: normal;
         }

        .grid-view-container th {
            background-color: #051922;
            color: #fff;
        }

        .grid-view-container tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .pagination-ys { /* Pager Style */
            padding: 15px 0;
            text-align: center;
        }
        .pagination-ys table > tbody > tr > td {
            border: none;
            padding: 5px;
        }
        .pagination-ys table > tbody > tr > td > span {
            background-color: #F59E0B;
            color: white;
            padding: 5px 10px;
            border-radius: 3px;
            margin: 0 2px;
        }
        .pagination-ys table > tbody > tr > td > a {
            background-color: #051922;
            color: white;
            padding: 5px 10px;
            border-radius: 3px;
            margin: 0 2px;
            text-decoration: none;
        }
        .pagination-ys table > tbody > tr > td > a:hover {
            background-color: #F59E0B;
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
                                    <li><a href='<%= ResolveUrl("~/admin/Order.aspx") %>'>Order</a></li>
                                    <li class="current-list-item"><a href='<%= ResolveUrl("~/admin/Users.aspx") %>'>Users</a></li> <%-- Set current item --%>
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
            <div class="breadcrumb-section breadcrumb-bg">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <h1>Manage Users</h1> <%-- Updated Title --%>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <h3>Filter Users</h3>
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="<%= txtFilterName.ClientID %>">Filter by Username:</label>
                            <asp:TextBox ID="txtFilterName" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                             <label for="<%= txtFilterEmail.ClientID %>">Filter by Email:</label>
                             <asp:TextBox ID="txtFilterEmail" runat="server" CssClass="form-control" placeholder="Enter email" TextMode="Email"></asp:TextBox>
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
                <h3>User List</h3>
                <asp:Label ID="lblGridMessage" runat="server" EnableViewState="false" CssClass="mb-2 d-block"></asp:Label>
                <div class="grid-view-container">
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="Uid" CssClass="table table-bordered table-striped"
                        AllowPaging="True" PageSize="10"
                        OnPageIndexChanging="gvUsers_PageIndexChanging"
                        OnRowCommand="gvUsers_RowCommand"
                        OnRowDataBound="gvUsers_RowDataBound">
                         <PagerStyle CssClass="pagination-ys" />
                        <Columns>
                            <asp:BoundField DataField="Uid" HeaderText="User ID" ReadOnly="True" SortExpression="Uid" ItemStyle-Width="10%" />
                            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" ItemStyle-Width="35%" />
                            <asp:BoundField DataField="UserEmail" HeaderText="Email" SortExpression="UserEmail" ItemStyle-Width="40%" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%-- Delete Button Only --%>
                                    <asp:LinkButton ID="lnkDelete" runat="server"
                                        CssClass="btn btn-sm btn-danger"
                                        CommandName="DeleteUser"
                                        CommandArgument='<%# Eval("Uid") %>'
                                        ToolTip="Delete User">
                                         <i class="fas fa-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                             <div class="text-center p-3">No users found matching your criteria.</div>
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
                         <p>Copyrights © <%= DateTime.Now.Year %>, All Rights Reserved.</p>
                     </div>
                     <div class="col-lg-6 text-right col-md-12">
                         <%-- Social Icons etc. --%>
                     </div>
                 </div>
             </div>
         </div>
        <!-- End Footer -->

    </form>

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