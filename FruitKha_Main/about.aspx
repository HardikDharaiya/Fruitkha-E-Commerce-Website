<%@ Page Title="" Language="C#" MasterPageFile="~/about.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="FruitKha_Main.about1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                                <li class="current-list-item"><a href="about.aspx">About</a></li>
                                <li><a href="contact.aspx">Contact</a></li>
                                <li><a href="shop.aspx">Shop</a> </li>
                                <li>
                                    <div class="header-icons">
                                        <a class="shopping-cart" href="cart.aspx"><i class="fas fa-shopping-cart"></i></a><a id="profileLink" class="profile" href="Profile.aspx" runat="server"><i class="fas fa-user"></i></a>
                                        <a class="shopping-cart" href="Profile.aspx">
                                            <asp:Label ID="UserNameTxt" runat="server" Text="Label"></asp:Label></a>
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


