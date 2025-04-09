using System;
using System.Data;
using System.IO;      // Required for file operations
using System.Web.UI;
using System.Web.UI.WebControls; // Namespace for WebControls.Image
using System.Drawing;



namespace FruitKha_Main.admin
{
    public partial class Item : System.Web.UI.Page
    {
        Class1 dbAccess; // Use your data access class
        // Note: imageFolderPath is mainly used for *saving* now, not constructing display URLs
        private string imageSaveFolderPath = "~/Images/";
        private string imageFolderName = "Images"; // Folder name part for constructing DB path
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
                ClearForm();
            }
        }


        private void BindGrid()
        {
            try
            {
                string filterName = txtFilterName.Text.Trim();
                string filterCategory = ddlFilterCategory.SelectedValue;

                DataTable dtItems = dbAccess.GetAllItems(filterName, filterCategory);

                if (dtItems.Rows.Count > 0)
                {
                    gvItems.DataSource = dtItems;
                    gvItems.DataBind();
                    lblGridMessage.Text = "";
                    gvItems.Visible = true;
                }
                else
                {
                    gvItems.DataSource = null;
                    gvItems.DataBind(); // Bind null to show EmptyDataTemplate
                    lblGridMessage.Text = "No items found matching your criteria.";
                    gvItems.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblGridMessage.Text = "Error loading items: " + ex.Message;
                lblGridMessage.ForeColor = Color.Red;
                gvItems.Visible = false; // Hide grid on error
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           

            try
            {
                string itemName = txtItemName.Text.Trim();
                string itemMeasurement = txtItemMeasurement.Text.Trim();
                decimal itemPrice = decimal.Parse(txtItemPrice.Text);
                string itemDescription = txtItemDescription.Text.Trim();
                string itemCategory = txtItemCategory.Text.Trim();

                // --- START: Modified Image Handling for Option 2 ---
                string dbImagePath = null;       // Path to store in DB (e.g., "Images/guid.jpg")
                string oldDbImagePath = null;    // Old path from DB for deletion comparison
                string itemImageFileName = null; // Just the filename (e.g., "guid.jpg")

                bool isUpdate = !string.IsNullOrEmpty(hfItemID.Value);

                if (fuItemImage.HasFile)
                {
                    // Validation
                    string fileExtension = Path.GetExtension(fuItemImage.FileName).ToLower();
                    string[] allowedExtensions = { ".png", ".jpg", ".jpeg", ".gif" };
                    if (Array.IndexOf(allowedExtensions, fileExtension) == -1)
                    {
                        lblFormMessage.Text = "Invalid file type. Only PNG, JPG, JPEG, GIF are allowed.";
                        lblFormMessage.ForeColor = Color.Red;
                        return;
                    }

                    // Generate unique filename
                    itemImageFileName = Guid.NewGuid().ToString() + fileExtension;
                    // Construct the path to store in DB
                    dbImagePath = imageFolderName + "/" + itemImageFileName; // e.g., "Images/guid.jpg"

                    // Get full physical path for saving
                    string physicalSavePath = Server.MapPath(imageSaveFolderPath) + itemImageFileName;

                    // Ensure directory exists
                    string physicalDir = Server.MapPath(imageSaveFolderPath);
                    if (!Directory.Exists(physicalDir))
                    {
                        Directory.CreateDirectory(physicalDir);
                    }

                    // Save the file
                    fuItemImage.SaveAs(physicalSavePath);

                    // If updating, get the OLD path stored in DB
                    if (isUpdate)
                    {
                        oldDbImagePath = dbAccess.GetItemImagePath(int.Parse(hfItemID.Value));
                    }
                }
                else if (!isUpdate) // Image is required only when adding
                {
                    // This should be caught by cvImageRequiredOnAdd, but safeguard
                    lblFormMessage.Text = "Please select an image file for the new item.";
                    lblFormMessage.ForeColor = Color.Red;
                    return;
                }
                // --- END: Modified Image Handling ---

                // --- START: Modified DB Operations ---
                if (isUpdate) // Update Existing Item
                {
                    int itemID = int.Parse(hfItemID.Value);
                    // Pass the dbImagePath ("Images/guid.jpg" or null if no new image)
                    bool success = dbAccess.UpdateItem(itemID, itemName, itemMeasurement, itemPrice, itemDescription, itemCategory, dbImagePath);

                    if (success)
                    {
                        lblFormMessage.Text = "Item updated successfully!";
                        lblFormMessage.ForeColor = Color.Green;

                        // Delete the old image file *if* a new one was uploaded (dbImagePath != null)
                        // AND the old path existed (oldDbImagePath != null)
                        // AND the paths are different
                        if (!string.IsNullOrEmpty(dbImagePath) && !string.IsNullOrEmpty(oldDbImagePath) && dbImagePath != oldDbImagePath)
                        {
                            try
                            {
                                // Construct physical path from the OLD DB path
                                string oldPhysicalPath = Server.MapPath("~/" + oldDbImagePath);
                                if (File.Exists(oldPhysicalPath))
                                {
                                    File.Delete(oldPhysicalPath);
                                }
                            }
                            catch (IOException ioEx)
                            {
                                // Log this error - couldn't delete old file
                                // lblFormMessage.Text += " (Warning: Could not delete old image: " + ioEx.Message + ")";
                            }
                        }
                        ClearForm();
                        BindGrid(); // Refresh the grid
                    }
                    else
                    {
                        lblFormMessage.Text = "Error updating item.";
                        lblFormMessage.ForeColor = Color.Red;
                        // Consider deleting the newly uploaded image if update failed
                        if (!string.IsNullOrEmpty(dbImagePath))
                        {
                            try { File.Delete(Server.MapPath("~/" + dbImagePath)); } catch { }
                        }
                    }
                }
                else // Add New Item
                {
                    // dbImagePath MUST have a value here due to earlier checks/validation
                    if (string.IsNullOrEmpty(dbImagePath))
                    {
                        lblFormMessage.Text = "Image is required for new items. Error code: S2."; // Internal check
                        lblFormMessage.ForeColor = Color.Red;
                        return;
                    }

                    // Pass the full relative path ("Images/guid.jpg")
                    int newItemID = dbAccess.InsertItem(itemName, itemMeasurement, itemPrice, itemDescription, itemCategory, dbImagePath);

                    if (newItemID > 0) // Success
                    {
                        lblFormMessage.Text = "Item added successfully!";
                        lblFormMessage.ForeColor = Color.Green;
                        ClearForm();
                        BindGrid();
                    }
                    else // Failure
                    {
                        lblFormMessage.Text = "Error adding item.";
                        lblFormMessage.ForeColor = Color.Red;
                        // Delete the uploaded image if DB insert failed
                        if (!string.IsNullOrEmpty(dbImagePath))
                        {
                            try { File.Delete(Server.MapPath("~/" + dbImagePath)); } catch { }
                        }
                    }
                }
                // --- END: Modified DB Operations ---
            }
            catch (Exception ex)
            {
                lblFormMessage.Text = "An error occurred: " + ex.Message;
                lblFormMessage.ForeColor = Color.Red;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            gvItems.PageIndex = 0; // Reset to first page on filter
            BindGrid();
        }

        protected void gvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gvItems.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditItem")
            {
                try
                {
                    int itemID = Convert.ToInt32(e.CommandArgument);
                    DataTable dtItem = dbAccess.GetItemByID(itemID);

                    if (dtItem.Rows.Count > 0)
                    {
                        DataRow row = dtItem.Rows[0];
                        hfItemID.Value = row["ItemID"].ToString();
                        txtItemName.Text = row["ItemName"].ToString();
                        txtItemMeasurement.Text = row["ItemMeasurement"].ToString();
                        txtItemPrice.Text = Convert.ToDecimal(row["ItemPrice"]).ToString("F2");
                        txtItemDescription.Text = row["ItemDescription"].ToString();
                        txtItemCategory.Text = row["ItemCategory"].ToString();

                        // --- START: Modified Edit Display ---
                        // Display current image info (using the path stored in DB)
                        string currentDbImagePath = row["ItemImage"].ToString();
                        if (!string.IsNullOrEmpty(currentDbImagePath))
                        {
                            // Display the path stored in DB
                            lblCurrentImage.Text = "Current Image Path: " + currentDbImagePath;
                        }
                        else
                        {
                            lblCurrentImage.Text = "No current image.";
                        }
                        // --- END: Modified Edit Display ---

                        btnSave.Text = "Update Item";
                        litFormTitle.Text = "Edit Item";
                        lblFormMessage.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblFormMessage.Text = "Error loading item for edit: " + ex.Message;
                    lblFormMessage.ForeColor = Color.Red;
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                try
                {
                    int itemID = Convert.ToInt32(e.CommandArgument);

                    // Get the full relative image path from DB before deleting the record
                    string imageToDeletePath = dbAccess.GetItemImagePath(itemID);

                    // Delete the database record
                    bool success = dbAccess.DeleteItem(itemID);

                    if (success)
                    {
                        // Try to delete the image file using the path obtained BEFORE DB delete
                        if (!string.IsNullOrEmpty(imageToDeletePath))
                        {
                            try
                            {
                                // --- START: Modified Delete Path ---
                                // Construct full physical path from the DB path
                                string physicalPathToDelete = Server.MapPath("~/" + imageToDeletePath);
                                // --- END: Modified Delete Path ---
                                if (File.Exists(physicalPathToDelete))
                                {
                                    File.Delete(physicalPathToDelete);
                                }
                            }
                            catch (IOException ioEx)
                            {
                                // Log error: couldn't delete file
                                // lblGridMessage.Text = "Item deleted, but failed to remove image file: " + ioEx.Message;
                                // lblGridMessage.ForeColor = Color.Orange;
                            }
                        }

                        lblGridMessage.Text = "Item deleted successfully!";
                        lblGridMessage.ForeColor = Color.Green;
                        BindGrid(); // Refresh grid
                    }
                    else
                    {
                        lblGridMessage.Text = "Error deleting item.";
                        lblGridMessage.ForeColor = Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    // Catch potential errors during DB delete or file delete
                    lblGridMessage.Text = "Error during deletion: " + ex.Message;
                    lblGridMessage.ForeColor = Color.Red;
                }

                // Clear form if the deleted item was the one being edited
                if (hfItemID.Value == e.CommandArgument.ToString())
                {
                    ClearForm();
                }
            }

        }

        protected void gvItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add confirmation to delete button
                LinkButton lnkDelete = e.Row.FindControl("lnkDelete") as LinkButton;
                if (lnkDelete != null)
                {
                    lnkDelete.OnClientClick = "return confirm('Are you sure you want to delete this item? This action cannot be undone.');";
                }

                // Set image URL
                // *** FIX: Explicitly qualify Image type ***
                System.Web.UI.WebControls.Image imgItem = e.Row.FindControl("imgItem") as System.Web.UI.WebControls.Image;
                if (imgItem != null)
                {
                    // --- START: Modified Image URL Binding ---
                    // Get the full relative path stored in the database (e.g., "Images/apple.jpg")
                    string dbImagePath = DataBinder.Eval(e.Row.DataItem, "ItemImage") as string;

                    if (!string.IsNullOrEmpty(dbImagePath))
                    {
                        // Resolve the URL directly using the path from the DB
                        // Make sure the path starts with "/" or "~/" for ResolveUrl
                        string pathForResolve = dbImagePath;
                        if (!pathForResolve.StartsWith("/") && !pathForResolve.StartsWith("~"))
                        {
                            // Prepend "~/" if it's missing (like "Images/apple.jpg")
                            pathForResolve = "~/" + pathForResolve;
                        }
                        imgItem.ImageUrl = ResolveUrl(pathForResolve);
                        imgItem.ToolTip = dbImagePath; // Show the stored path on hover
                    }
                    else
                    {
                        // Provide a placeholder image if no path exists in DB
                        imgItem.ImageUrl = ResolveUrl("~/assets/img/placeholder.png");
                        imgItem.ToolTip = "No image available";
                    }
                    // --- END: Modified Image URL Binding ---
                }
            }
        }

        protected void CvImageRequired_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(hfItemID.Value)) // Adding new item
            {
                args.IsValid = fuItemImage.HasFile;
            }
            else // Updating existing item - image not mandatory
            {
                args.IsValid = true;
            }
        }



        private void ClearForm()
        {
            hfItemID.Value = "";
            txtItemName.Text = "";
            txtItemMeasurement.Text = "";
            txtItemPrice.Text = "";
            txtItemDescription.Text = "";
            txtItemCategory.Text = "";
            // fuItemImage is not cleared automatically
            lblCurrentImage.Text = "";

            btnSave.Text = "Add Item";
            litFormTitle.Text = "Add New Item";
            lblFormMessage.Text = "";
        }
    }
}