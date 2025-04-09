using System;
using System.Data;
using System.Drawing; // For Color
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main.admin
{
	public partial class Users : System.Web.UI.Page
	{

		Class1 dbAccess;

		protected void Page_Load(object sender, EventArgs e)
		{
            // Check if admin is logged in
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("~/admin/Login.aspx");
            }

            dbAccess = new Class1(); // Instantiate data access class

            if (!IsPostBack)
            {
                BindGrid();
            }
        }



        private void BindGrid()
        {
            try
            {
                string filterName = txtFilterName.Text.Trim();
                string filterEmail = txtFilterEmail.Text.Trim();

                DataTable dtUsers = dbAccess.GetAllUsers(filterName, filterEmail);

                if (dtUsers.Rows.Count > 0)
                {
                    gvUsers.DataSource = dtUsers;
                    gvUsers.DataBind();
                    lblGridMessage.Text = ""; // Clear message
                    gvUsers.Visible = true;
                }
                else
                {
                    gvUsers.DataSource = null;
                    gvUsers.DataBind(); // To show EmptyDataTemplate
                    lblGridMessage.Text = "No users found matching your criteria.";
                    gvUsers.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblGridMessage.Text = "Error loading users: " + ex.Message;
                lblGridMessage.ForeColor = Color.Red;
                gvUsers.Visible = false; // Hide grid on error
            }
        }

		protected void btnFilter_Click(object sender, EventArgs e)
		{
            gvUsers.PageIndex = 0; // Reset to first page when filtering
            BindGrid();
        }

		protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
            gvUsers.PageIndex = e.NewPageIndex;
            BindGrid(); // Rebind with new page index
        }

		protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
		{
            if (e.CommandName == "DeleteUser")
            {
                try
                {
                    int userId = Convert.ToInt32(e.CommandArgument);

                    // Call the delete method
                    bool success = dbAccess.DeleteUser(userId);

                    if (success)
                    {
                        lblGridMessage.Text = $"User ID #{userId} deleted successfully!";
                        lblGridMessage.ForeColor = Color.Green;
                        // Rebind the grid to reflect the change immediately
                        BindGrid();
                    }
                    else
                    {
                        lblGridMessage.Text = $"Error deleting User ID #{userId}. User might not exist anymore.";
                        lblGridMessage.ForeColor = Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    // Catch potential errors (e.g., converting CommandArgument, DB error)
                    lblGridMessage.Text = "Error processing delete command: " + ex.Message;
                    lblGridMessage.ForeColor = Color.Red;
                }
            }
        }

		protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
		{
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the delete button
                LinkButton lnkDelete = e.Row.FindControl("lnkDelete") as LinkButton;
                if (lnkDelete != null)
                {
                    // Add the crucial confirmation dialog with cascade warning
                    lnkDelete.OnClientClick = "return confirm('WARNING: Are you sure you want to delete this user? \\n\\nDeleting this user will PERMANENTLY delete all their associated Orders and Shopping Cart items due to database cascade rules. \\n\\nThis action cannot be undone.');";
                }
            }
        }
	}
}