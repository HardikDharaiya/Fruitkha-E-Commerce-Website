using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO; // For Path class if generating unique filenames


namespace FruitKha_Main
{
	public partial class checkout1 : BasePage
	{
		Class1 c1 = new Class1();
		decimal shippingCost = 50.00M; // Example fixed shipping cost
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// BasePage should handle redirect if not logged in
				if (Session["Uid"] == null)
				{
					Response.Redirect("Login.aspx", false);
					HttpContext.Current.ApplicationInstance.CompleteRequest();
					return;
				}
               
                LoadCartSummary();
				PopulateUserInfo();
			}
            UserNameTxt.Text = Session["UserName"].ToString();
        }


        private void LoadCartSummary()
        {
            if (Session["Uid"] != null)
            {
                int uid = Convert.ToInt32(Session["Uid"]);
                DataTable dt = c1.GetCartItems(uid);

                if (dt != null && dt.Rows.Count > 0)
                {
                    rptOrderSummary.DataSource = dt;
                    rptOrderSummary.DataBind();

                    decimal subtotal = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        subtotal += Convert.ToDecimal(row["TotalPrice"]);
                    }

                    lblSubtotal.Text = "₹" + subtotal.ToString("N2");
                    lblShipping.Text = "₹" + shippingCost.ToString("N2"); // Use the defined shipping cost
                    lblGrandTotal.Text = "₹" + (subtotal + shippingCost).ToString("N2");
                    btnPlaceOrder.Enabled = true; // Enable button if cart has items
                    ViewState["GrandTotal"] = subtotal + shippingCost; // Store for potential use later
                }
                else
                {
                    // Cart is empty, redirect back or disable checkout
                    lblSubtotal.Text = "₹0.00";
                    lblShipping.Text = "₹0.00";
                    lblGrandTotal.Text = "₹0.00";
                    rptOrderSummary.DataSource = null; // Clear repeater
                    rptOrderSummary.DataBind();
                    btnPlaceOrder.Enabled = false; // Disable button
                    lblMessage.Text = "Your cart is empty. Please add items before checking out.";
                    // Optional: Redirect back to cart
                    // Response.Redirect("cart.aspx", false);
                    // HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }


        private void PopulateUserInfo()
        {
            if (Session["Uid"] != null)
            {
                int uid = Convert.ToInt32(Session["Uid"]);
                DataTable dt = c1.GetUserProfile(uid); // Assumes GetUserProfile exists and works

                if (dt != null && dt.Rows.Count > 0)
                {
                    // Pre-fill if fields are empty (don't overwrite if user typed something before postback)
                    if (string.IsNullOrEmpty(NameTxt.Text))
                        NameTxt.Text = dt.Rows[0]["UserName"].ToString(); // Assuming UserName is FullName
                    if (string.IsNullOrEmpty(EmailTxt.Text))
                        EmailTxt.Text = dt.Rows[0]["UserEmail"].ToString();
                    // You might want to add fields like Phone to RegisterTbl or have a separate UserProfileTbl
                }
            }
        }




        protected void btnPlaceOrder_Click(object sender, EventArgs e)
		{



            //// TEMPORARY CODE - Add inside a button click handler or temporarily in Page_Load for testing
            //// Replace with a *real* OrderID and ShippingAddressID from your database for testing
            //int testOrderID = 24; // <<< USE AN ACTUAL OrderID THAT EXISTS
            //int testShippingAddressID = 9; // <<< USE THE ShippingAddressID associated with that order

            //try
            //{
            //	DataSet dsSchema = new DataSet("InvoiceData"); // Give the DataSet a name
            //	using (SqlConnection con = c1.GetConnection()) // Use your Class1 instance (c1)
            //	{
            //		// Query to get Order, User, Item, and Address details FOR ONE ORDER
            //		// Adapt JOINs and fields as needed for your bill layout
            //		string query = @"
            //         SELECT TOP 1 -- Or based on a specific OrderID
            //             O.OrderID, O.OrderDate, O.Quantity, O.TotalPrice AS LineTotal, O.Status,
            //             I.ItemName, I.ItemMeasurement, I.ItemPrice,
            //             R.UserName, R.UserEmail,
            //             S.FullName, S.Email AS ShippingEmail, S.AddressLine1, S.AddressLine2,
            //             S.City, S.State, S.PostalCode, S.Country, S.PhoneNumber
            //         FROM OrderTbl O
            //         INNER JOIN ItemTbl I ON O.ItemID = I.ItemID
            //         INNER JOIN RegisterTbl R ON O.Uid = R.Uid
            //         INNER JOIN ShippingAddressTbl S ON O.ShippingAddressID = S.AddressID
            //         WHERE O.OrderID = @OrderID AND O.ShippingAddressID = @ShippingAddressID";
            //		// Note: This simple query gets one item line. You'll likely need a more complex query
            //		// or multiple DataTables in the DataSet if an order has multiple items,
            //		// grouped by OrderID/ShippingAddressID. A better approach for multiple items
            //		// might involve getting Order Header info and Order Detail lines separately.

            //		// *** SIMPLIFIED QUERY FOR SCHEMA GENERATION (Gets ONE line item of the specified order): ***
            //		// You might need to adjust this based on how you design the report later.
            //		// A common approach is:
            //		// Table 1: Order Header (OrderID, Date, User Info, Ship Info, Totals)
            //		// Table 2: Order Details (OrderID (FK), ItemName, Qty, Price, LineTotal)

            //		using (SqlCommand cmd = new SqlCommand(query, con))
            //		{
            //			cmd.Parameters.AddWithValue("@OrderID", testOrderID);
            //			cmd.Parameters.AddWithValue("@ShippingAddressID", testShippingAddressID);
            //			SqlDataAdapter da = new SqlDataAdapter(cmd);
            //			da.Fill(dsSchema, "OrderDetails"); // Name the DataTable
            //		}

            //		// ** Optional: Add another DataTable for Summary Info if needed **
            //		// DataTable dtSummary = new DataTable("OrderSummary");
            //		// dtSummary.Columns.Add("Subtotal", typeof(decimal));
            //		// dtSummary.Columns.Add("ShippingCost", typeof(decimal));
            //		// dtSummary.Columns.Add("GrandTotal", typeof(decimal));
            //		// dtSummary.Rows.Add(calculatedSubtotal, shippingCost, calculatedGrandTotal); // Calculate these values
            //		// dsSchema.Tables.Add(dtSummary);

            //	}

            //	if (dsSchema.Tables.Contains("OrderDetails") && dsSchema.Tables["OrderDetails"].Rows.Count > 0)
            //	{
            //		// Define path to save the XML Schema (e.g., in your project's root or App_Data)
            //		// Use Server.MapPath for web projects
            //		string xmlPath = Server.MapPath("~/InvoiceSchema.xml"); // Save in project root

            //		// Write XML file WITH Schema information
            //		dsSchema.WriteXml(xmlPath, XmlWriteMode.WriteSchema);

            //		// Display success message (temporary)
            //		ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Schema XML file generated successfully at: " + xmlPath.Replace("\\", "\\\\") + "');", true);
            //	}
            //	else
            //	{
            //		ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No data found for the specified OrderID/ShippingAddressID to generate schema.');", true);
            //	}
            //}
            //catch (Exception ex)
            //{
            //	// Display error message (temporary)
            //	ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error generating schema XML: " + ex.Message.Replace("'", "\\'").Replace("\n", "\\n") + "');", true);
            //}



            // Re-validate on server-side
            Page.Validate();
            if (!Page.IsValid)
            {
                lblMessage.Text = "Please fill in all required address fields correctly.";
                return;
            }

            if (Session["Uid"] == null)
            {
                Response.Redirect("Login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
                return;
            }

            int uid = Convert.ToInt32(Session["Uid"]);

            // 1. Check again if cart is empty
            DataTable dtCart = c1.GetCartItems(uid);
            if (dtCart == null || dtCart.Rows.Count == 0)
            {
                lblMessage.Text = "Your cart is empty. Cannot place order.";
                btnPlaceOrder.Enabled = false;
                return;
            }

            // 2. Save Shipping Address
            int shippingAddressId = -1;
            try
            {
                shippingAddressId = c1.SaveShippingAddress(
                    uid,
                    NameTxt.Text.Trim(), EmailTxt.Text.Trim(), AddressTxt.Text.Trim(),
                    AddressLine2Txt.Text.Trim(), CityTxt.Text.Trim(), StateTxt.Text.Trim(),
                    PostalCodeTxt.Text.Trim(), CountryTxt.Text.Trim(), PhoneTxt.Text.Trim()
                );
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error saving shipping address. Please try again.";
                // Log error
                return;
            }

            // 3. Place Order (if address was saved successfully)
            if (shippingAddressId > 0)
            {
                try
                {
                    c1.PlaceOrder(uid, shippingAddressId); // Place the order first

                    // --- START: Crystal Report Generation ---

                    // 4. Fetch Data for the Report (Orders placed in this transaction)
                    //    We need a way to identify the orders JUST placed. Since PlaceOrder
                    //    doesn't return IDs, we query orders for this user with this
                    //    ShippingAddressID placed very recently. This isn't perfectly robust.
                    //    A better way is to modify PlaceOrder to return IDs or add a transaction marker.
                    //    Let's fetch based on user and the *new* ShippingAddressID for now.

                    DataSet dsReportData = new DataSet("InvoiceData");
                    decimal reportSubtotal = 0;

                    using (SqlConnection con = c1.GetConnection())
                    {
                        // Query to get all items associated with the orders placed in this transaction
                        // Grouping by ShippingAddressID is key here.
                        string query = @"
                    SELECT
                        O.OrderID, O.OrderDate, O.Quantity, O.TotalPrice AS LineTotal, O.Status,
                        I.ItemName, I.ItemMeasurement, I.ItemPrice,
                        R.UserName, R.UserEmail,
                        S.FullName, S.Email AS ShippingEmail, S.AddressLine1, S.AddressLine2,
                        S.City, S.State, S.PostalCode, S.Country, S.PhoneNumber
                    FROM OrderTbl O
                    INNER JOIN ItemTbl I ON O.ItemID = I.ItemID
                    INNER JOIN RegisterTbl R ON O.Uid = R.Uid
                    INNER JOIN ShippingAddressTbl S ON O.ShippingAddressID = S.AddressID
                    WHERE O.Uid = @Uid AND O.ShippingAddressID = @ShippingAddressID
                    ORDER BY O.OrderID DESC"; // Order might matter for report grouping

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Uid", uid);
                            cmd.Parameters.AddWithValue("@ShippingAddressID", shippingAddressId);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(dsReportData, "OrderDetails"); // Use the same DataTable name as in the schema XML
                        }
                    }

                    // Calculate Totals from fetched data for the report
                    if (dsReportData.Tables.Contains("OrderDetails"))
                    {
                        foreach (DataRow dr in dsReportData.Tables["OrderDetails"].Rows)
                        {
                            reportSubtotal += Convert.ToDecimal(dr["LineTotal"]);
                        }
                    }
                    decimal reportGrandTotal = reportSubtotal + shippingCost; // Use same shipping cost

                    // ** Optional: Add Summary table to DataSet if your report needs it **
                    DataTable dtSummary = new DataTable("OrderSummary");
                    dtSummary.Columns.Add("Subtotal", typeof(decimal));
                    dtSummary.Columns.Add("ShippingCost", typeof(decimal));
                    dtSummary.Columns.Add("GrandTotal", typeof(decimal));
                    // Add other header info if needed (like OrderID - but which one if multiple?)
                    dtSummary.Columns.Add("InvoiceOrderID", typeof(int)); // Example: Use first OrderID as Invoice#
                    int invoiceOrderId = (dsReportData.Tables.Contains("OrderDetails") && dsReportData.Tables["OrderDetails"].Rows.Count > 0)
                                         ? Convert.ToInt32(dsReportData.Tables["OrderDetails"].Rows[0]["OrderID"])
                                         : 0; // Handle empty case
                    dtSummary.Rows.Add(reportSubtotal, shippingCost, reportGrandTotal, invoiceOrderId);
                    dsReportData.Tables.Add(dtSummary);


                    // 5. Load Report and Set Data Source
                    using (ReportDocument cr = new ReportDocument()) // Use using for disposal
                    {
                        string reportPath = Server.MapPath("~/InvoiceReport.rpt"); // Adjust path/name if needed

                        if (!File.Exists(reportPath))
                        {
                            lblMessage.Text = "Error: Invoice report file not found.";
                            return; // Stop if report template is missing
                        }

                        cr.Load(reportPath);
                        cr.SetDataSource(dsReportData); // Set the DataSet as the source

                        // Optional: Pass parameters to the report (e.g., Company Name)
                        // cr.SetParameterValue("CompanyName", "Fruitkha");

                        // 6. Export Report to PDF and Stream to Browser
                        // Clear the current response
                        Response.ClearContent();
                        Response.ClearHeaders();

                        try
                        {
                            // Export to PDF format and stream it
                            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "FruitkhaInvoice_" + invoiceOrderId);
                        }
                        catch (Exception reportEx)
                        {
                            // Log reporting error specifically
                            lblMessage.Text = "Error generating invoice PDF.";
                            // Log detailed error: Log.Error("Crystal Report Export Error: " + reportEx.ToString());
                            // If export fails, maybe redirect to Profile page with a message?
                            // Need to make sure headers aren't partially sent.
                            // It might be safer to redirect *before* trying to export if error handling is complex.
                        }
                        finally
                        {
                            // Ensure response ends if export happened or failed mid-stream
                            // However, ExportToHttpResponse often handles ending the response.
                            // Only use End() if absolutely necessary as it can cause issues.
                            // HttpContext.Current.ApplicationInstance.CompleteRequest();
                        }
                    }
                    // --- END: Crystal Report Generation ---

                    // NOTE: Since we are exporting a PDF, the Response.Redirect below will NOT execute
                    // if the export is successful because ExportToHttpResponse takes over the response.
                    // Response.Redirect("Profile.aspx?order=success", false);
                    // HttpContext.Current.ApplicationInstance.CompleteRequest();

                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred while placing your order or generating the invoice. Please try again.";
                    // Log error
                }
            }
            else
            {
                lblMessage.Text = "Failed to save shipping address. Order not placed.";
                // Log error
            }
        }
	}
}