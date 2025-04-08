using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace FruitKha_Main
{
	public partial class cart1 : BasePage
	{
        Class1 c1 = new Class1();


        private void LoadCart() // Ensure LoadCart handles empty results gracefully
        {
            if (Session["Uid"] == null)
            {
                // BasePage should handle redirect, but double-check
                Response.Redirect("Login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
                return;
            }

            int uid = Convert.ToInt32(Session["Uid"]);
            DataTable dt = c1.GetCartItems(uid);
            CartGridView.DataSource = dt;
            CartGridView.DataBind();

            // Calculate Total Amount
            decimal total = 0;
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToDecimal(row["TotalPrice"]);
                }
                lblTotalAmount.Text = "Total: ₹" + total.ToString("N2");
                btnCheckout.Enabled = true; // Enable checkout button if cart has items
            }
            else
            {
                lblTotalAmount.Text = "Your cart is empty.";
                btnCheckout.Enabled = false; // Disable checkout button if cart is empty
            }
        }

        protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadCart();
                
            }
            UserNameTxt.Text = Session["UserName"].ToString();
        }

		protected void CartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
            if (e.RowIndex < 0 || e.RowIndex >= CartGridView.DataKeys.Count)
            {
                return; // Prevent out-of-range error
            }

            int cartID = Convert.ToInt32(CartGridView.DataKeys[e.RowIndex].Value);
            c1.RemoveCartItem(cartID);
            LoadCart();
        }

		protected void btnCheckout_Click(object sender, EventArgs e)
		{
            if (Session["Uid"] != null)
            {
                int uid = Convert.ToInt32(Session["Uid"]);

                // --- START: Changes ---
                // Check if the cart has items before proceeding
                DataTable cartItems = c1.GetCartItems(uid);
                if (cartItems != null && cartItems.Rows.Count > 0)
                {
                    // Redirect to the checkout page
                    Response.Redirect("checkout.aspx", false); // Use false to stop current execution
                    HttpContext.Current.ApplicationInstance.CompleteRequest(); // Recommended after Response.Redirect
                }
                else
                {
                    // Optionally show a message if the cart is empty
                    // Example: ScriptManager.RegisterStartupScript(this, GetType(), "EmptyCart", "alert('Your cart is empty.');", true);
                    // Or simply do nothing and stay on the cart page
                    lblTotalAmount.Text = "Your cart is empty."; // Update the label
                }
                // --- END: Changes ---

                // --- REMOVE THIS LINE ---
                // c1.PlaceOrder(uid);
                // --- REMOVE THIS LINE ---
            }
            else
            {
                Response.Redirect("Login.aspx"); // Should be handled by BasePage, but good failsafe
            }
        }
	}
}