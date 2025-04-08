using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Data;


namespace FruitKha_Main
{
	public partial class single_product1 : BasePage
	{
		SqlConnection con;
		SqlDataAdapter da;
		SqlCommand cmd;
		DataSet ds;
		String[] hb = new String[3];
		Class1 c1;
		int i, row;
		PagedDataSource pg;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				display();

				string tempId = Request.QueryString["ItemID"];
				c1 = new Class1();
				da = new SqlDataAdapter("SELECT * FROM ItemTbl WHERE ItemID='" + tempId + "';", c1.GetConnection());

				ds = new DataSet();
				da.Fill(ds);

				DataList1.DataSource = ds;
				DataList1.DataBind();
			}
			UserNameTxt.Text = Session["UserName"].ToString();

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
			DataList2.DataSource = pg;
			DataList2.DataBind();




		}

		protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
		{

		}

		protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
		{
			if (e.CommandName == "AddToCart")
			{
				int itemID = Convert.ToInt32(e.CommandArgument);

				// Correct way to find the quantity textbox
				TextBox txtQty = (TextBox)e.Item.FindControl("txtQuantity");
				int quantity = 1;

				if (txtQty != null && !string.IsNullOrEmpty(txtQty.Text))
				{
					quantity = Convert.ToInt32(txtQty.Text); // This value must be 50 if you entered it
				}

				// Get price from DB
				decimal price = GetPriceByItemID(itemID); // You should define this method
				decimal total = quantity * price;

				c1 = new Class1();
				SqlConnection con = c1.GetConnection();
				string query = "INSERT INTO AddToCartTbl (Uid, ItemID, Quantity, TotalPrice, DateAdded) VALUES (@Uid, @ItemID, @Quantity, @TotalPrice, @DateAdded)";
				SqlCommand cmd = new SqlCommand(query, con);
				cmd.Parameters.AddWithValue("@Uid", Session["Uid"]); // assuming Uid is stored in Session
				cmd.Parameters.AddWithValue("@ItemID", itemID);
				cmd.Parameters.AddWithValue("@Quantity", quantity);
				cmd.Parameters.AddWithValue("@TotalPrice", total);
				cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);

				cmd.ExecuteNonQuery();
				con.Close();

				Response.Redirect("Cart.aspx");
			}
		}

		private decimal GetPriceByItemID(int itemID)
		{
			decimal price = 0;
			c1 = new Class1();
			SqlConnection con = c1.GetConnection();
			string query = "SELECT ItemPrice FROM ItemTbl WHERE ItemID = @ItemID";
			SqlCommand cmd = new SqlCommand(query, con);
			cmd.Parameters.AddWithValue("@ItemID", itemID);
			
			SqlDataReader dr = cmd.ExecuteReader();
			if (dr.Read())
			{
				price = Convert.ToDecimal(dr["ItemPrice"]);
			}
			con.Close();
			return price;
		}




		protected void ImageButton1_Command(object sender, CommandEventArgs e)
		{
			String tempID = e.CommandArgument.ToString();
			Response.Redirect($"single-product.aspx?ItemId={tempID}");
		}
	}
}