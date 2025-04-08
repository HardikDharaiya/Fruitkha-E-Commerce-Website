<%@ Page Title="" Language="C#" MasterPageFile="~/contact.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="FruitKha_Main.contact1" %>
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
	<!-- end search area -->
	
	<!-- breadcrumb-section -->
	             <div class="breadcrumb-section breadcrumb-bg">
                     <div class="container">
                         <div class="row">
                             <div class="col-lg-8 offset-lg-2 text-center">
                                 <div class="breadcrumb-text">
                                     <p>
                                         Get 24/7 Support</p>
                                     <h1>Contact us</h1>
                                 </div>
                             </div>
                         </div>
                     </div>
</div>
	<!-- end breadcrumb section -->

	<!-- contact form -->
	<%--<div class="contact-from-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="form-title">
						<h2>Have you any question?</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, ratione! Laboriosam est, assumenda. Perferendis, quo alias quaerat aliquid. Corporis ipsum minus voluptate? Dolore, esse natus!</p>
					</div>
				 	<div id="form_status"></div>
					<div class="contact-form" >
						<form type="POST" id="fruitkha-contact" onSubmit="return valid_datas( this );">
							<p>
								<input type="text" placeholder="Name" name="name" id="name">
								<input type="email" placeholder="Email" name="email" id="email">
							</p>
							<p>
								<input type="tel" placeholder="Phone" name="phone" id="phone">
								<input type="text" placeholder="Subject" name="subject" id="subject">
							</p>
							<p><textarea name="message" id="message" cols="30" rows="10" placeholder="Message"></textarea></p>
							<input type="hidden" name="token" value="FsWga4&@f6aw" />
							<p><input type="submit" value="Submit"></p>
						</form>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="contact-form-wrap">
						<div class="contact-form-box">
							<h4><i class="fas fa-map"></i> Shop Address</h4>
							<p>34/8, East Hukupara <br> Gifirtok, Sadan. <br> Country Name</p>
						</div>
						<div class="contact-form-box">
							<h4><i class="far fa-clock"></i> Shop Hours</h4>
							<p>MON - FRIDAY: 8 to 9 PM <br> SAT - SUN: 10 to 8 PM </p>
						</div>
						<div class="contact-form-box">
							<h4><i class="fas fa-address-book"></i> Contact</h4>
							<p>Phone: +00 111 222 3333 <br> Email: support@fruitkha.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>--%>

				 <!-- contact form -->
                 <div class="contact-form-section">
                     <div class="container">
                         <div class="row">
            <!-- Left Section (Form) -->
                             <div class="col-lg-8 mb-5 mb-lg-0">
                                 <div class="form-title">
                                     <h2>Have you any question?</h2>
                                     <p>We'd love to hear from you! Whether you have questions about our fresh fruits, delivery options, or just want to say hello, feel free to reach out. Your satisfaction is our priority!</p>
                                 </div>
                                 <div id="form_status">
                                 </div>
                                 <div class="contact-form">
                                     <table class="contact-form-table">
                                         <tr>
                                             <th>
                                                 <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                             </th>
                                             <td>
                                                 <asp:TextBox ID="NameTxt" runat="server" CssClass="input-field"></asp:TextBox>
                                             </td>
                                         </tr>
                                         <tr>
                                             <th>
                                                 <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                                             </th>
                                             <td>
                                                 <div class="radio-list">
                                                     <asp:RadioButtonList ID="GenderRdoBtnLst" runat="server" RepeatDirection="Horizontal">
                                                         <asp:ListItem>Male</asp:ListItem>
                                                         <asp:ListItem>Female</asp:ListItem>
                                                     </asp:RadioButtonList>
                                                 </div>
                                             </td>
                                         </tr>
                                         <tr>
                                             <th>
                                                 <asp:Label ID="Label3" runat="server" Text="Hobby"></asp:Label>
                                             </th>
                                             <td>
                                                 <div class="checkbox-list">
                                                     <asp:CheckBoxList ID="HobbyChkBx" runat="server" RepeatDirection="Horizontal">
                                                         <asp:ListItem>Cricket</asp:ListItem>
                                                         <asp:ListItem>Volleyball</asp:ListItem>
                                                         <asp:ListItem>Football</asp:ListItem>
                                                     </asp:CheckBoxList>
                                                 </div>
                                             </td>
                                         </tr>
                                         <tr>
                                             <th>
                                                 <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
                                             </th>
                                             <td>
                                                 <asp:DropDownList ID="CityDrpDwnLst" runat="server" CssClass="input-field">
                                                     <asp:ListItem>:: Select City ::</asp:ListItem>
                                                     <asp:ListItem>New York</asp:ListItem>
                                                     <asp:ListItem>Monaco</asp:ListItem>
                                                     <asp:ListItem>Las Vegas</asp:ListItem>
                                                 </asp:DropDownList>
                                             </td>
                                         </tr>
                                         <tr>
                                             <th>
                                                 <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
                                             </th>
                                             <td>
                                                 <asp:TextBox ID="AddressTxt" runat="server" CssClass="input-field"></asp:TextBox>
                                             </td>
                                         </tr>
                                         <tr>
                                             <th>
                                                 <asp:Label ID="Label6" runat="server" Text="Image"></asp:Label>
                                             </th>
                                             <td>
                                                 <asp:FileUpload ID="ImageFileUpload" runat="server" CssClass="file-upload" />
                                             </td>
                                         </tr>
                                         <tr>
                                             <td colspan="2">
                                                 <asp:Button ID="SaveBtn" runat="server" Text="Save"  CssClass="submit-button" OnClick="SaveBtn_Click" />
                                             </td>
                                         </tr>
                                     </table>
                                 </div>
                             </div>

            <!-- Right Section (Address, Hours, Contact) -->
                             <%--<div class="col-lg-4">
                                 <div class="contact-form-wrap">
                                     <div class="contact-form-box">
                                         <h4><i class="fas fa-map"></i>Shop Address</h4>
                                         <p>
                                             34/8, East Hukupara
                                             <br>Gifirtok, Sadan.
                                             <br>Country Name</p>
                                     </div>
                                     <div class="contact-form-box">
                                         <h4><i class="far fa-clock"></i>Shop Hours</h4>
                                         <p>
                                             MON - FRIDAY: 8 to 9 PM
                                             <br>SAT - SUN: 10 to 8 PM
                                         </p>
                                     </div>
                                     <div class="contact-form-box">
                                         <h4><i class="fas fa-address-book"></i>Contact</h4>
                                         <p>
                                             Phone: +00 111 222 3333
                                             <br>Email: support@fruitkha.com</p>
                                     </div>
                                 </div>
                             </div>--%>

                             <!-- Right Section (Address, Hours, Contact) -->
                             <div class="col-lg-4">
                                 <div class="contact-form-wrap">
        <!-- Shop Address -->
                                     <div class="contact-form-box">
                                         <h4><i class="fas fa-map"></i>Shop Address</h4>
                                         <p>
                                             34/8, East Hukupara<br>Gifirtok, Sadan.<br>Country Name
                                         </p>
                                     </div>

        <!-- Shop Hours -->
                                     <div class="contact-form-box">
                                         <h4><i class="far fa-clock"></i>Shop Hours</h4>
                                         <p>
                                             MON - FRIDAY: 8 AM to 9 PM<br>SAT - SUN: 10 AM to 8 PM
                                         </p>
                                     </div>

        <!-- Contact Info -->
                                     <div class="contact-form-box">
                                         <h4><i class="fas fa-address-book"></i>Contact</h4>
                                         <p>
                                             Phone: +00 111 222 3333<br>Email: support@fruitkha.com
                                         </p>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
</div>
<!-- end contact form -->

     <br />
    <center>
                <div id="GridViewDiv">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" OnRowCommand="GridView1_RowCommand" >
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hobby1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Hobby1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hobby2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Hobby2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hobby3">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Hobby3") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" Height="50" Width="50" runat="server" ImageUrl='<%# Eval("Image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EDIT" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DELETE" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="cmd_delete">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
        </center>

	<!-- end contact form -->

	<!-- find our location -->
	             <div class="find-location blue-bg">
                     <div class="container">
                         <div class="row">
                             <div class="col-lg-12 text-center">
                                 <p>
                                     <i class="fas fa-map-marker-alt"></i>Find Our Location</p>
                             </div>
                         </div>
                     </div>
</div>
	<!-- end find our location -->

	<!-- google map section -->
	             <div class="embed-responsive embed-responsive-21by9">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3692.9911006587868!2d70.89784917397368!3d22.24041644506596!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1743596604843!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
	<!-- end google map section -->

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
                                <li class="current-list-item"><a href="contact.aspx">Contact</a></li>
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



