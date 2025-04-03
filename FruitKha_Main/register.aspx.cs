using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main
{
	public partial class register : System.Web.UI.Page
	{


        Class1 cs;

		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

       public void empty()
		{
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
		}

		protected void btnRegister_Click(object sender, EventArgs e)
		{
            if (!Page.IsValid) return; 

            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();


            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                Response.Write("<script>alert('All fields are required!');</script>");

                return;
            }
            else
			{
                if (password != confirmPassword)
                {
                    Response.Write("<script>alert('Passwords do not match!');</script>");
                    return;
                }
                else
				{
                    cs = new Class1();

                    int i = cs.VerifyRegister(username, email);

                    if(i>0)
					{
                        Response.Write("<script>alert('Username or email address is already registered!');</script>");
                        return;
                    }
                    else
					{
                        cs.RegisterUserInsert(username, email, password);
                        cs = null;
                        empty();

                        Response.Redirect("Login.aspx");
                    }

                }

              
            }

           
        }
	}
}