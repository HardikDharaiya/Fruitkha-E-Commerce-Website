using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace FruitKha_Main
{
	public partial class Profile : BasePage
	{
		Class1 cs;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Check for order success message
				if (Request.QueryString["order"] == "success")
				{
					// Assuming you have a Label control lblProfileMessage on Profile.aspx
					// <asp:Label ID="lblProfileMessage" runat="server" CssClass="alert alert-success" EnableViewState="false" />
					if (FindControl("lblProfileMessage") is Label messageLabel) // Safely find control
					{
						messageLabel.Text = "Your order has been placed successfully!";
						messageLabel.Visible = true;
					}
				}

				LoadUserProfile();
				LoadOrderHistory();
			}
		}





		private void LoadUserProfile()
		{
			int uid = Convert.ToInt32(Session["Uid"]);
			cs = new Class1();
			DataTable dt = cs.GetUserProfile(uid);

			if (dt.Rows.Count > 0)
			{
				lblUsername.Text = dt.Rows[0]["UserName"].ToString();
				lblEmail.Text = dt.Rows[0]["UserEmail"].ToString();
			}
		}

		private void LoadOrderHistory()
		{
			int uid = Convert.ToInt32(Session["Uid"]);
			// cs = new Class1(); // Already instantiated
			DataTable dtOrders = cs.GetUserOrders(uid); // Gets flat list of items

			if (dtOrders.Rows.Count > 0)
			{
				var groupedOrders = GroupOrders(dtOrders); // Group the items
				rptOrders.DataSource = groupedOrders; // Bind grouped data to the Repeater
				rptOrders.DataBind();
				rptOrders.Visible = true;
				lblNoOrders.Visible = false; // Hide "no orders" message
			}
			else
			{
				rptOrders.Visible = false; // Hide repeater if no orders
				lblNoOrders.Text = "You have no past orders.";
				lblNoOrders.Visible = true; // Show "no orders" message
			}
		}


		// Method to group flat order items into logical orders
		private List<OrderDisplayGroup> GroupOrders(DataTable dtOrders)
		{
			var orderGroups = new Dictionary<string, OrderDisplayGroup>();

			foreach (DataRow row in dtOrders.Rows)
			{
				DateTime orderDate = Convert.ToDateTime(row["OrderDate"]);
				// Check for DBNull before converting. Assign -1 (or 0 if AddressID starts from 1) if NULL.
				int shippingAddressId = (row["ShippingAddressID"] == DBNull.Value) ? -1 : Convert.ToInt32(row["ShippingAddressID"]);
				// Create a unique key for grouping based on approximate time and address
				// Using Ticks for higher precision grouping than just seconds
				string groupKey = $"{orderDate.Ticks}_{shippingAddressId}";

				if (!orderGroups.ContainsKey(groupKey))
				{
					// Fetch address only once per group
					string addressHtml = cs.GetShippingAddressString(shippingAddressId);

					orderGroups[groupKey] = new OrderDisplayGroup
					{
						OrderDate = orderDate,
						ShippingAddressID = shippingAddressId,
						Status = row["Status"].ToString(),
						ShippingAddressHtml = addressHtml, // Store fetched address
						GrandTotal = 0 // Initialize total
					};
				}

				// Add item detail to the group
				orderGroups[groupKey].Items.Add(new OrderItemDetail
				{
					OrderItemID = Convert.ToInt32(row["OrderID"]),
					ItemName = row["ItemName"].ToString(),
					Quantity = Convert.ToInt32(row["Quantity"]),
					TotalPrice = Convert.ToDecimal(row["TotalPrice"])
				});

				// Update the group's total
				orderGroups[groupKey].GrandTotal += Convert.ToDecimal(row["TotalPrice"]);
			}

			// Return the grouped orders as a list, ordered by date descending
			return orderGroups.Values.OrderByDescending(o => o.OrderDate).ToList();
		}


		// Event handler for the outer Repeater to bind the inner GridView
		protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				// Find the inner GridView
				GridView gvOrderItems = (GridView)e.Item.FindControl("gvOrderItems");
				if (gvOrderItems != null)
				{
					// Get the data for the current order group
					OrderDisplayGroup orderGroup = (OrderDisplayGroup)e.Item.DataItem;

					// Bind the items list of the current group to the inner GridView
					gvOrderItems.DataSource = orderGroup.Items;
					gvOrderItems.DataBind();
				}
			}
		}




		protected void btnLogout_Click(object sender, EventArgs e)
		{
			Session.Clear();
			Session.Abandon(); // Ensure session is fully cleared
			Response.Cookies.Clear(); // Clear session cookie
									  // Clear remember me cookie if exists
			if (Request.Cookies["UserLogin"] != null)
			{
				HttpCookie userCookie = new HttpCookie("UserLogin");
				userCookie.Expires = DateTime.Now.AddDays(-1); // Expire immediately
				Response.Cookies.Add(userCookie);
			}

			Response.Redirect("Login.aspx", false); // Redirect to login
			HttpContext.Current.ApplicationInstance.CompleteRequest();
		}



		// Helper class to represent a grouped order for display
		public class OrderDisplayGroup
		{
			public DateTime OrderDate { get; set; }
			public int ShippingAddressID { get; set; }
			public string Status { get; set; }
			public decimal GrandTotal { get; set; }
			public string ShippingAddressHtml { get; set; } // Store fetched address HTML
			public List<OrderItemDetail> Items { get; set; }

			public OrderDisplayGroup()
			{
				Items = new List<OrderItemDetail>();
			}
		}

		// Helper class for items within an order
		public class OrderItemDetail
		{
			public int OrderItemID { get; set; } // Original OrderTbl.OrderID
			public string ItemName { get; set; }
			public int Quantity { get; set; }
			public decimal TotalPrice { get; set; }
		}



		// Add this method inside the Profile class in Profile.aspx.cs
		protected string GetStatusBadgeClass(string status)
		{
			switch (status?.ToLower()) // Use null-conditional operator and ToLower for robust comparison
			{
				case "pending":
					return "bg-warning text-dark"; // Yellowish background
				case "processing":
					return "bg-primary"; // Blue background
				case "shipped":
					return "bg-info text-dark"; // Cyan background
				case "delivered":
				case "completed":
					return "bg-success"; // Green background
				case "cancelled":
				case "failed":
					return "bg-danger"; // Red background
				default:
					return "bg-secondary"; // Default grey
			}
		}


	}
}