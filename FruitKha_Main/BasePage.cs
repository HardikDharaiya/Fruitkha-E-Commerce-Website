using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace FruitKha_Main
{
	public class BasePage : Page
	{
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // Check if user is logged in
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                // Redirect to Login Page
                Response.Redirect("Login.aspx");
            }
        }
    }
}