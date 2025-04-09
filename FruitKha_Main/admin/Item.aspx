<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="FruitKha_Main.admin.Item" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Admin Panel - Manage Items"/>
    <title>Admin - Manage Items</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="~/assets/img/favicon.png"/>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"/>

    <!-- CSS Libraries (using root-relative paths assumed to be correct) -->
    <link rel="stylesheet" href="~/assets/css/all.min.css"/>
    <link rel="stylesheet" href="~/assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="~/assets/css/owl.carousel.css"/>
    <link rel="stylesheet" href="~/assets/css/magnific-popup.css"/>
    <link rel="stylesheet" href="~/assets/css/animate.css"/>
    <link rel="stylesheet" href="~/assets/css/meanmenu.min.css"/>
    <link rel="stylesheet" href="~/assets/css/main.css"/>
    <link rel="stylesheet" href="~/assets/css/responsive.css"/>

    <style>
        /* Add some spacing */
        .form-section, .filter-section, .grid-section {
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #eee;
            border-radius: 5px;
            background-color:#f8f9fa; /* Light background for sections */
        }
        .form-section h3, .filter-section h3, .grid-section h3 {
           margin-bottom: 20px;
           color:#051922; /* Darker heading */
        }
        .grid-view-container {
            overflow-x: auto; /* Add scroll for smaller screens */
        }
        .grid-view-container table {
           width: 100%;
           border-collapse: collapse;
        }
        .grid-view-container th, .grid-view-container td {
            padding: 8px 12px;
            border: 1px solid #dee2e6;
            text-align: left;
            vertical-align: middle;
        }
         .grid-view-container th {
            background-color: #051922; /* Match header theme */
            color: #fff;
         }
        .grid-view-container tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .grid-view-container img {
            max-height: 60px;
            max-width: 60px;
            object-fit: cover;
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
            background-color: #F59E0B; /* Orange */
            color: white;
            padding: 5px 10px;
            border-radius: 3px;
            margin: 0 2px;
        }
         .pagination-ys table > tbody > tr > td > a {
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
        .validation-summary-errors ul {
             color: red;
             margin-left: 20px;
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
                                 <a href='<%= ResolveUrl("~/admin/Admin.aspx") %>'> <%-- Link to Admin Dashboard --%>
                                     <img src='<%= ResolveUrl("~/assets/img/logo.png") %>' alt="Logo"/></a>
                             </div>
                             <!-- Menu Start -->
                             <nav class="main-menu">
                                 <ul>
                                     <li><a href='<%= ResolveUrl("~/admin/Admin.aspx") %>'>Dashboard</a></li>
                                     <li class="current-list-item"><a href='<%= ResolveUrl("~/admin/Item.aspx") %>'>Item</a></li>
                                     <li><a href='<%= ResolveUrl("~/admin/Order.aspx") %>'>Order</a></li>
                                     <li><a href='<%= ResolveUrl("~/admin/Users.aspx") %>'>Users</a></li>
                                     <li class="profile-menu"><a href="#"><i class="fas fa-user"></i></a>
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
                             <h1>Manage Items</h1>
                         </div>
                     </div>
                 </div>
            </div>

            <!-- Item Form Section -->
            <div class="form-section">
                <h3><asp:Literal ID="litFormTitle" runat="server" Text="Add New Item"></asp:Literal></h3>
                <asp:Panel ID="pnlForm" runat="server">
                    <asp:HiddenField ID="hfItemID" runat="server" Value="" />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtItemName">Item Name <span style="color:red;">*</span></label>
                                <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" placeholder="e.g., Apple"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvItemName" runat="server" ControlToValidate="txtItemName"
                                    ErrorMessage="Item Name is required." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtItemMeasurement">Measurement <span style="color:red;">*</span></label>
                                <asp:TextBox ID="txtItemMeasurement" runat="server" CssClass="form-control" placeholder="e.g., Per Kg, Per Dozen"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvItemMeasurement" runat="server" ControlToValidate="txtItemMeasurement"
                                    ErrorMessage="Measurement is required." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group">
                                <label for="txtItemPrice">Price (₹) <span style="color:red;">*</span></label>
                                <asp:TextBox ID="txtItemPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" placeholder="e.g., 80.00"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvItemPrice" runat="server" ControlToValidate="txtItemPrice"
                                    ErrorMessage="Price is required." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvItemPrice" runat="server" ControlToValidate="txtItemPrice" Operator="DataTypeCheck"
                                    Type="Currency" ErrorMessage="Please enter a valid price." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:CompareValidator>
                                <asp:RangeValidator ID="rvItemPrice" runat="server" ControlToValidate="txtItemPrice" MinimumValue="0.01" MaximumValue="100000"
                                    Type="Currency" ErrorMessage="Price must be greater than 0." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:RangeValidator>
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtItemCategory">Category <span style="color:red;">*</span></label>
                                <asp:TextBox ID="txtItemCategory" runat="server" CssClass="form-control" placeholder="e.g., Fruit, Vegetable"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfvItemCategory" runat="server" ControlToValidate="txtItemCategory"
                                    ErrorMessage="Category is required." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="txtItemDescription">Description <span style="color:red;">*</span></label>
                        <asp:TextBox ID="txtItemDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Describe the item"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvItemDescription" runat="server" ControlToValidate="txtItemDescription"
                            ErrorMessage="Description is required." Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="fuItemImage">Item Image</label>
                        <asp:FileUpload ID="fuItemImage" runat="server" CssClass="form-control-file" />
                        <asp:Label ID="lblCurrentImage" runat="server" Text="" CssClass="text-muted d-block mt-1"></asp:Label>
                        <asp:RegularExpressionValidator ID="revImageUpload" runat="server"
                            ControlToValidate="fuItemImage"
                            ErrorMessage="Only .jpg, .jpeg, .png, .gif files are allowed."
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.jpeg|.png|.gif|.JPG|.JPEG|.PNG|.GIF)$"
                            Display="Dynamic" ForeColor="Red" ValidationGroup="ItemValidation" />
                        <%-- Note: Above Regex might need adjustment depending on browser/OS path format --%>
                         <asp:CustomValidator ID="cvImageRequiredOnAdd" runat="server" ControlToValidate="fuItemImage"
                             ErrorMessage="Image is required when adding a new item." ForeColor="Red" Display="Dynamic"
                             ValidationGroup="ItemValidation" OnServerValidate="CvImageRequired_ServerValidate" />
                    </div>

                    <div class="form-group">
                         <asp:Button ID="btnSave" runat="server" Text="Add Item" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="ItemValidation" />
                         <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                    <asp:Label ID="lblFormMessage" runat="server" EnableViewState="false" CssClass="mt-2 d-block"></asp:Label>
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ItemValidation" ForeColor="Red" CssClass="mt-2 validation-summary-errors"/>
                </asp:Panel>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <h3>Filter Items</h3>
                <div class="row">
                    <div class="col-md-5">
                         <div class="form-group">
                             <label for="txtFilterName">Filter by Name:</label>
                            <asp:TextBox ID="txtFilterName" runat="server" CssClass="form-control" placeholder="Enter item name"></asp:TextBox>
                         </div>
                    </div>
                     <div class="col-md-5">
                        <div class="form-group">
                             <label for="ddlFilterCategory">Filter by Category:</label>
                            <asp:DropDownList ID="ddlFilterCategory" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- All Categories --" Value="All" />
                                <%-- Populate this dynamically if needed, or add static common categories --%>
                                <asp:ListItem Text="Fruit" Value="Fruit" />
                                <asp:ListItem Text="Berry" Value="Berry" />
                              
                                <%-- Add more categories as needed --%>
                            </asp:DropDownList>
                        </div>
                    </div>
                     <div class="col-md-2 align-self-end">
                        <div class="form-group">
                            <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btn btn-info w-100" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- GridView Section -->
            <div class="grid-section">
                <h3>Item List</h3>
                <asp:Label ID="lblGridMessage" runat="server" EnableViewState="false" CssClass="mb-2 d-block text-info"></asp:Label>
                <div class="grid-view-container">
                    <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="ItemID" CssClass="table table-bordered table-striped"
                        AllowPaging="True" PageSize="10" OnPageIndexChanging="gvItems_PageIndexChanging"
                        OnRowCommand="gvItems_RowCommand" OnRowDataBound="gvItems_RowDataBound">
                         <PagerStyle CssClass="pagination-ys" />
                        <Columns>
                            <asp:BoundField DataField="ItemID" HeaderText="ID" ReadOnly="True" SortExpression="ItemID" ItemStyle-Width="5%" />
                            <asp:TemplateField HeaderText="Image" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Image ID="imgItem" runat="server" Width="60" Height="60" Style="object-fit: cover;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemName" HeaderText="Name" SortExpression="ItemName" ItemStyle-Width="20%" />
                            <asp:BoundField DataField="ItemMeasurement" HeaderText="Measure" SortExpression="ItemMeasurement" ItemStyle-Width="10%" />
                            <asp:BoundField DataField="ItemPrice" HeaderText="Price (₹)" SortExpression="ItemPrice" DataFormatString="{0:N2}" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Right" />
                            <asp:BoundField DataField="ItemCategory" HeaderText="Category" SortExpression="ItemCategory" ItemStyle-Width="15%" />
                             <asp:BoundField DataField="ItemDescription" HeaderText="Description" SortExpression="ItemDescription" /> 
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-sm btn-warning mr-1" CommandName="EditItem" CommandArgument='<%# Eval("ItemID") %>'>
                                        <i class="fas fa-pencil-alt"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-sm btn-danger" CommandName="DeleteItem" CommandArgument='<%# Eval("ItemID") %>'>
                                         <i class="fas fa-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                             <div class="text-center p-3">No items found matching your criteria.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

        </div>
        <!-- End Main Content Area -->

        <!-- Footer (Optional - Copied structure from header) -->
        <div class="footer-area">
            <div class="container">
                <div class="row">
                   <%-- Footer Content Here --%>
                </div>
            </div>
        </div>
        <!-- End Footer -->

        <!-- Copyright -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <p>Copyrights © <%= DateTime.Now.Year %> , All Rights Reserved.</p>
                    </div>
                    <div class="col-lg-6 text-right col-md-12">
                        <%-- Social Icons etc. --%>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Copyright -->

    </form>

    <!-- JavaScript Libraries (using root-relative paths) -->
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
