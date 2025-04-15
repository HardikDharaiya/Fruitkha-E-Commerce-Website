using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main
{
    public partial class Index1 : BasePage
    {
        Class1 c1;

        protected void Page_Load(object sender, EventArgs e)
        {
            c1 = new Class1();
            UpdateProfileLink();
            if (!IsPostBack)
            {
                BindProducts(); // Renamed display() to BindProducts()
            }
        }

        private void UpdateProfileLink()
        {
            ContentPlaceHolder iconsPlaceholder = (ContentPlaceHolder)Master.FindControl("HeaderIconsContent");
            if (iconsPlaceholder != null)
            {
                HyperLink profileLnk = (HyperLink)iconsPlaceholder.FindControl("profileLink");
                Label userNameLbl = (Label)iconsPlaceholder.FindControl("UserNameTxt");

                if (profileLnk != null && userNameLbl != null)
                {
                    if (Session["UserLoggedIn"] != null && (bool)Session["UserLoggedIn"] && Session["UserName"] != null)
                    {
                        userNameLbl.Text = Session["UserName"].ToString();
                        profileLnk.NavigateUrl = ResolveUrl("~/Profile.aspx");
                        profileLnk.ToolTip = "View Profile";
                    }
                    else
                    {
                        userNameLbl.Text = "";
                        profileLnk.NavigateUrl = ResolveUrl("~/Login.aspx");
                        profileLnk.ToolTip = "Login/Register";
                    }
                }
            }
        }

        // Modify the BindProducts method 
        public void BindProducts()
        {
            try
            {
                // *** CHANGE HERE: Call the new method to get 6 random items ***
                DataTable dtRandomProducts = c1.GetRandomItems(6);

                rptProducts.DataSource = dtRandomProducts; // Bind the random products to the Repeater
                rptProducts.DataBind();

                // Hide repeater or show message if no products found (optional, unlikely for random)
                if (dtRandomProducts.Rows.Count == 0)
                {
                    // Optional: Add a label LblNoProducts and show it
                    // LblNoProducts.Text = "No products available at this time.";
                    // LblNoProducts.Visible = true;
                    rptProducts.Visible = false;
                }
                else
                {
                    // LblNoProducts.Visible = false;
                    rptProducts.Visible = true;
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading random products: " + ex.Message);
                rptProducts.DataSource = null;
                rptProducts.DataBind();
                rptProducts.Visible = false; // Hide repeater on error
                                             // Optionally display an error message on the page using a label
                                             // lblErrorMessage.Text = "Sorry, couldn't load products at this time.";
                                             // lblErrorMessage.Visible = true;
            }
        }
        // Combined command handler for the Repeater
        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandArgument == null) return; // Exit if no command argument

            int itemId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ViewProduct")
            {
                Response.Redirect($"single-product.aspx?ItemId={itemId}");
            }
            else if (e.CommandName == "AddToCart")
            {
                if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
                {
                    Response.Redirect($"Login.aspx?ReturnUrl={Server.UrlEncode(Request.RawUrl)}");
                    return;
                }
                if (Session["Uid"] == null)
                {
                    // Handle cases where session might expire unexpectedly
                    Response.Redirect($"Login.aspx?ReturnUrl={Server.UrlEncode(Request.RawUrl)}");
                    return;
                }

                int uid = Convert.ToInt32(Session["Uid"]);
                int quantity = 1;
                decimal itemPrice = 0;

                // Get Item Price Safely
                try
                {
                    using (SqlConnection con = c1.GetConnection())
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT ItemPrice FROM ItemTbl WHERE ItemID=@ItemID", con))
                        {
                            cmd.Parameters.AddWithValue("@ItemID", itemId);
                            object result = cmd.ExecuteScalar();
                            if (result != null && result != DBNull.Value)
                            {
                                itemPrice = Convert.ToDecimal(result);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error getting price for ItemID {itemId}: {ex.Message}");
                    // Use ScriptManager for alerts if UpdatePanels are involved, otherwise Response.Write
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "priceError", "alert('Error adding item to cart. Price not found.');", true);
                    //Response.Write("<script>alert('Error adding item to cart. Price not found.');</script>");
                    return;
                }

                // Add to Cart Safely
                if (itemPrice > 0)
                {
                    decimal totalPrice = itemPrice * quantity;
                    try
                    {
                        c1.AddToCart(uid, itemId, quantity, totalPrice);
                        Response.Redirect("cart.aspx");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error adding ItemID {itemId} to cart for Uid {uid}: {ex.Message}");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "cartAddError", "alert('Error adding item to cart. Please try again later.');", true);
                        //Response.Write("<script>alert('Error adding item to cart. Please try again later.');</script>");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidPriceError", $"alert('Could not find valid price information for the selected item (ID: {itemId}).');", true);
                    //Response.Write($"<script>alert('Could not find valid price information for the selected item (ID: {itemId}).');</script>");
                }
            }
        }

        // Remove or comment out DataList specific handlers if they are no longer needed
        // protected void ImageButton1_Command(object sender, CommandEventArgs e) { }
        // protected void DataList1_SelectedIndexChanged(object sender, EventArgs e) { }
        // protected void Button1_Command(object sender, CommandEventArgs e) { }
    }
}