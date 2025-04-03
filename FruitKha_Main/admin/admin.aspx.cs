using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main.admin
{
	public partial class admin1 : System.Web.UI.Page
	{
		AdminBLL adminBLL = new AdminBLL();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
			{
				Response.Redirect("Login.aspx");
			}

			if (!IsPostBack)
			{
				LoadDashboardData();
			}

		}

		private void LoadDashboardData()
		{
			lblTotalUsers.Text = adminBLL.GetTotalUsers().ToString();
			lblTotalOrders.Text = adminBLL.GetTotalOrders().ToString();
			lblTotalItems.Text = adminBLL.GetTotalItems().ToString();
		}

	}
}