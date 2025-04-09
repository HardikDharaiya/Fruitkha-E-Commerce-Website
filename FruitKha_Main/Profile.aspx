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
        /* ==========================================
   Profile Page Specific Styles - V2 (Modernized)
   ========================================== */

:root {
    /* Define theme colors for easy reuse */
    --theme-primary: #F28123; /* Orange */
    --theme-primary-dark: #db7420; /* Darker Orange */
    --theme-dark: #051922;      /* Dark Blue/Black */
    --text-light: #ffffff;
    --text-dark: #333333;
    --text-muted: #666666;
    --bg-light: #f9f9f9;
    --bg-white: #ffffff;
    --border-color: #e0e0e0;
    --shadow-soft: 0 4px 15px rgba(0, 0, 0, 0.08);
    --shadow-strong: 0 8px 25px rgba(0, 0, 0, 0.12);
}

body {
    background-color: var(--bg-light);
    font-family: 'Open Sans', sans-serif;
    color: var(--text-dark);
    line-height: 1.6;
}

.container.mt-5.mb-5 {
    max-width: 1000px;
    padding-top: 2rem; /* Add some top padding */
}

/* Page Title */
h2.text-center {
    font-family: 'Poppins', sans-serif;
    color: var(--theme-dark);
    margin-bottom: 3rem !important; /* Increased space */
    font-weight: 700;
    font-size: 2.25rem; /* Larger title */
}

/* Card Styling - Modern Look */
.card {
    border: none;
    border-radius: 10px; /* Slightly more rounded */
    margin-bottom: 2.5rem; /* Increased space */
    overflow: hidden;
    box-shadow: var(--shadow-soft);
    transition: box-shadow 0.35s ease-in-out, transform 0.3s ease;
}
.card:hover {
    box-shadow: var(--shadow-strong);
    transform: translateY(-5px); /* Subtle lift on hover */
}

.card-header {
    background-color: var(--theme-dark); /* Use dark background */
    color: var(--text-light); /* White text */
    padding: 1.25rem 1.75rem; /* More padding */
    border-bottom: none; /* Remove border, rely on background contrast */
}

.card-header h4 {
    margin-bottom: 0;
    font-family: 'Poppins', sans-serif;
    font-weight: 600;
    font-size: 1.25rem; /* Slightly larger header text */
    color: inherit; /* Inherit color from .card-header */
}

.card-body {
    padding: 2rem; /* Generous padding */
    background-color: var(--bg-white);
}

/* Personal Details Card Content */
.card-body p {
    margin-bottom: 1rem;
    color: var(--text-muted);
    font-size: 1rem; /* Ensure readable font size */
}
.card-body p b,
.card-body p strong {
    color: var(--text-dark);
    font-weight: 600; /* Bolder labels */
    min-width: 100px;
    display: inline-block;
    margin-right: 5px; /* Space after label */
}

/* Button Styling - Consistent Theme */
#btnLogout, #BackToHome2 {
    background-color: var(--theme-primary);
    border: 2px solid var(--theme-primary); /* Add border for definition */
    color: var(--text-light);
    padding: 12px 30px; /* Larger padding */
    border-radius: 30px; /* More rounded */
    font-weight: 700;
    font-family: 'Poppins', sans-serif;
    text-transform: uppercase;
    letter-spacing: 1px; /* More spacing */
    transition: all 0.3s ease; /* Smooth transition for all properties */
    margin-right: 15px;
    margin-top: 1.5rem !important;
    cursor: pointer;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Subtle default shadow */
}
#btnLogout:last-child, #BackToHome2:last-child {
     margin-right: 0;
}

#btnLogout:hover, #BackToHome2:hover,
#btnLogout:focus, #BackToHome2:focus {
    background-color: var(--theme-primary-dark);
    border-color: var(--theme-primary-dark);
    color: var(--text-light);
    transform: translateY(-3px) scale(1.03); /* Lift and slightly enlarge */
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.18); /* Stronger shadow on hover */
}

/* Order History - Repeater Item Styling */
.order-group {
    border: 1px solid var(--border-color);
    padding: 2rem; /* More padding */
    margin-bottom: 2rem; /* More space */
    border-radius: 8px;
    background-color: var(--bg-white);
    box-shadow: var(--shadow-soft);
    transition: box-shadow 0.3s ease, border-left 0.3s ease;
    position: relative; /* Needed for potential pseudo-elements */
    border-left: 5px solid transparent; /* Prepare for hover effect */
}
.order-group:hover {
    box-shadow: var(--shadow-strong);
    border-left: 5px solid var(--theme-primary); /* Add accent color border on hover */
}
.order-group:last-child {
    margin-bottom: 0;
}

.order-details {
    margin-bottom: 1.5rem; /* Space between details and items table */
}

.order-details p {
    font-size: 1rem; /* Standardize size */
    margin-bottom: 0.75rem;
    color: var(--text-muted);
}

.order-details strong {
    color: var(--text-dark);
    font-weight: 600;
    margin-right: 8px; /* Space after label */
}
.order-details .col-md-6 {
     padding-left: 20px; /* Add some padding within columns */
     padding-right: 20px;
}

/* Style the Shipping Address more distinctly */
.order-details p strong:contains("Shipping Address:") + br {
     display: block; /* Ensure line break works */
     margin-bottom: 5px;
}


.order-group hr {
    margin-top: 1.5rem;
    margin-bottom: 1.5rem;
    border-top: 1px dashed var(--border-color); /* Dashed separator */
}

.order-group h5 {
    margin-bottom: 1.5rem; /* More space */
    color: var(--theme-primary); /* Theme color for this heading */
    font-family: 'Poppins', sans-serif;
    font-weight: 700; /* Bolder */
    font-size: 1.1rem; /* Slightly larger */
}

/* Order Items GridView Styling */
.order-items-grid {
    margin-top: 0; /* Remove top margin, controlled by h5 margin */
    border: none; /* Remove outer border, rely on row borders */
    width: 100%;
}

.order-items-grid th { /* Table Header */
    background-color: var(--bg-light);
    color: var(--theme-dark);
    font-weight: 700; /* Bolder header */
    font-family: 'Poppins', sans-serif;
    padding: 1rem 1.25rem;
    border-bottom: 2px solid var(--border-color); /* Stronger bottom border */
    white-space: nowrap;
    font-size: 0.9rem;
    text-align: left; /* Default left align */
}

.order-items-grid td { /* Table Cells */
    padding: 1rem 1.25rem;
    vertical-align: middle;
    font-size: 0.95rem;
    color: var(--text-dark);
    border-bottom: 1px solid #f0f0f0; /* Lighter row separator */
    text-align: left; /* Default left align */
}

/* Add hover effect to table rows */
.order-items-grid tbody tr:hover {
    background-color: #fdf5ed; /* Very light orange tint on hover */
}

/* Remove default striping if using hover */
.order-items-grid.table-striped tbody tr:nth-of-type(odd) {
   background-color: transparent; /* Remove striping for cleaner look with hover */
}
.order-items-grid tbody tr:last-child td {
    border-bottom: none; /* Remove border from last row */
}


/* === Alignment Fixes for GridView === */
/* Quantity Column (Assuming 2nd column) - Center Align */
.order-items-grid th:nth-child(2),
.order-items-grid td:nth-child(2) {
    text-align: center !important; /* Force center alignment */
}

/* Price Column (Assuming 3rd column) - Right Align */
.order-items-grid th:nth-child(3),
.order-items-grid td:nth-child(3) {
    text-align: right !important; /* Force right alignment */
}


/* Status Badge Styling */
.badge {
    font-size: 0.8rem; /* Slightly smaller, adjust as needed */
    padding: 0.6em 1em; /* Adjust padding */
    font-weight: 700;
    border-radius: 20px; /* Pill shape */
    letter-spacing: 0.5px;
    text-transform: capitalize; /* e.g., 'Pending' instead of 'pending' */
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
/* Ensure good contrast - adjust colors if needed */
.badge.bg-success { color: white; background-color: #198754 !important; }
.badge.bg-warning { color: black; background-color: #ffc107 !important; }
.badge.bg-info    { color: white; background-color: #0dcaf0 !important; }
.badge.bg-secondary{ color: white; background-color: #6c757d !important; }
.badge.bg-danger  { color: white; background-color: #dc3545 !important; }
.badge.bg-primary { color: white; background-color: #0d6efd !important; } /* Example */


/* Alert Message Styling */
.alert { /* General alert styling */
     border-radius: 8px;
     padding: 1.25rem 1.5rem;
     font-size: 1rem;
     margin-bottom: 1.5rem; /* Ensure space below */
     border-width: 2px; /* Slightly thicker border */
     border-style: solid;
}
.alert-success {
     background-color: #e9f5ec;
     border-color: #a1d9ae;
     color: #135c29;
}
.alert-danger {
     background-color: #fdeded;
     border-color: #f8c1c4;
     color: #842029;
}

/* No Orders Message */
 #lblNoOrders {
    font-style: normal; /* Remove italic */
    padding: 3rem 1rem; /* More padding */
    text-align: center;
    display: block;
    color: var(--text-muted);
    background-color: var(--bg-white); /* Give it a background */
    border: 1px dashed var(--border-color); /* Dashed border */
    border-radius: 8px;
    margin-top: 2rem; /* Space if it appears */
    font-size: 1.1rem;
 }
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
                    <asp:Button ID="BackToHome2" runat="server" CssClass="btn btn-danger mt-2" Text="Back" OnClick="BackToHome2_Click"/>
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