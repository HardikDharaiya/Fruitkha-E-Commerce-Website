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