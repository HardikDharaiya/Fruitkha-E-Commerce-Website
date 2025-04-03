using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main.admin
{
	public partial class Logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            Session["AdminLoggedIn"] = null;
            Session["AdminEmail"] = null;
            Session.Abandon();

            if (Request.Cookies["AdminLogin"] != null)
            {
                HttpCookie adminCookie = new HttpCookie("AdminLogin");
                adminCookie.Expires = DateTime.Now.AddDays(-1); 
                Response.Cookies.Add(adminCookie);
            }

            Response.Redirect("Login.aspx");

        }
    }
}