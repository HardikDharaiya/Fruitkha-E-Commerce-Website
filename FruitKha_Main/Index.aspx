<%@ Page Title="Fruitkha - Home" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Index.aspx.cs" Inherits="FruitKha_Main.Index1" %>

<%-- Removed ContentPlaceHolder1 as header is now fully in Master --%>

<%-- Main Content Area --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<!-- hero area -->
    <%-- You can uncomment this if you want a hero banner --%>
	<%--<div class="hero-area hero-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-2 text-center">
					<div class="hero-text">
						<div class="hero-text-tablecell">
							<p class="subtitle">Fresh & Organic</p>
							<h1>Delicious Seasonal Fruits</h1>
							<div class="hero-btns">
								<a href="shop.aspx" class="boxed-btn">Fruit Collection</a>
								<a href="contact.aspx" class="bordered-btn">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>--%>
	<!-- end hero area -->

	<!-- features list section -->
	<div class="list-section pt-80 pb-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                    <div class="list-box d-flex align-items-center">
                        <div class="list-icon">
                            <i class="fas fa-shipping-fast"></i>
                        </div>
                        <div class="content">
                            <h3>Free Shipping</h3>
                            <p>When order over ₹ 499</p> <%-- Updated text --%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                    <div class="list-box d-flex align-items-center">
                        <div class="list-icon">
                            <i class="fas fa-phone-volume"></i>
                        </div>
                        <div class="content">
                            <h3>24/7 Support</h3>
                            <p>Get support all day</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="list-box d-flex justify-content-start align-items-center">
                        <div class="list-icon">
                            <i class="fas fa-sync"></i>
                        </div>
                        <div class="content">
                            <h3>Refund</h3>
                            <p>Get refund within 3 days!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end features list section -->


<!-- product section -->
<div class="product-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Popular</span> Products</h3>
                    <p>Discover our range of fresh and delicious fruits, carefully selected for you.</p>
                </div>
            </div>
        </div>

        <%-- **** Using Repeater for Precise Bootstrap Grid **** --%>
        <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
            <HeaderTemplate>
                <div class="row product-lists"> <%-- Start the Bootstrap row --%>
            </HeaderTemplate>

            <ItemTemplate>
                <div class="col-lg-4 col-md-6 text-center mb-4"> 
                    <div class="single-product-item">
                        <div class="product-image">
                             <asp:LinkButton ID="lnkProductImage" runat="server" CommandName="ViewProduct" CommandArgument='<%# Eval("ItemID") %>'>
                                <asp:Image ID="imgProduct" runat="server"
                                    ImageUrl='<%# ResolveUrl(Eval("ItemImage").ToString()) %>'
                                    CssClass="img-fluid"
                                    AlternateText='<%# Eval("ItemName") %>' />
                             </asp:LinkButton>
                        </div>
                        <h3><asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label></h3>
                        <p class="product-price">
                            <span><asp:Label ID="Label4" runat="server" Text='<%# "Per " + Eval("ItemMeasurement") %>'></asp:Label></span>
                            ₹<asp:Label ID="Label7" class="price-value" runat="server" Text='<%# Eval("ItemPrice", "{0:N2}") %>'></asp:Label>
                        </p>
                        <asp:LinkButton ID="Button1" runat="server"
                            CssClass="cart-btn"
                            CommandName="AddToCart"  
                            CommandArgument='<%# Eval("ItemID") %>'>
                             <i class="fas fa-shopping-cart"></i> Add To Cart
                         </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>

            <FooterTemplate>
                </div> 
            </FooterTemplate>
        </asp:Repeater>
         <%-- **** End of Repeater **** --%>

    </div>
</div>
<!-- end product section -->


    <!-- shop banner -->
	<section class="shop-banner">
    	<div class="container">
        	<h3><span id="month"></span> sale is on! <br> with big <span class="orange-text">Discount...</span></h3>
            <div class="sale-percent"><span>Sale! <br> Upto</span>50% <span>off</span></div>
            <a href="shop.aspx" class="cart-btn btn-lg">Shop Now</a>
        </div>
    </section>
    <script>
        // Simple script to set the current month name
        (function () {
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            const d = new Date();
            const monthElement = document.getElementById('month');
            if (monthElement) {
                monthElement.textContent = monthNames[d.getMonth()];
            }
        })();
    </script>
	<!-- end shop banner -->


	<!-- testimonail-section -->
	<div class="testimonail-section mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 text-center">
                    <div class="testimonial-sliders">
                        <div class="single-testimonial-slider">
                            <div class="client-avater">
                                <%-- Use ResolveUrl for images --%>
                                <img src='<%= ResolveUrl("~/Images/Hardik2.jpg") %>' alt="Hardik Dharaiya">
                            </div>
                            <div class="client-meta">
                                <h3>Hardik Dharaiya <span>Developer</span></h3>
                                <p class="testimonial-body">
                                    "Passionate about building robust and user-friendly web applications using ASP.NET and modern web technologies." <%-- Added text --%>
                                </p>
                                <div class="last-icon">
                                    <i class="fas fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial-slider">
                            <div class="client-avater">
                                <img src='<%= ResolveUrl("~/Images/Mohit2.jpg") %>' alt="Mohit Yadav">
                            </div>
                            <div class="client-meta">
                                <h3>Mohit Yadav <span>Developer</span></h3>
                                <p class="testimonial-body">
                                     "Focused on creating efficient back-end logic and seamless database integration to power great online experiences." <%-- Added text --%>
                                </p>
                                <div class="last-icon">
                                    <i class="fas fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end testimonail-section -->

	<%-- Other sections like Advertisement, News, Logo Carousel can remain similar --%>
    <%-- Make sure they also use Bootstrap rows/columns if needed --%>

	<!-- logo carousel -->
	<div class="logo-carousel-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="logo-carousel-inner">
                        <div class="single-logo-item"><img src='<%= ResolveUrl("~/assets/img/company-logos/1.png") %>' alt="Company Logo 1"></div>
                        <div class="single-logo-item"><img src='<%= ResolveUrl("~/assets/img/company-logos/2.png") %>' alt="Company Logo 2"></div>
                        <div class="single-logo-item"><img src='<%= ResolveUrl("~/assets/img/company-logos/3.png") %>' alt="Company Logo 3"></div>
                        <div class="single-logo-item"><img src='<%= ResolveUrl("~/assets/img/company-logos/4.png") %>' alt="Company Logo 4"></div>
                        <div class="single-logo-item"><img src='<%= ResolveUrl("~/assets/img/company-logos/5.png") %>' alt="Company Logo 5"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end logo carousel -->
</asp:Content>

<%-- Removed ContentPlaceHolder3 as Footer is now fully in Master --%>

<%-- This placeholder replaces ContentPlaceHolder1 from the old Master page --%>
<asp:Content ID="HeaderIconContent" ContentPlaceHolderID="HeaderIconsContent" runat="server">
     <a class="shopping-cart" href='<%= ResolveUrl("~/cart.aspx") %>'><i class="fas fa-shopping-cart"></i></a>
     <%--<a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>--%>
     <%-- This is where the dynamic profile link/name goes --%>
     <a id="profileLinkContainer" runat="server" class="profile-link-container">
         <asp:HyperLink ID="profileLink" runat="server" NavigateUrl="~/Login.aspx" CssClass="profile">
             <i class="fas fa-user"></i>
             <asp:Label ID="UserNameTxt" runat="server" Text="" CssClass="profile-name"></asp:Label>
         </asp:HyperLink>
     </a>
</asp:Content>