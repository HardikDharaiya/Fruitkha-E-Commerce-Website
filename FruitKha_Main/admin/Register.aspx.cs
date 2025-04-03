using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main.admin
{
	public partial class Register : System.Web.UI.Page
	{
		Class1 cs;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                Response.Write("<script>alert('All fields are required!');</script>");
                return;
            }

            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            cs = new Class1();
            int i = cs.VerifyAdmin(email);

            if (i > 0)
            {
                Response.Write("<script>alert('Email is already registered!');</script>");
                return;
            }
            else
            {
                cs.AdminRegister(name, email, password);
                Response.Redirect("Login.aspx");
            }
        }
    }
}