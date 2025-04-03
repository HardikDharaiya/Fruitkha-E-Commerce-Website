using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main.admin
{
	public partial class Login : System.Web.UI.Page
	{

        Class1 cs;

        protected void Page_Load(object sender, EventArgs e)
		{          
            if (Session["AdminLoggedIn"] != null && (bool)Session["AdminLoggedIn"])
			{
				Response.Redirect("admin.aspx");
			}
		}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            cs = new Class1();
            int i = cs.AdminLoginCheck(email, password);

            if (i > 0)
            {
                Session["AdminLoggedIn"] = true;
                Session["AdminEmail"] = email;

                if (chkRememberMe.Checked)
                {
                    HttpCookie adminCookie = new HttpCookie("AdminLogin");
                    adminCookie["AdminEmail"] = email;
                    adminCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(adminCookie);
                }

                Response.Redirect("admin.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Email or Password!');</script>");
            }
        }

    }
}