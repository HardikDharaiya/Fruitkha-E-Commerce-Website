<%@ Page Title="" Language="C#" MasterPageFile="~/single-product.Master" AutoEventWireup="true" CodeBehind="single-product.aspx.cs" enableEventValidation="false" Inherits="FruitKha_Main.single_product1" %>
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
                            See more Details</p>
                        <h1>Single Product</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end breadcrumb section -->


    <div class="single-product mt-150 mb-150">
        <div class="container">
   
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>

             <!-- single product -->
	
            <div class="row">
                <div class="col-md-5">
                    <div class="single-product-img">
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ItemImage") %>' />
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="single-product-content">
                        <h3><asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label></h3>
                        <p class="single-product-pricing">
                            <asp:Label ID="Label2" runat="server" Text="Per" Style="display:inline;"></asp:Label>  
                             
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("ItemMeasurement") %>' Style="display:inline;"></asp:Label>
                         </p>
                           
                          <h3 style="display:inline;"><asp:Label ID="Label3" runat="server" Style="display:inline;" Text="₹"></asp:Label>
                             <asp:Label ID="Label7" class="product-price" runat="server" Text='<%# Eval("ItemPrice") %>'></asp:Label></h3>
                                               
                        <p>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ItemDescription") %>'></asp:Label></p>
                        <div class="single-product-form">
                          <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" text="1" EnableViewState="true"/>
                            <asp:LinkButton ID="Button1" runat="server" class="cart-btn" CommandArgument='<%# Eval("ItemID") %>' CommandName="AddToCart"><i class="fas fa-shopping-cart"></i>Add To Cart</asp:LinkButton>
                            <p>
                                <br /><strong>Categories: </strong><asp:Label ID="Label5" runat="server" Text='<%# Eval("ItemCategory") %>'></asp:Label></p>
                        </div>
                        
                    </div>
                </div>
            </div>
   
	<!-- end single product -->
            
        </ItemTemplate>
                 </asp:DataList>

             </div>
    </div>


	
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
    <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal">
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
                            <asp:LinkButton ID="Button1" runat="server" class="cart-btn" CommandArgument='<%# Eval("ItemID") %>' href="cart.aspx"><i class="fas fa-shopping-cart"></i>Add To Cart</asp:LinkButton>
                        </p>
                    </div>
                          
        </ItemTemplate>
                 </asp:DataList>
        </div> 
                   </div>
    </div>


	<!-- end product section -->

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
                                <li><a href="index.aspx">Home</a></li>
                                <li><a href="about.aspx">About</a></li>
                                <li><a href="contact.aspx">Contact</a></li>
                                <li class="current-list-item"><a href="shop.aspx">Shop</a> </li>
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


