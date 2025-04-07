using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Data;

namespace FruitKha_Main
{
    public partial class shop1 : BasePage
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        String[] hb = new String[3];
        Class1 c1;


        PagedDataSource pg;
        int i, row;
        string itemId;


        protected void PrevBtn_Click(object sender, EventArgs e)
		{
            int currentPage = Convert.ToInt32(ViewState["pid"]);
            if (currentPage > 0)
            {
                currentPage--; 
                ViewState["pid"] = currentPage;
                display(); 
            }
        }

		protected void NextBtn_Click(object sender, EventArgs e)
		{
            int currentPage = Convert.ToInt32(ViewState["pid"]);
            int totalPages = row / pg.PageSize;

            if (currentPage < totalPages)
            {
                currentPage++; 
                ViewState["pid"] = currentPage;
                display(); 
            }
        }

		protected void PrevBtn_DataBinding(object sender, EventArgs e)
		{

		}

        public void display()
        {
            c1 = new Class1();
            da = new SqlDataAdapter("SELECT * FROM ItemTbl", c1.GetConnection());

            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();

            pg.AllowPaging = true;
            pg.PageSize = 3;

            if (ViewState["pid"] == null)
            { ViewState["pid"] = 0; }

            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);
            pg.DataSource = ds.Tables[0].DefaultView;
            DataList1.DataSource = pg;
            DataList1.DataBind();

            PrevBtn.Enabled = (pg.CurrentPageIndex > 0);
            NextBtn.Enabled = (pg.CurrentPageIndex < (row / pg.PageSize));
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            itemId = e.CommandArgument.ToString();

            Response.Redirect($"single-product.aspx?ItemID={itemId}");
        }

		protected void Button1_Command(object sender, CommandEventArgs e)
		{
            int uid = Convert.ToInt32(Session["Uid"]);
            int itemId = Convert.ToInt32(e.CommandArgument);

            // For now, we assume quantity = 1 (you can enhance it later)
            int quantity = 1;

            // Get item price from DB
            Class1 obj = new Class1();
            SqlConnection con = obj.GetConnection();
            SqlCommand cmd = new SqlCommand("SELECT ItemPrice FROM ItemTbl WHERE ItemID = @ItemID", con);
            cmd.Parameters.AddWithValue("@ItemID", itemId);
            object priceObj = cmd.ExecuteScalar();
            con.Close();

            if (priceObj != null)
            {
                decimal price = Convert.ToDecimal(priceObj);
                decimal totalPrice = price * quantity;

                // Add to Cart Table
                obj.AddToCart(uid, itemId, quantity, totalPrice);

                // Redirect to Cart
                Response.Redirect("cart.aspx");
            }
            else
            {
                Response.Write("<script>alert('Something wrong!');</script>");
            }
        }

		protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
            }
            display();
        }
    }
}