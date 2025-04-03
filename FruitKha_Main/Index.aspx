<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Index.aspx.cs" Inherits="FruitKha_Main.Index1" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
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
	<!-- end search area -->

	<!-- hero area -->
                 <%--<div class="hero-area hero-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-2 text-center">
					<div class="hero-text">
						<div class="hero-text-tablecell">
							<p class="subtitle">Fresh & Organic</p>
							<h1>Delicious Seasonal Fruits</h1>
							<div class="hero-btns">
								<a href="shop.html" class="boxed-btn">Fruit Collection</a>
								<a href="contact.html" class="bordered-btn">Contact Us</a>
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
                            <p>
                                When order over $75</p>
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
                            <p>
                                Get support all day</p>
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
                            <p>
                                Get refund within 3 days!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end features list section -->


    	<div class="product-section mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="section-title">
                        <h3><span class="orange-text">Our</span> Products</h3>
                        <p>It is very important to pay attention to the fat reduction process during training. Something, so the escape is a happy option.</p>
                    </div>
                </div>
            </div>
    <div class="col-lg-4 col-md-6 text-center">
    <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatDirection="Horizontal">
        <ItemTemplate>
            
                    <div class="single-product-item">
                        <div class="product-image">                           
                            <asp:ImageButton class="product-image" Height="350px" Width="350px" OnClick="ImageButton1_Click" ID="ImageButton1" runat="server" ImageUrl='<%# Eval("ItemImage") %>' CommandArgument='<%# Eval("ItemID") %>' OnCommand="ImageButton1_Command" />                           
                        </div>
                        <h3><asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label></h3>
                        <p class="product-price">
                            <span><asp:Label ID="Label4" runat="server" Text="Per" Style="display:inline;"></asp:Label>  
                             
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ItemMeasurement") %>' Style="display:inline;"></asp:Label>
                            </span>
                             <h3 style="display:inline;"><asp:Label ID="Label6" runat="server" Style="display:inline;" Text="₹"></asp:Label>
                             <asp:Label ID="Label7" class="product-price" runat="server" Text='<%# Eval("ItemPrice") %>'></asp:Label></h3>
                            <br />
                            <p>
                            </p>
                            <asp:LinkButton ID="Button1" runat="server" class="cart-btn" CommandArgument='<%# Eval("ItemID") %>' href="cart.html"><i class="fas fa-shopping-cart"></i>Add To Cart</asp:LinkButton>
                        </p>
                    </div>
                          
        </ItemTemplate>
                 </asp:DataList>
        </div> 
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
                    const monthNames = [
                        "January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"
                    ];
                    const currentMonth = new Date().toLocaleDateString('en-US', { month: 'long' });

                    document.getElementById('month').textContent = currentMonth;
                </script>


	<!-- end shop banner -->


<%--	<!-- cart banner section -->
	<section class="cart-banner pt-100 pb-100">
    	<div class="container">
        	<div class="row clearfix">
            	<!--Image Column-->
            	<div class="image-column col-lg-6">
                	<div class="image">
                    	<div class="price-box">
                        	<div class="inner-price">
                                <span class="price">
                                    <strong>30%</strong> <br> off per kg
                                </span>
                            </div>
                        </div>
                    	<img src="assets/img/a.jpg" alt="">
                    </div>
                </div>
                <!--Content Column-->
                <div class="content-column col-lg-6">
					<h3><span class="orange-text">Deal</span> of the month</h3>
                    <h4>Hikan Strwaberry</h4>
                    <div class="text">Quisquam minus maiores repudiandae nobis, minima saepe id, fugit ullam similique! Beatae, minima quisquam molestias facere ea. Perspiciatis unde omnis iste natus error sit voluptatem accusant</div>
                    <!--Countdown Timer-->
                    <div class="time-counter"><div class="time-countdown clearfix" data-countdown="2020/2/01"><div class="counter-column"><div class="inner"><span class="count">00</span>Days</div></div> <div class="counter-column"><div class="inner"><span class="count">00</span>Hours</div></div>  <div class="counter-column"><div class="inner"><span class="count">00</span>Mins</div></div>  <div class="counter-column"><div class="inner"><span class="count">00</span>Secs</div></div></div></div>
                	<a href="cart.html" class="cart-btn mt-3"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
            </div>
        </div>
    </section>
    <!-- end cart banner section -->--%>

	<!-- testimonail-section -->
	<div class="testimonail-section mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 text-center">
                    <div class="testimonial-sliders">
                        <div class="single-testimonial-slider">
                            <div class="client-avater">
                                <img src="Images/Hardik2.jpg" alt="">
                            </div>
                            <div class="client-meta">
                                <h3>Hardik Dharaiya <span>Developer</span></h3>
                                <p class="testimonial-body">
                                    
                                </p>
                                <div class="last-icon">
                                    <i class="fas fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial-slider">
                            <div class="client-avater">
                                <img src="Images/Mohit2.jpg" alt="">
                            </div>
                            <div class="client-meta">
                                <h3>Mohit Yadav <span>Devloper</span></h3>
                                <p class="testimonial-body">
                                        

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
	
	<%--<!-- advertisement section -->
	<div class="abt-section mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="abt-bg">
                        <a href="https://www.youtube.com/watch?v=DBLlFWYcIGQ" class="video-play-btn popup-youtube"><i class="fas fa-play"></i></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="abt-text">
                        <p class="top-sub">
                            Since Year 1999</p>
                        <h2>We are <span class="orange-text">Fruitkha</span></h2>
                        <p>
                            Etiam vulputate ut augue vel sodales. In sollicitudin neque et massa porttitor vestibulum ac vel nisi. Vestibulum placerat eget dolor sit amet posuere. In ut dolor aliquet, aliquet sapien sed, interdum velit. Nam eu molestie lorem.</p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente facilis illo repellat veritatis minus, et labore minima mollitia qui ducimus.</p>
                        <a href="about.html" class="boxed-btn mt-4">know more</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end advertisement section -->--%>
	
	<%--<!-- shop banner -->
	<section class="shop-banner">
        <div class="container">
            <h3>December sale is on!
                <br>with big <span class="orange-text">Discount...</span></h3>
            <div class="sale-percent">
                <span>Sale!
                <br>Upto</span>50% <span>off</span></div>
            <a href="shop.html" class="cart-btn btn-lg">Shop Now</a>
        </div>
    </section>
	<!-- end shop banner -->--%>

<%--	<!-- latest news -->
	<div class="latest-news pt-150 pb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="section-title">
                        <h3><span class="orange-text">Our</span> News</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae optio.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-news">
                        <a href="single-news.html">
                        <div class="latest-news-bg news-bg-1">
                        </div>
                        </a>
                        <div class="news-text-box">
                            <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i>Admin</span> <span class="date"><i class="fas fa-calendar"></i>27 December, 2019</span>
                            </p>
                            <p class="excerpt">
                                Vivamus lacus enim, pulvinar vel nulla sed, scelerisque rhoncus nisi. Praesent vitae mattis nunc, egestas viverra eros.</p>
                            <a href="single-news.html" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-news">
                        <a href="single-news.html">
                        <div class="latest-news-bg news-bg-2">
                        </div>
                        </a>
                        <div class="news-text-box">
                            <h3><a href="single-news.html">A man's worth has its season, like tomato.</a></h3>
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i>Admin</span> <span class="date"><i class="fas fa-calendar"></i>27 December, 2019</span>
                            </p>
                            <p class="excerpt">
                                Vivamus lacus enim, pulvinar vel nulla sed, scelerisque rhoncus nisi. Praesent vitae mattis nunc, egestas viverra eros.</p>
                            <a href="single-news.html" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                    <div class="single-latest-news">
                        <a href="single-news.html">
                        <div class="latest-news-bg news-bg-3">
                        </div>
                        </a>
                        <div class="news-text-box">
                            <h3><a href="single-news.html">Good thoughts bear good fresh juicy fruit.</a></h3>
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i>Admin</span> <span class="date"><i class="fas fa-calendar"></i>27 December, 2019</span>
                            </p>
                            <p class="excerpt">
                                Vivamus lacus enim, pulvinar vel nulla sed, scelerisque rhoncus nisi. Praesent vitae mattis nunc, egestas viverra eros.</p>
                            <a href="single-news.html" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="news.html" class="boxed-btn">More News</a>
                </div>
            </div>
        </div>
    </div>
	<!-- end latest news -->--%>

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


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <!-- footer -->
	<div class="footer-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-box about-widget">
                        <h2 class="widget-title">About us</h2>
                        <p>
                            For so that you may at least see from where all this error of accusing pleasure and praising pain arises, I will explain the whole matter, and the very things which are.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-box get-in-touch">
                        <h2 class="widget-title">Get in Touch</h2>
                        <ul>
                            <li>Gujarat, India</li>
                            <li>support@fruitkha.com</li>
                            <li>+00 111 222 3333</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-box pages">
                        <h2 class="widget-title">Pages</h2>
                        <ul>
                            <li><a href="index.aspx">Home</a></li>
                            <li><a href="about.aspx">About</a></li>
                            <li><a href="shop.aspx">Shop</a></li>
                            <li><a href="contact.aspx">Contact</a></li>
                        </ul>
                    </div>
                </div>
				<%--<div class="col-lg-3 col-md-6">
					<div class="footer-box subscribe">
						<h2 class="widget-title">Subscribe</h2>
						<p>Subscribe to our mailing list to get the latest updates.</p>
						<form action="index.html">
							<input type="email" placeholder="Email">
							<button type="submit"><i class="fas fa-paper-plane"></i></button>
						</form>
					</div>
				</div>--%>
			</div>
        </div>
</div>
	<!-- end footer -->
	
	<!-- copyright -->
	<div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <p>
                        Copyrights &copy; 2025
                    </p>
                </div>
                <div class="col-lg-6 text-right col-md-12">
                    <div class="social-icons">
                        <ul>
                            <li><a href="https://www.instagram.com/mr.hr_gajjar?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==" target="_blank"><i class="fab fa-instagram"></i> - I</a></li>
                            <li><a href="https://www.linkedin.com/in/hardik-dharaiya-150103257" target="_blank"><i class="fab fa-linkedin"></i> - I</a></li>

                            <li><a href="https://www.instagram.com/mohitt._.ahirr90?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==" target="_blank"><i class="fab fa-instagram"></i> - II</a></li>
                            <li><a href="https://www.linkedin.com/in/mohit-ahir-3a97a9249" target="_blank"><i class="fab fa-linkedin"></i> - II</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</div>
	<!-- end copyright -->

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
                                <li><a href="shop.aspx">Shop</a>                                    
                                </li>
                                <li>
                                    <div class="header-icons">
                                        <a class="shopping-cart" href="cart.aspx"><i class="fas fa-shopping-cart"></i></a><a id="profileLink" class="profile" href="Login.aspx" runat="server"><i class="fas fa-user"></i></a>
                                    </div>
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



