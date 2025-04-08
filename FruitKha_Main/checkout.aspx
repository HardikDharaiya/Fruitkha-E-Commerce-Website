<%@ Page Title="" Language="C#" MasterPageFile="~/checkout.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="FruitKha_Main.checkout1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
	
    
    
    
    
       <%-- Ensure ContentPlaceHolderID matches your checkout.Master --%>

    <!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="breadcrumb-text">
                        <p>Fresh and Fast</p>
                        <h1>Check Out Product</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end breadcrumb section -->

    <!-- check out section -->
	<div class="checkout-section mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="checkout-accordion-wrap">
                        <div class="accordion" id="accordionExample">
                            <div class="card single-accordion">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Shipping Address
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="billing-address-form">
                                            <%-- Add ValidationSummary --%>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please correct the following errors:" CssClass="alert alert-danger"/>

                                            <p>
                                                <asp:TextBox ID="NameTxt" CssClass="input-field" runat="server" Placeholder="Full Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full Name is required." ControlToValidate="NameTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                            <p>
                                                <asp:TextBox ID="EmailTxt" CssClass="input-field" runat="server" Placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required." ControlToValidate="EmailTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Format." ControlToValidate="EmailTxt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                            </p>
                                             <p>
                                                <asp:TextBox ID="PhoneTxt" CssClass="input-field" runat="server" Placeholder="Phone Number" TextMode="Phone"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone Number is required." ControlToValidate="PhoneTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                            <p>
                                                <asp:TextBox ID="AddressTxt" CssClass="input-field" runat="server" Placeholder="Address Line 1 (Street, House No.)"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address Line 1 is required." ControlToValidate="AddressTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                            <p>
                                                <asp:TextBox ID="AddressLine2Txt" CssClass="input-field" runat="server" Placeholder="Address Line 2 (Apt, Suite - Optional)"></asp:TextBox> <%-- Optional --%>
                                            </p>
                                             <p>
                                                <asp:TextBox ID="CityTxt" CssClass="input-field" runat="server" Placeholder="City"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="City is required." ControlToValidate="CityTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                             <p>
                                                <asp:TextBox ID="StateTxt" CssClass="input-field" runat="server" Placeholder="State / Province"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="State is required." ControlToValidate="StateTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                             <p>
                                                <asp:TextBox ID="PostalCodeTxt" CssClass="input-field" runat="server" Placeholder="Postal / Zip Code"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Postal Code is required." ControlToValidate="PostalCodeTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                             <p>
                                                <asp:TextBox ID="CountryTxt" CssClass="input-field" runat="server" Placeholder="Country"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Country is required." ControlToValidate="CountryTxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </p>
                                            <p>
                                                <%-- Removed the static textarea --%>
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="order-details-wrap">
                        <table class="order-details">
                            <thead>
                                <tr>
                                    <th colspan="2">Your order Details</th> <%-- Changed colspan --%>
                                </tr>
                            </thead>
                             <%-- Use Repeater or ListView for dynamic items --%>
                             <asp:Repeater ID="rptOrderSummary" runat="server">
                                <HeaderTemplate>
                                    <tbody class="order-details-body">
                                        <tr>
                                            <td><strong>Product</strong></td>
                                            <td><strong>Total</strong></td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                     <tr>
                                        <td><%# Eval("ItemName") %> (<%# Eval("Quantity") %>)</td>
                                        <td>₹<%# Eval("TotalPrice", "{0:N2}") %></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                </FooterTemplate>
                            </asp:Repeater>


                            <tbody class="checkout-details">
                                <tr>
                                    <td>Subtotal</td>
                                    <td><asp:Label ID="lblSubtotal" runat="server" Text="₹0.00"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Shipping</td>
                                     <%-- Make shipping dynamic later if needed --%>
                                    <td><asp:Label ID="lblShipping" runat="server" Text="₹50.00"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><strong>Total</strong></td>
                                    <td><strong><asp:Label ID="lblGrandTotal" runat="server" Text="₹0.00"></asp:Label></strong></td>
                                </tr>
                            </tbody>
                        </table>
                        <%-- Replace <a> with Button or LinkButton --%>
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="boxed-btn" OnClick="btnPlaceOrder_Click" />
                         <%-- Optional: Add a message label --%>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end check out section -->
    
    
    
    
    
    
    
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



