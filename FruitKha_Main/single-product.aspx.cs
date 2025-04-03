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
			display();
			string tempId = Request.QueryString["ItemID"];

			c1 = new Class1();
			da = new SqlDataAdapter("SELECT * FROM ItemTbl WHERE ItemID='"+tempId+"';", c1.GetConnection());

			ds = new DataSet();
			da.Fill(ds);

			DataList1.DataSource = ds;
			DataList1.DataBind();


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

		protected void ImageButton1_Command(object sender, CommandEventArgs e)
		{
			String tempID = e.CommandArgument.ToString();
			Response.Redirect($"single-product.aspx?ItemId={tempID}");
		}
	}
}