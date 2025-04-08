using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main
{
	public partial class Login : System.Web.UI.Page
	{
        Class1 cs;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["UserLoggedIn"] != null && (bool)Session["UserLoggedIn"])
			{
				Response.Redirect("Index.aspx");
			}
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            cs = new Class1();
            int userID = cs.LoginCheck(username, password);

            if (userID > 0)
            {
                Session["UserLoggedIn"] = true;
                Session["Uid"] = userID; // Store the Uid in the session
                Session["UserName"] = username;

                if (chkRememberMe.Checked)
                {
                    HttpCookie userCookie = new HttpCookie("UserLogin");
                    userCookie["Uid"] = userID.ToString();
                    userCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(userCookie);
                }

                Response.Redirect("Index.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password!');</script>");
            }
        }
	}
}