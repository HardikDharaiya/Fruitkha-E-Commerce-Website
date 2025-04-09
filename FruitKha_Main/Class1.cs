using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;

namespace FruitKha_Main
{
    public class Class1
    {
        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        SqlConnection con;

        public void Connection()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public SqlConnection GetConnection()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }


        public void RegisterUserInsert(string un, string em, string pw)
        {
            Connection();
            cmd = new SqlCommand("INSERT INTO RegisterTbl(UserName, UserEmail, UserPassword) VALUES('" + un + "', '" + em + "', '" + pw + "');", con);
            cmd.ExecuteNonQuery();

        }

        public int VerifyRegister(string un, string em)
        {
            int i;
            Connection();
            cmd = new SqlCommand("SELECT COUNT(*) FROM RegisterTbl WHERE UserName='" + un + "' OR UserEmail='" + em + "';", con);
            i = Convert.ToInt32(cmd.ExecuteScalar());

            return i;
        }

        public int LoginCheck(string un, string pw)
        {
            Connection();
            cmd = new SqlCommand("SELECT Uid FROM RegisterTbl WHERE UserName=@Username AND UserPassword=@Password;", con);
            cmd.Parameters.AddWithValue("@Username", un);
            cmd.Parameters.AddWithValue("@Password", pw);

            object result = cmd.ExecuteScalar();
            return result != null ? Convert.ToInt32(result) : 0;
        }




        public void InsertData(String nm, String gn, String hb1, String hb2, String hb3, String ct, String ad, String im)
        {
            Connection();
            cmd = new SqlCommand("INSERT INTO emp_tbl(Name, Gender, Hobby1, Hobby2, Hobby3, City, Address, Image) VALUES('" + nm + "', '" + gn + "', '" + hb1 + "', '" + hb2 + "', '" + hb3 + "', '" + ct + "', '" + ad + "', '" + im + "');", con);
            cmd.ExecuteNonQuery();
        }


        public DataSet FillData()
        {
            Connection();
            da = new SqlDataAdapter("SELECT * FROM emp_tbl;", con);
            ds = new DataSet();
            da.Fill(ds);

            return ds;
        }


        public DataSet select(int id)
        {
            Connection();
            da = new SqlDataAdapter("SELECT * FROM emp_tbl WHERE Id='" + id + "';", con);
            ds = new DataSet();

            da.Fill(ds);

            return ds;
        }

        public void Update(int id, String nm, String gn, String hb1, String hb2, String hb3, String ct, String ad)
        {
            Connection();

            cmd = new SqlCommand("UPDATE emp_tbl SET Name='" + nm + "', Gender='" + gn + "', Hobby1='" + hb1 + "', Hobby2='" + hb2 + "', Hobby3='" + hb3 + "', City='" + ct + "', Address='" + ad + "' WHERE Id='" + id + "';", con);
            cmd.ExecuteNonQuery();

        }

        public void Delete(int id)
        {
            Connection();

            cmd = new SqlCommand("DELETE FROM emp_tbl WHERE Id='" + id + "';", con);
            cmd.ExecuteNonQuery();
        }

        public void AdminRegister(string name, string email, string password)
        {
            Connection();
            cmd = new SqlCommand("INSERT INTO AdminTbl(AdminName, AdminEmail, AdminPassword) VALUES(@Name, @Email, @Password)", con);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.ExecuteNonQuery();
        }

        public int VerifyAdmin(string email)
        {
            Connection();
            cmd = new SqlCommand("SELECT COUNT(*) FROM AdminTbl WHERE AdminEmail=@Email", con);
            cmd.Parameters.AddWithValue("@Email", email);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        public int AdminLoginCheck(string email, string password)
        {
            Connection();
            cmd = new SqlCommand("SELECT COUNT(*) FROM AdminTbl WHERE AdminEmail=@Email AND AdminPassword=@Password", con);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }


        public DataTable GetAdminProfile(string email)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT AdminName, AdminEmail FROM AdminTbl WHERE AdminEmail = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public bool UpdateAdminProfile(string email, string name, string password)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "UPDATE AdminTbl SET AdminName = @Name";
                if (!string.IsNullOrEmpty(password))
                {
                    query += ", AdminPassword = @Password";
                }
                query += " WHERE AdminEmail = @Email";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                if (!string.IsNullOrEmpty(password))
                {
                    cmd.Parameters.AddWithValue("@Password", password);
                }

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                con.Close();

                return rows > 0;
            }
        }


        public int GetTotalUsers()
        {
            using (SqlConnection con = GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM RegisterTbl;", con);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int GetTotalOrders()
        {
            using (SqlConnection con = GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM OrderTbl;", con);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int GetTotalItems()
        {
            using (SqlConnection con = GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM ItemTbl;", con);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public DataTable GetUserProfile(int uid)
        {
            using (SqlConnection con = GetConnection())
            {
                string query = "SELECT UserName, UserEmail FROM RegisterTbl WHERE Uid = @Uid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Uid", uid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable GetUserOrders(int uid)
        {
            using (SqlConnection con = GetConnection())
            {
                // This query should already be updated from the previous step
                string query = @"SELECT
                            o.OrderID, i.ItemName, o.Quantity, o.TotalPrice,
                            o.OrderDate, o.Status, o.ShippingAddressID
                        FROM OrderTbl o
                        INNER JOIN ItemTbl i ON o.ItemID = i.ItemID
                        WHERE o.Uid = @Uid
                        ORDER BY o.OrderDate DESC, o.ShippingAddressID DESC"; // Order helps grouping
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Uid", uid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }



        public void AddToCart(int uid, int itemId, int quantity, decimal totalPrice)
        {
            Connection();
            cmd = new SqlCommand("INSERT INTO AddToCartTbl (Uid, ItemID, Quantity, TotalPrice, DateAdded) VALUES (@Uid, @ItemID, @Quantity, @TotalPrice, GETDATE())", con);
            cmd.Parameters.AddWithValue("@Uid", uid);
            cmd.Parameters.AddWithValue("@ItemID", itemId);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@TotalPrice", totalPrice);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        //public DataTable GetCartItems(int uid)
        //{
        //	Connection();
        //	string query = "SELECT c.CartID, i.ItemName, i.ItemMeasurement, i.ItemPrice, c.Quantity, c.TotalPrice FROM AddToCartTbl c INNER JOIN ItemTbl i ON c.ItemID = i.ItemID WHERE c.Uid = @Uid";
        //	cmd = new SqlCommand(query, con);
        //	cmd.Parameters.AddWithValue("@Uid", uid);
        //	SqlDataAdapter da = new SqlDataAdapter(cmd);
        //	DataTable dt = new DataTable();
        //	da.Fill(dt);
        //	con.Close();
        //	return dt;
        //}

        public DataTable GetCartItems(int uid)
        {
            Connection();
            string query = "SELECT c.CartID, i.ItemName, i.ItemMeasurement, i.ItemPrice, i.ItemImage, c.Quantity, c.TotalPrice " +
                           "FROM AddToCartTbl c " +
                           "INNER JOIN ItemTbl i ON c.ItemID = i.ItemID " +
                           "WHERE c.Uid = @Uid";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Uid", uid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }



        public void RemoveCartItem(int cartID)
        {
            Connection();
            cmd = new SqlCommand("DELETE FROM AddToCartTbl WHERE CartID = @CartID", con);
            cmd.Parameters.AddWithValue("@CartID", cartID);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        // New PlaceOrder accepting ShippingAddressID
        public void PlaceOrder(int uid, int shippingAddressID)
        {
            using (SqlConnection con = GetConnection()) // Use using statement
            {
                // Use a transaction to ensure both operations succeed or fail together
                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    // 1. Insert into OrderTbl from AddToCartTbl, adding ShippingAddressID
                    string queryInsertOrder = @"INSERT INTO OrderTbl
                                                (Uid, ItemID, Quantity, TotalPrice, OrderDate, Status, ShippingAddressID)
                                                SELECT
                                                    Uid, ItemID, Quantity, TotalPrice, GETDATE(), 'Pending', @ShippingAddressID
                                                FROM AddToCartTbl
                                                WHERE Uid = @Uid";

                    using (SqlCommand cmdInsert = new SqlCommand(queryInsertOrder, con, transaction)) // Associate with transaction
                    {
                        cmdInsert.Parameters.AddWithValue("@Uid", uid);
                        cmdInsert.Parameters.AddWithValue("@ShippingAddressID", shippingAddressID);
                        cmdInsert.ExecuteNonQuery();
                    }


                    // 2. Clear cart after placing order
                    string queryDeleteCart = "DELETE FROM AddToCartTbl WHERE Uid = @Uid";
                    using (SqlCommand cmdDelete = new SqlCommand(queryDeleteCart, con, transaction)) // Associate with transaction
                    {
                        cmdDelete.Parameters.AddWithValue("@Uid", uid);
                        cmdDelete.ExecuteNonQuery();
                    }

                    // If both commands succeeded, commit the transaction
                    transaction.Commit();
                }
                catch (Exception) // Catch specific SqlException if needed
                {
                    // An error occurred, rollback the transaction
                    try
                    {
                        transaction.Rollback();
                    }
                    catch (Exception rollbackEx)
                    {
                        // Log rollback failure: Log.Error("Rollback failed: " + rollbackEx.Message);
                    }
                    // Rethrow the original exception to be handled by the calling code
                    throw;
                }

            } // Connection automatically closed by using
        }
        // --- END: Modify PlaceOrder Method ---


        // --- START: New Method ---
        public int SaveShippingAddress(int uid, string fullName, string email, string address1, string address2, string city, string state, string postalCode, string country, string phone)
        {
            int addressId = -1; // Default to invalid ID
            using (SqlConnection con = GetConnection()) // Use using for proper disposal
            {
                string query = @"INSERT INTO ShippingAddressTbl
                                (Uid, FullName, Email, AddressLine1, AddressLine2, City, State, PostalCode, Country, PhoneNumber, DateAdded)
                                VALUES
                                (@Uid, @FullName, @Email, @AddressLine1, @AddressLine2, @City, @State, @PostalCode, @Country, @PhoneNumber, GETDATE());
                                SELECT SCOPE_IDENTITY();"; // Get the last inserted identity value

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@AddressLine1", address1);
                    // Handle potential NULL for AddressLine2
                    cmd.Parameters.AddWithValue("@AddressLine2", string.IsNullOrWhiteSpace(address2) ? (object)DBNull.Value : address2);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@State", state);
                    cmd.Parameters.AddWithValue("@PostalCode", postalCode);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phone);

                    object result = cmd.ExecuteScalar(); // Executes query and returns first column of first row
                    if (result != null && result != DBNull.Value)
                    {
                        addressId = Convert.ToInt32(result);
                    }
                }
            } // Connection is automatically closed by using statement
            return addressId;
        }
        // --- END: New Method ---



        public string GetShippingAddressString(int addressId)
        {
            string addressString = "Address not found."; // Default message
            using (SqlConnection con = GetConnection())
            {
                string query = "SELECT FullName, AddressLine1, AddressLine2, City, State, PostalCode, Country, PhoneNumber FROM ShippingAddressTbl WHERE AddressID = @AddressID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AddressID", addressId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            StringBuilder sb = new StringBuilder();
                            sb.Append(reader["FullName"].ToString());
                            sb.Append("<br/>"); // HTML line break for display
                            sb.Append(reader["AddressLine1"].ToString());
                            if (reader["AddressLine2"] != DBNull.Value && !string.IsNullOrWhiteSpace(reader["AddressLine2"].ToString()))
                            {
                                sb.Append(", ");
                                sb.Append(reader["AddressLine2"].ToString());
                            }
                            sb.Append("<br/>");
                            sb.Append(reader["City"].ToString());
                            sb.Append(", ");
                            sb.Append(reader["State"].ToString());
                            sb.Append(" ");
                            sb.Append(reader["PostalCode"].ToString());
                            sb.Append("<br/>");
                            sb.Append(reader["Country"].ToString());
                            sb.Append("<br/>Phone: ");
                            sb.Append(reader["PhoneNumber"].ToString());

                            addressString = sb.ToString();
                        }
                    }
                }
            }
            return addressString;
        }



        // Add these methods inside the Class1 class in Class1.cs

        public int InsertItem(string name, string measurement, decimal price, string description, string category, string imagePath)
        {
            using (SqlConnection con = GetConnection()) // Use using for automatic disposal
            {
                string query = @"INSERT INTO ItemTbl
                         (ItemName, ItemMeasurement, ItemPrice, ItemDescription, ItemCategory, ItemImage)
                         VALUES
                         (@Name, @Measurement, @Price, @Description, @Category, @ImagePath);
                         SELECT SCOPE_IDENTITY();"; // Get the ID of the inserted row

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Measurement", measurement);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@ImagePath", imagePath); // Store relative path or filename

                    // ExecuteScalar returns the first column of the first row (the new ItemID)
                    object result = cmd.ExecuteScalar();
                    return (result != null && result != DBNull.Value) ? Convert.ToInt32(result) : -1; // Return ID or -1 on failure
                }
            } // Connection closed automatically
        }

        public bool UpdateItem(int itemID, string name, string measurement, decimal price, string description, string category, string imagePath)
        {
            using (SqlConnection con = GetConnection())
            {
                // Build the query dynamically based on whether imagePath is provided
                string query = @"UPDATE ItemTbl SET
                         ItemName = @Name,
                         ItemMeasurement = @Measurement,
                         ItemPrice = @Price,
                         ItemDescription = @Description,
                         ItemCategory = @Category";

                // Only update the image path if a new one is provided
                if (!string.IsNullOrEmpty(imagePath))
                {
                    query += ", ItemImage = @ImagePath";
                }

                query += " WHERE ItemID = @ItemID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ItemID", itemID);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Measurement", measurement);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Category", category);

                    // Add the image path parameter only if it's being updated
                    if (!string.IsNullOrEmpty(imagePath))
                    {
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                    }

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0; // Return true if update was successful
                }
            }
        }

        public bool DeleteItem(int itemID)
        {
            // Consider deleting the associated image file from the server here if needed
            // string imagePath = GetItemImagePath(itemID); // Need a method to get path first
            // if (!string.IsNullOrEmpty(imagePath)) { File.Delete(Server.MapPath("~/Images/" + imagePath)); }

            using (SqlConnection con = GetConnection())
            {
                string query = "DELETE FROM ItemTbl WHERE ItemID = @ItemID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ItemID", itemID);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }

        public DataTable GetItemByID(int itemID)
        {
            using (SqlConnection con = GetConnection())
            {
                string query = "SELECT ItemID, ItemName, ItemMeasurement, ItemPrice, ItemDescription, ItemCategory, ItemImage FROM ItemTbl WHERE ItemID = @ItemID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ItemID", itemID);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        // Method to get all items with optional filtering
        public DataTable GetAllItems(string filterName = "", string filterCategory = "")
        {
            using (SqlConnection con = GetConnection())
            {
                // Start with base query
                string query = "SELECT ItemID, ItemName, ItemMeasurement, ItemPrice, ItemDescription, ItemCategory, ItemImage FROM ItemTbl WHERE 1=1"; // 1=1 allows easy appending of AND clauses

                SqlCommand cmd = new SqlCommand(); // Create command object

                // Add filters if provided
                if (!string.IsNullOrEmpty(filterName))
                {
                    query += " AND ItemName LIKE @FilterName";
                    cmd.Parameters.AddWithValue("@FilterName", "%" + filterName + "%"); // Use LIKE for partial matches
                }
                if (!string.IsNullOrEmpty(filterCategory) && filterCategory != "All") // Assuming "All" means no category filter
                {
                    query += " AND ItemCategory = @FilterCategory";
                    cmd.Parameters.AddWithValue("@FilterCategory", filterCategory);
                }

                query += " ORDER BY ItemName"; // Optional: Add default sorting

                cmd.CommandText = query; // Set the final query text
                cmd.Connection = con; // Assign the connection

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        // Helper method (optional but good practice) to get image path before deleting item/updating image
        public string GetItemImagePath(int itemID)
        {
            using (SqlConnection con = GetConnection())
            {
                string query = "SELECT ItemImage FROM ItemTbl WHERE ItemID = @ItemID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ItemID", itemID);
                    object result = cmd.ExecuteScalar();
                    return (result != null && result != DBNull.Value) ? result.ToString() : null;
                }
            }
        }





        // Add these methods inside the Class1 class in Class1.cs

        public DataTable GetAllOrders(string filterStatus = null, DateTime? filterStartDate = null, DateTime? filterEndDate = null)
        {
            using (SqlConnection con = GetConnection())
            {
                // Base query joining necessary tables
                // Added ItemImage from ItemTbl and UserEmail from RegisterTbl
                string query = @"SELECT
                            o.OrderID, o.OrderDate, o.Quantity, o.TotalPrice, o.Status, o.ShippingAddressID,
                            u.UserName, u.UserEmail,  -- Added UserEmail
                            i.ItemName, i.ItemImage,  -- Added ItemImage
                            sa.FullName as ShippingFullName -- Optional: Get shipping name directly
                        FROM OrderTbl o
                        INNER JOIN RegisterTbl u ON o.Uid = u.Uid
                        INNER JOIN ItemTbl i ON o.ItemID = i.ItemID
                        LEFT JOIN ShippingAddressTbl sa ON o.ShippingAddressID = sa.AddressID -- Left join in case address is missing
                        WHERE 1=1"; // To easily append conditions

                SqlCommand cmd = new SqlCommand();

                // Apply Status Filter
                if (!string.IsNullOrEmpty(filterStatus) && filterStatus != "All") // Assuming "All" means no filter
                {
                    query += " AND o.Status = @Status";
                    cmd.Parameters.AddWithValue("@Status", filterStatus);
                }

                // Apply Date Filters
                if (filterStartDate.HasValue)
                {
                    query += " AND o.OrderDate >= @StartDate";
                    // Use .Date to compare only the date part, ignoring time
                    cmd.Parameters.AddWithValue("@StartDate", filterStartDate.Value.Date);
                }
                if (filterEndDate.HasValue)
                {
                    query += " AND o.OrderDate < @EndDate";
                    // Add one day to include the entire end date
                    cmd.Parameters.AddWithValue("@EndDate", filterEndDate.Value.Date.AddDays(1));
                }

                query += " ORDER BY o.OrderDate DESC, o.OrderID DESC"; // Sort by most recent

                cmd.CommandText = query;
                cmd.Connection = con;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public bool UpdateOrderStatus(int orderID, string newStatus)
        {
            using (SqlConnection con = GetConnection())
            {
                string query = "UPDATE OrderTbl SET Status = @NewStatus WHERE OrderID = @OrderID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NewStatus", newStatus);
                    cmd.Parameters.AddWithValue("@OrderID", orderID);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0; // Return true if update was successful
                }
            }
        }

        // We will reuse the existing GetShippingAddressString(int addressId) method
        // public string GetShippingAddressString(int addressId) { ... } - Make sure it exists and is accessible


        // Add these methods inside the Class1 class in Class1.cs

        public DataTable GetAllUsers(string filterName = "", string filterEmail = "")
        {
            using (SqlConnection con = GetConnection())
            {
                // Select necessary columns - DO NOT select UserPassword
                string query = "SELECT Uid, UserName, UserEmail FROM RegisterTbl WHERE 1=1"; // Base query

                SqlCommand cmd = new SqlCommand(); // Create command object

                // Apply filters using parameters to prevent SQL Injection
                if (!string.IsNullOrEmpty(filterName))
                {
                    query += " AND UserName LIKE @FilterName";
                    cmd.Parameters.AddWithValue("@FilterName", "%" + filterName + "%");
                }
                if (!string.IsNullOrEmpty(filterEmail))
                {
                    query += " AND UserEmail LIKE @FilterEmail";
                    cmd.Parameters.AddWithValue("@FilterEmail", "%" + filterEmail + "%");
                }

                query += " ORDER BY UserName"; // Order alphabetically by username

                cmd.CommandText = query;
                cmd.Connection = con;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public bool DeleteUser(int uid)
        {
            // IMPORTANT: Recall that deleting a user will CASCADE deletes to OrderTbl and AddToCartTbl
            // due to the foreign key constraints defined in the database schema.
            using (SqlConnection con = GetConnection())
            {
                string query = "DELETE FROM RegisterTbl WHERE Uid = @Uid";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0; // Return true if deletion was successful
                }
            }
        }







    }
}