using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main
{
	public partial class checkout1 : BasePage
	{
		Class1 c1 = new Class1();
		decimal shippingCost = 50.00M; // Example fixed shipping cost
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// BasePage should handle redirect if not logged in
				if (Session["Uid"] == null)
				{
					Response.Redirect("Login.aspx", false);
					HttpContext.Current.ApplicationInstance.CompleteRequest();
					return;
				}
               
                LoadCartSummary();
				PopulateUserInfo();
			}
            UserNameTxt.Text = Session["UserName"].ToString();
        }


        private void LoadCartSummary()
        {
            if (Session["Uid"] != null)
            {
                int uid = Convert.ToInt32(Session["Uid"]);
                DataTable dt = c1.GetCartItems(uid);

                if (dt != null && dt.Rows.Count > 0)
                {
                    rptOrderSummary.DataSource = dt;
                    rptOrderSummary.DataBind();

                    decimal subtotal = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        subtotal += Convert.ToDecimal(row["TotalPrice"]);
                    }

                    lblSubtotal.Text = "₹" + subtotal.ToString("N2");
                    lblShipping.Text = "₹" + shippingCost.ToString("N2"); // Use the defined shipping cost
                    lblGrandTotal.Text = "₹" + (subtotal + shippingCost).ToString("N2");
                    btnPlaceOrder.Enabled = true; // Enable button if cart has items
                    ViewState["GrandTotal"] = subtotal + shippingCost; // Store for potential use later
                }
                else
                {
                    // Cart is empty, redirect back or disable checkout
                    lblSubtotal.Text = "₹0.00";
                    lblShipping.Text = "₹0.00";
                    lblGrandTotal.Text = "₹0.00";
                    rptOrderSummary.DataSource = null; // Clear repeater
                    rptOrderSummary.DataBind();
                    btnPlaceOrder.Enabled = false; // Disable button
                    lblMessage.Text = "Your cart is empty. Please add items before checking out.";
                    // Optional: Redirect back to cart
                    // Response.Redirect("cart.aspx", false);
                    // HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }


        private void PopulateUserInfo()
        {
            if (Session["Uid"] != null)
            {
                int uid = Convert.ToInt32(Session["Uid"]);
                DataTable dt = c1.GetUserProfile(uid); // Assumes GetUserProfile exists and works

                if (dt != null && dt.Rows.Count > 0)
                {
                    // Pre-fill if fields are empty (don't overwrite if user typed something before postback)
                    if (string.IsNullOrEmpty(NameTxt.Text))
                        NameTxt.Text = dt.Rows[0]["UserName"].ToString(); // Assuming UserName is FullName
                    if (string.IsNullOrEmpty(EmailTxt.Text))
                        EmailTxt.Text = dt.Rows[0]["UserEmail"].ToString();
                    // You might want to add fields like Phone to RegisterTbl or have a separate UserProfileTbl
                }
            }
        }




        protected void btnPlaceOrder_Click(object sender, EventArgs e)
		{
            // Re-validate on server-side
            Page.Validate();
            if (!Page.IsValid)
            {
                lblMessage.Text = "Please fill in all required address fields correctly.";
                return;
            }


            if (Session["Uid"] != null)
            {
                int uid = Convert.ToInt32(Session["Uid"]);

                // 1. Check again if cart is empty (user might have cleared it in another tab)
                DataTable dtCart = c1.GetCartItems(uid);
                if (dtCart == null || dtCart.Rows.Count == 0)
                {
                    lblMessage.Text = "Your cart is empty. Cannot place order.";
                    btnPlaceOrder.Enabled = false;
                    return;
                }


                // 2. Save Shipping Address
                int shippingAddressId = -1; // Default invalid ID
                try
                {
                    shippingAddressId = c1.SaveShippingAddress(
                        uid,
                        NameTxt.Text.Trim(),
                        EmailTxt.Text.Trim(),
                        AddressTxt.Text.Trim(),
                        AddressLine2Txt.Text.Trim(), // Pass Address Line 2
                        CityTxt.Text.Trim(),
                        StateTxt.Text.Trim(),
                        PostalCodeTxt.Text.Trim(),
                        CountryTxt.Text.Trim(),
                        PhoneTxt.Text.Trim()
                    );
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error saving shipping address. Please try again.";
                    // Log the detailed error: Log.Error("Error in SaveShippingAddress: " + ex.ToString());
                    return; // Stop processing
                }


                // 3. Place Order (if address was saved successfully)
                if (shippingAddressId > 0)
                {
                    try
                    {
                        // Pass the new AddressID to the PlaceOrder method
                        c1.PlaceOrder(uid, shippingAddressId);

                        // 4. Redirect to a confirmation page or profile
                        // Create an OrderConfirmation.aspx page later
                        Response.Redirect("Profile.aspx?order=success", false); // Or OrderConfirmation.aspx
                        HttpContext.Current.ApplicationInstance.CompleteRequest();

                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "An error occurred while placing your order. Please try again.";
                        // Log the detailed error: Log.Error("Error in PlaceOrder: " + ex.ToString());
                        // Consider rolling back address saving if possible/necessary, though less critical here.
                    }
                }
                else
                {
                    lblMessage.Text = "Failed to save shipping address. Order not placed.";
                    // Log error: Log.Error("SaveShippingAddress returned invalid ID.");
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }
	}
}