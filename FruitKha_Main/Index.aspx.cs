using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace FruitKha_Main
{
	public partial class Index1 : BasePage
	{
		SqlConnection con;
		SqlDataAdapter da;
		SqlCommand cmd;
		DataSet ds;
		String fnm, h1, h2, h3;
		String[] hb = new String[3];
		Class1 c1;

		PagedDataSource pg;

		protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
		{
			
		}

		protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		protected void ImageButton1_Command(object sender, CommandEventArgs e)
		{
			String tempID = e.CommandArgument.ToString();
			Response.Redirect($"single-product.aspx?ItemId={tempID}");
		}

		int i, row;

		protected void Button1_Command(object sender, CommandEventArgs e)
		{
			int uid = Convert.ToInt32(Session["Uid"]); // Get logged-in user ID
			int itemId = Convert.ToInt32(e.CommandArgument); // Get ItemID from CommandArgument
			int quantity = 1; // Default quantity for now

			// Get Item Price from DB
			Class1 c1 = new Class1();
			SqlConnection con = c1.GetConnection();
			SqlCommand cmd = new SqlCommand("SELECT ItemPrice FROM ItemTbl WHERE ItemID=@ItemID", con);
			cmd.Parameters.AddWithValue("@ItemID", itemId);
			object result = cmd.ExecuteScalar();
			con.Close();

			if (result != null)
			{
				decimal itemPrice = Convert.ToDecimal(result);
				decimal totalPrice = itemPrice * quantity;

				// Call method to insert into AddToCartTbl
				c1.AddToCart(uid, itemId, quantity, totalPrice);

				// Redirect to cart page
				Response.Redirect("cart.aspx");
			}
		}

		public void display()
		{
			c1 = new Class1();
			da = new SqlDataAdapter("SELECT * FROM ItemTbl;", c1.GetConnection());


			ds = new DataSet();
			da.Fill(ds);

			row = ds.Tables[0].Rows.Count;
			pg = new PagedDataSource();

			pg.AllowPaging = true;
			pg.PageSize = 3;
			pg.DataSource = ds.Tables[0].DefaultView;
			DataList1.DataSource = pg;
			DataList1.DataBind();

		}

		private bool IsUserLoggedIn()
		{
			return Session["UserLoggedIn"] is bool userLoggedIn && userLoggedIn;
		}
		protected void Page_Load(object sender, EventArgs e)
		{		
			display();			
		}
	}
}