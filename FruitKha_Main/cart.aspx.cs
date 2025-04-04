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


        private void LoadCart()
        {
            if (Session["Uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                int uid = Convert.ToInt32(Session["Uid"]);
                DataTable dt = c1.GetCartItems(uid);
                CartGridView.DataSource = dt;
                CartGridView.DataBind();

                // Calculate Total Amount
                decimal total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToDecimal(row["TotalPrice"]);
                }
                lblTotalAmount.Text = "Total: ₹" + total.ToString("N2");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadCart();
			}
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
                c1.PlaceOrder(uid);
                Response.Redirect("OrderConfirmation.aspx");
            }
        }
	}
}