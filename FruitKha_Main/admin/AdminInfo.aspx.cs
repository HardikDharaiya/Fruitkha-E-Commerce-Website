using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace FruitKha_Main.admin
{
	public partial class AdminInfo : System.Web.UI.Page
	{
		Class1 cs;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["AdminEmail"] == null)
			{
				Response.Redirect("Login.aspx"); // Redirect if not logged in
			}

			if (!IsPostBack)
			{
				LoadAdminProfile();
			}
		}

        private void LoadAdminProfile()
        {
            cs = new Class1();
            DataTable dt = cs.GetAdminProfile(Session["AdminEmail"].ToString());

            if (dt.Rows.Count > 0)
            {
                txtAdminName.Text = dt.Rows[0]["AdminName"].ToString();
                txtAdminEmail.Text = dt.Rows[0]["AdminEmail"].ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string adminEmail = Session["AdminEmail"].ToString();
            string newName = txtAdminName.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (newPassword != "" && newPassword != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            cs = new Class1();
            bool success = cs.UpdateAdminProfile(adminEmail, newName, newPassword);

            if (success)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Profile Updated Successfully!";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error updating profile!";
            }
        }
    }
}