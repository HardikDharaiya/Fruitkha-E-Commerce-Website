<%@ Page Title="" Language="C#" MasterPageFile="~/cart.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="FruitKha_Main.cart1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
				<!-- search area -->
	<div class="search-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <span class="close-btn"><i class="fas fa-window-close"></i></span>
                    <div class="search-bar">
                        <div class="search-bar-tablecell">
                            <h3>Search For:</h3>
                            <input type="text" placeholder="Keywords">
                            <button type="submit">
                                Search <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end search arewa -->
	
	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="breadcrumb-text">
                        <p>
                            Fresh and Organic</p>
                        <h1>Cart</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end breadcrumb section -->




<div class="cart-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12">
                <h2>Your Shopping Cart</h2>
                <div class="cart-table-wrap" style="overflow-x: auto;">
                   <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" CssClass="cart-table"
    DataKeyNames="CartID" OnRowDeleting="CartGridView_RowDeleting" 
    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
    CellPadding="4" ForeColor="Black" GridLines="Horizontal"
    style="width: 100%;">
                       
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <HeaderStyle CssClass="cart-table-head" BackColor="#333333" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    <RowStyle CssClass="table-body-row" />
    <Columns>
        <asp:TemplateField HeaderText="Remove Item">
            <ItemTemplate>
                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="product-remove" 
                    style="text-align:center; display:block;">
                    <i class="far fa-window-close"></i>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Product Image">
            <ItemTemplate>
                <img src='<%# ResolveUrl(Eval("ItemImage").ToString()) %>' 
                     class="img-fluid rounded" 
                     alt="Product Image" 
                     style="max-width: 80px; max-height: 80px; display: block; margin: 0 auto;" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="ItemName" HeaderText="Name">
            <ItemStyle CssClass="product-name" HorizontalAlign="Center" />
        </asp:BoundField>

        <asp:BoundField DataField="ItemPrice" HeaderText="Price" DataFormatString="₹{0:N2}">
            <ItemStyle CssClass="product-price" HorizontalAlign="Center" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <span class="product-quantity" style="display: block; text-align: center;"><%# Eval("Quantity") %></span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="TotalPrice" HeaderText="Total" DataFormatString="₹{0:N2}">
            <ItemStyle CssClass="product-total" HorizontalAlign="Center" />
        </asp:BoundField>
    </Columns>

    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Simple row hover effect -->
<style>
    .table-body-row:hover {
        background-color: #f9f9f9 !important;
        transition: background 0.3s ease;
    }
</style>

<div class="cart-footer">
    <table class="total-table">
        <tbody>
            <tr class="table-total-row">
                <th>Total Amount:</th>
                <td class="total-amount">
                    <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="cart-buttons">
        <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" OnClick="btnCheckout_Click" CssClass="checkout-btn" />
    </div>
</div>




    <%-- <div>
            <h2>Your Shopping Cart</h2>
            <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CartID" OnRowDeleting="CartGridView_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Product" />
                    <asp:BoundField DataField="ItemMeasurement" HeaderText="Measurement" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="Price" DataFormatString="₹{0:N2}" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' Width="40px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="₹{0:N2}" />
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Remove" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
        </div>--%>




	<!-- logo carousel -->
	<div class="logo-carousel-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="logo-carousel-inner">
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/1.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/2.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/3.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/4.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end logo carousel -->
            </asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
				<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle">
            </div>
        </div>
    </div>
    <!--PreLoader Ends-->
	
	<!-- header -->
	<div class="top-header-area" id="sticker">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-sm-12 text-center">
                    <div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
                            <a href="index.aspx">
                            <img src="assets/img/logo.png" alt=""> </a>&nbsp;</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
                            <ul>
                                <li class="current-list-item"><a href="index.aspx">Home</a></li>
                                <li><a href="about.aspx">About</a></li>
                                <li><a href="contact.aspx">Contact</a></li>
                                <li><a href="shop.aspx">Shop</a> </li>
                                <li>
                                    <div class="header-icons">
<a class="shopping-cart" href="cart.aspx"><i class="fas fa-shopping-cart"></i></a><a id="profileLink" class="profile" href="Profile.aspx" runat="server"><i class="fas fa-user"></i></a>
                                        <a class="shopping-cart" href="Profile.aspx">
                                            <asp:Label ID="UserNameTxt" runat="server" Text="Label"></asp:Label></a>                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <div class="mobile-menu">
                        </div>
						<!-- menu end -->
					</div>
                </div>
            </div>
        </div>
    </div>
	<!-- end header -->
            </asp:Content>



