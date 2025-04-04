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

<%--<div class="cart-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12">
                <h2>Your Shopping Cart</h2>
                <div class="cart-table-wrap">
                    <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" CssClass="cart-table"
                        DataKeyNames="CartID" OnRowDeleting="CartGridView_RowDeleting" ShowHeader="true">
                        <HeaderStyle CssClass="cart-table-head" />
                        <RowStyle CssClass="table-body-row" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <td class="product-remove">
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="delete-icon">
                                            <i class="far fa-window-close"></i>
                                        </asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Image">
                                <ItemTemplate>
                                    <td class="product-image">
                                        <img src='<%# ResolveUrl(Eval("ItemImage").ToString()) %>' alt="Product Image" onerror="this.onerror=null;this.src='assets/images/default.png';" />
                                    </td>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ItemName" HeaderText="Name" ItemStyle-CssClass="product-name" />

                            <asp:BoundField DataField="ItemPrice" HeaderText="Price" DataFormatString="₹{0:N2}" ItemStyle-CssClass="product-price" />

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <td class="product-quantity">
                                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="quantity-input"></asp:TextBox>
                                    </td>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="TotalPrice" HeaderText="Total" DataFormatString="₹{0:N2}" ItemStyle-CssClass="product-total" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="cart-footer">
    <table class="total-table">
        <tbody>
            <tr class="table-total-row">
                <th>Total Amount</th>
                <td>
                    <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True" CssClass="total-amount"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="cart-buttons">
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" CssClass="checkout-btn" />
    </div>
</div>--%>





     <div>
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
        </div>


	<!-- cart -->
	<div class="cart-section mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <div class="cart-table-wrap">
                        <table class="cart-table">
                            <thead class="cart-table-head">
                                <tr class="table-head-row">
                                    <th class="product-remove"></th>
                                    <th class="product-image">Product Image</th>
                                    <th class="product-name">Name</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-total">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-body-row">
                                    <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                                    <td class="product-image">
                                        <img src="assets/img/products/product-img-1.jpg" alt=""></td>
                                    <td class="product-name">Strawberry</td>
                                    <td class="product-price">$85</td>
                                    <td class="product-quantity">
                                        <input type="number" placeholder="0"></td>
                                    <td class="product-total">1</td>
                                </tr>
                                <tr class="table-body-row">
                                    <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                                    <td class="product-image">
                                        <img src="assets/img/products/product-img-2.jpg" alt=""></td>
                                    <td class="product-name">Berry</td>
                                    <td class="product-price">$70</td>
                                    <td class="product-quantity">
                                        <input type="number" placeholder="0"></td>
                                    <td class="product-total">1</td>
                                </tr>
                                <tr class="table-body-row">
                                    <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                                    <td class="product-image">
                                        <img src="assets/img/products/product-img-3.jpg" alt=""></td>
                                    <td class="product-name">Lemon</td>
                                    <td class="product-price">$35</td>
                                    <td class="product-quantity">
                                        <input type="number" placeholder="0"></td>
                                    <td class="product-total">1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="total-section">
                        <table class="total-table">
                            <thead class="total-table-head">
                                <tr class="table-total-row">
                                    <th>Total</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="total-data">
                                    <td><strong>Subtotal: </strong></td>
                                    <td>$500</td>
                                </tr>
                                <tr class="total-data">
                                    <td><strong>Shipping: </strong></td>
                                    <td>$45</td>
                                </tr>
                                <tr class="total-data">
                                    <td><strong>Total: </strong></td>
                                    <td>$545</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="cart-buttons">
                            <a href="cart.aspx" class="boxed-btn">Update Cart</a> <a href="checkout.aspx" class="boxed-btn black">Check Out</a>
                        </div>
                    </div>

					<%--<div class="coupon-section">
						<h3>Apply Coupon</h3>
						<div class="coupon-form-wrap">
							<form action="index.aspx">
								<p><input type="text" placeholder="Coupon"></p>
								<p><input type="submit" value="Apply"></p>
							</form>
						</div>
					</div>--%>
				</div>
            </div>
        </div>
    </div>
	<!-- end cart -->

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


