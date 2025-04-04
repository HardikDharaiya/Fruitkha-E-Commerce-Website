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
			cs = new Class1();
			gvOrders.DataSource = cs.GetUserOrders(uid);
			gvOrders.DataBind();
		}

		protected void btnLogout_Click(object sender, EventArgs e)
		{
			Session.Clear();
			Response.Redirect("Login.aspx");
		}
	}
}