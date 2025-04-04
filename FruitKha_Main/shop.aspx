<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/shop.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="FruitKha_Main.shop1" %>
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
                        <h1>Shop</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end breadcrumb section -->
      <div class="col-lg-4 col-md-6 text-center">
          <div class="row product-lists">
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
        <ItemTemplate>
           
                   <div class="single-product-item">
                        <div class="product-image">                           
                            <asp:ImageButton class="product-image"  Height="350px" Width="350px" OnClick="ImageButton1_Click" ID="ImageButton1" runat="server" ImageUrl='<%# Eval("ItemImage") %>' CommandArgument='<%# Eval("ItemID") %>' OnCommand="ImageButton1_Command" />                           
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
                            <p>
                            </p>
                        </p>
                    </div>
              
                    
                          
        </ItemTemplate>
                 </asp:DataList>

              </div>
          <div class="row">
    <div class="col-lg-12 text-center">
        <div class="pagination-wrap" style="display: flex; justify-content: center; align-items: center;">
            <ul style="list-style-type: none; display: flex; justify-content: space-between; width: 100%; max-width: 600px; padding: 0; margin: 0;">
                <li><a><asp:Button ID="PrevBtn" runat="server" style="text-decoration: none;" Text="Prev" OnClick="PrevBtn_Click" /></a></li>
                <li><a><asp:Button ID="NextBtn" runat="server" style="text-decoration: none;" Text="Next" OnClick="NextBtn_Click" /></a></li>
            </ul>
        </div>
    </div>
</div>
          
        </div> 

	<!-- products -->
	
        

            
  
	<!-- end products -->

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

