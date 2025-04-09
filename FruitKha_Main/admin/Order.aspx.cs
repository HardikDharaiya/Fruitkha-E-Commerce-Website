using System;
using System.Data;
using System.Drawing; // For Color
using System.Web.UI;
using System.Web.UI.WebControls; // Required for WebControls, including Image

namespace FruitKha_Main.admin
{
	public partial class Order : System.Web.UI.Page
	{

		Class1 dbAccess;

		protected void Page_Load(object sender, EventArgs e)
		{
            // Check admin login
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("~/admin/Login.aspx");
            }

            dbAccess = new Class1();

            if (!IsPostBack)
            {
                BindGrid();
            }
        }



        private void BindGrid()
        {
            try
            {
                string statusFilter = ddlFilterStatus.SelectedValue;
                DateTime? startDateFilter = null;
                DateTime? endDateFilter = null;

                // Validate and parse dates
                lblFilterMessage.Text = ""; // Clear previous errors
                if (!string.IsNullOrEmpty(txtFilterStartDate.Text))
                {
                    if (DateTime.TryParse(txtFilterStartDate.Text, out DateTime startDate))
                    {
                        startDateFilter = startDate;
                    }
                    else
                    {
                        lblFilterMessage.Text = "Invalid Start Date format.";
                        // Optional: Don't proceed with binding if date is invalid
                        // return;
                    }
                }
                if (!string.IsNullOrEmpty(txtFilterEndDate.Text))
                {
                    if (DateTime.TryParse(txtFilterEndDate.Text, out DateTime endDate))
                    {
                        endDateFilter = endDate;
                    }
                    else
                    {
                        lblFilterMessage.Text += (lblFilterMessage.Text.Length > 0 ? " " : "") + "Invalid End Date format.";
                        // Optional: Don't proceed with binding if date is invalid
                        // return;
                    }
                }


                DataTable dtOrders = dbAccess.GetAllOrders(statusFilter, startDateFilter, endDateFilter);

                if (dtOrders.Rows.Count > 0)
                {
                    gvOrders.DataSource = dtOrders;
                    gvOrders.DataBind();
                    lblGridMessage.Text = ""; // Clear message
                    gvOrders.Visible = true;
                }
                else
                {
                    gvOrders.DataSource = null;
                    gvOrders.DataBind(); // To show EmptyDataTemplate
                    lblGridMessage.Text = "No orders found matching your criteria.";
                    gvOrders.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblGridMessage.Text = "Error loading orders: " + ex.Message;
                lblGridMessage.ForeColor = Color.Red;
                gvOrders.Visible = false;
            }
        }

		protected void btnFilter_Click(object sender, EventArgs e)
		{
            gvOrders.PageIndex = 0; // Reset to first page when filtering
            BindGrid();
        }

		protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
            gvOrders.PageIndex = e.NewPageIndex;
            BindGrid(); // Rebind with new page index
        }

		protected void gvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
		{
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Set the selected value for the status dropdown
                DropDownList ddlStatus = e.Row.FindControl("ddlStatus") as DropDownList;
                if (ddlStatus != null)
                {
                    string currentStatus = DataBinder.Eval(e.Row.DataItem, "Status") as string;
                    // Ensure the value exists in the dropdown before setting it
                    ListItem item = ddlStatus.Items.FindByValue(currentStatus);
                    if (item != null)
                    {
                        ddlStatus.SelectedValue = currentStatus;
                    }
                    // Optional: Handle cases where status from DB isn't in the dropdown list
                    // else { // Add the status or select a default }
                }

                // Set Item Image URL (using Option 2 logic - path stored in DB)
                System.Web.UI.WebControls.Image imgItem = e.Row.FindControl("imgItem") as System.Web.UI.WebControls.Image;
                if (imgItem != null)
                {
                    string dbImagePath = DataBinder.Eval(e.Row.DataItem, "ItemImage") as string;
                    if (!string.IsNullOrEmpty(dbImagePath))
                    {
                        string pathForResolve = dbImagePath;
                        if (!pathForResolve.StartsWith("/") && !pathForResolve.StartsWith("~"))
                        {
                            pathForResolve = "~/" + pathForResolve;
                        }
                        imgItem.ImageUrl = ResolveUrl(pathForResolve);
                        imgItem.ToolTip = dbImagePath; // Show path on hover
                    }
                    else
                    {
                        imgItem.ImageUrl = ResolveUrl("~/assets/img/placeholder.png"); // Placeholder
                        imgItem.ToolTip = "No image available";
                    }
                }

                // Set Shipping Address String
                Literal litShippingAddress = e.Row.FindControl("litShippingAddress") as Literal;
                if (litShippingAddress != null)
                {
                    // Check if ShippingAddressID is present and not DBNull
                    object shippingIdObj = DataBinder.Eval(e.Row.DataItem, "ShippingAddressID");
                    if (shippingIdObj != null && shippingIdObj != DBNull.Value)
                    {
                        int shippingAddressID = Convert.ToInt32(shippingIdObj);
                        try
                        {
                            // Call the method from Class1 to get the formatted address
                            litShippingAddress.Text = dbAccess.GetShippingAddressString(shippingAddressID);
                        }
                        catch (Exception ex)
                        {
                            // Handle potential errors from GetShippingAddressString
                            litShippingAddress.Text = $"<span class='text-danger'>Error loading address (ID: {shippingAddressID}): {ex.Message}</span>";
                        }
                    }
                    else
                    {
                        litShippingAddress.Text = "<span class='text-muted'>No Shipping Address Provided</span>";
                    }

                }
            }
        }

		protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
		{
            if (e.CommandName == "UpdateStatus")
            {
                try
                {
                    int orderID = Convert.ToInt32(e.CommandArgument);

                    // Find the dropdownlist *within the specific row* that triggered the command
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    DropDownList ddlStatusInRow = row.FindControl("ddlStatus") as DropDownList;

                    if (ddlStatusInRow != null)
                    {
                        string newStatus = ddlStatusInRow.SelectedValue;

                        // Call the update method
                        bool success = dbAccess.UpdateOrderStatus(orderID, newStatus);

                        if (success)
                        {
                            lblGridMessage.Text = $"Order #{orderID} status updated to '{newStatus}' successfully!";
                            lblGridMessage.ForeColor = Color.Green;
                            // Rebind the grid to reflect the change immediately
                            // Note: If using AJAX UpdatePanel, only update the panel
                            BindGrid();
                        }
                        else
                        {
                            lblGridMessage.Text = $"Error updating status for Order #{orderID}.";
                            lblGridMessage.ForeColor = Color.Red;
                        }
                    }
                    else
                    {
                        lblGridMessage.Text = "Could not find status dropdown for update.";
                        lblGridMessage.ForeColor = Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblGridMessage.Text = "Error processing update: " + ex.Message;
                    lblGridMessage.ForeColor = Color.Red;
                }
            }
        }





	}
}