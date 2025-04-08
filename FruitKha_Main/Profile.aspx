<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FruitKha_Main.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="" />
    <title>User Profile</title>
    <%-- Link to Bootstrap CSS --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <%-- Link to your custom CSS if you have one --%>
     <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png" />
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet" />
	<!-- fontawesome -->
	<link rel="stylesheet" href="assets/css/all.min.css" />
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css" />
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css" />
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css" />
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css" />
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css" />
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css" />

    <style>

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <%-- Main Content Container --%>
        <div class="container mt-5 mb-5">

            <h2 class="text-center mb-4">User Profile</h2>

            <%-- Placeholder for Success/Error Messages from code-behind --%>
            <asp:Label ID="lblProfileMessage" runat="server" CssClass="alert alert-success d-block" Visible="false" EnableViewState="false" /> <%-- Added d-block for better layout --%>

            <!-- User Information -->
            <div class="card mb-4 shadow-sm"> <%-- Added shadow-sm --%>
                 <div class="card-header">
                    <h4>Personal Details</h4>
                </div>
                <div class="card-body">
                    <p><b>Username:</b> <asp:Label ID="lblUsername" runat="server" /></p>
                    <p><b>Email:</b> <asp:Label ID="lblEmail" runat="server" /></p>
                    <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger mt-2" Text="Logout" OnClick="btnLogout_Click" />
                </div>
            </div>

            <!-- Order History -->
            <div class="card shadow-sm"> <%-- Added shadow-sm --%>
                 <div class="card-header">
                    <h4>Order History</h4>
                </div>
                <div class="card-body">
                    <%-- Repeater for Grouped Orders - This replaces the old GridView --%>
                    <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptOrders_ItemDataBound">
                        <ItemTemplate>
                            <div class="order-group">
                                <div class="row order-details">
                                    <div class="col-md-6">
                                        <%-- Displaying Order Date, Total, Status --%>
                                        <p><strong>Order Date:</strong> <%# Eval("OrderDate", "{0:dd MMM yyyy hh:mm tt}") %></p> <%-- Formatted date --%>
                                        <p><strong>Order Total:</strong> ₹<%# Eval("GrandTotal", "{0:N2}") %></p>
                                        <p><strong>Status:</strong> <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'><%# Eval("Status") %></span></p> <%-- Dynamic Badge Class --%>
                                    </div>
                                    <div class="col-md-6">
                                         <%-- Displaying Shipping Address - Raw HTML from code-behind --%>
                                         <p><strong>Shipping Address:</strong></p>
                                         <%# Eval("ShippingAddressHtml") %>
                                    </div>
                                </div>
                                <hr />
                                 <h5>Items in this Order:</h5>
                                 <%-- Inner GridView for Items within this specific Order Group --%>
                                 <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False"
                                     CssClass="table table-sm table-striped order-items-grid" GridLines="None" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="ItemName" HeaderText="Product" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="TotalPrice" HeaderText="Price" DataFormatString="₹{0:N2}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"/>
                                    </Columns>
                                    <HeaderStyle CssClass="table-light" /> <%-- Light background for header --%>
                                 </asp:GridView>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                             <%-- Optional: Add content after all items if needed --%>
                        </FooterTemplate>
                    </asp:Repeater>

                    <%-- Message displayed if no orders are found --%>
                    <asp:Label ID="lblNoOrders" runat="server" Text="You have no past orders." Visible="false" CssClass="text-muted mt-3"></asp:Label>

                </div>
            </div>
        </div> <%-- End of Container --%>

    </form>
    <!-- jquery -->
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>
</body>
</html>