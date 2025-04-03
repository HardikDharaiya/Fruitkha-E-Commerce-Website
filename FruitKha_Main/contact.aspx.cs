using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace FruitKha_Main
{
    public partial class contact1 : BasePage
    {

        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        String fnm, h1, h2, h3;
        String[] hb = new String[3];
        Class1 c1;


        public void Connection()
        {
            c1 = new Class1();
            c1.Connection();
        }

        public void UploadImage()
        {
            if (ImageFileUpload.HasFile)
            {
                fnm = "Images/" + ImageFileUpload.FileName;
                ImageFileUpload.SaveAs(Server.MapPath(fnm));
            }
        }

        public void HobbyFind()
        {
            for (int h = 0; h < hb.Length; h++)
            {
                if (HobbyChkBx.Items[h].Selected == true)
                {
                    hb[h] = HobbyChkBx.Items[h].Text;
                }
            }
        }


        


        void empty()
        {
            NameTxt.Text = "";
            AddressTxt.Text = "";
            CityDrpDwnLst.ClearSelection();
            GenderRdoBtnLst.ClearSelection();
            HobbyChkBx.ClearSelection();

            SaveBtn.Text = "Save";
        }


        public void FillGrid()
		{
            c1 = new Class1();

            GridView1.DataSource = c1.FillData();
            GridView1.DataBind();

		}

        private bool IsUserLoggedIn()
        {
            return Session["UserLoggedIn"] is bool userLoggedIn && userLoggedIn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {                 
            FillGrid();           
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            Connection();
            UploadImage();
            HobbyFind();

            if (SaveBtn.Text.Equals("Save"))
            {
                //save 

                for (int h = 0; h < 1; h++)
                {
                    if (hb[h] == "Cricket")
                    {
                        h1 = "Cricket";
                        h++;
                    }
                    else
                    {
                        h1 = "null";
                        h++;
                    }
                    if (hb[h] == "Volleyball")
                    {
                        h2 = "Volleyball";
                        h++;
                    }
                    else
                    {
                        h2 = "null";
                        h++;
                    }
                    if (hb[h] == "Football")
                    {
                        h3 = "Football";
                        h++;
                    }
                    else
                    {
                        h3 = "null";
                        h++;
                    }

                    c1.InsertData(NameTxt.Text, GenderRdoBtnLst.SelectedValue, h1, h2, h3, CityDrpDwnLst.SelectedValue, AddressTxt.Text, fnm);
                    FillGrid();
                    empty();
                }
            }


            else
            {
                //update

                Connection();
                HobbyFind();

                for (int h = 0; h < 1; h++)
                {
                    if (hb[h] == "Cricket")
                    {
                        h1 = hb[0];
                        h++;
                    }
                    else
                    {
                        h1 = "null";
                        h++;
                    }

                    if (hb[h] == "Volleyball")
                    {
                        h2 = "Volleyball";
                        h++;
                    }
                    else
                    {
                        h2 = "null";
                        h++;
                    }
                    if (hb[h] == "Football")
                    {
                        h3 = "Football";
                        h++;
                    }
                    else
                    {
                        h3 = "null";
                        h++;
                    }

                    c1 = new Class1();

                    c1.Update(Convert.ToInt32(ViewState["id"]), NameTxt.Text, GenderRdoBtnLst.SelectedValue, h1, h2, h3, CityDrpDwnLst.SelectedValue, AddressTxt.Text);
                    empty();
                    FillGrid();
                    

                }

            }


            }


        public void FillText()
		{
            c1 = new Class1();

            ds = c1.select(Convert.ToInt32(ViewState["id"]));
           
            NameTxt.Text = ds.Tables[0].Rows[0][1].ToString();
            AddressTxt.Text = ds.Tables[0].Rows[0][7].ToString();
            GenderRdoBtnLst.SelectedValue = ds.Tables[0].Rows[0][2].ToString();
            CityDrpDwnLst.SelectedValue = ds.Tables[0].Rows[0][6].ToString();

            if (ds.Tables[0].Rows[0][3].ToString() == "Cricket")
            {
                HobbyChkBx.Items[0].Selected = true;
            }
            else
            {
                HobbyChkBx.Items[0].Selected = false;
            }

            if (ds.Tables[0].Rows[0][4].ToString() == "Volleyball")
            {
                HobbyChkBx.Items[1].Selected = true;
            }
            else
            {
                HobbyChkBx.Items[1].Selected = false;
            }

            if (ds.Tables[0].Rows[0][5].ToString() == "Football")
            {
                HobbyChkBx.Items[2].Selected = true;
            }
            else
            {
                HobbyChkBx.Items[2].Selected = false;
            }

        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            {
            if (e.CommandName == "cmd_edt")
            {
                
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                FillText();
                SaveBtn.Text = "Update";

            }
            else if (e.CommandName == "cmd_delete")
            {
                c1 = new Class1();
                int id = Convert.ToInt16(e.CommandArgument);
                c1.Delete(id);
                FillGrid();
                
            }

        }
    }
}