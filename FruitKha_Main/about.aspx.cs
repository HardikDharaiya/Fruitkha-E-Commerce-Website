using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKha_Main
{
	public partial class about1 : BasePage
	{

		
		protected void Page_Load(object sender, EventArgs e)
		{
			UserNameTxt.Text = Session["UserName"].ToString();
		}
	}
}