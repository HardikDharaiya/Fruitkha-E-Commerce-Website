using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FruitKha_Main.admin
{
	
	public class AdminBLL
	{

		private Class1 dataAccess = new Class1();


        public int GetTotalUsers()
        {
            return dataAccess.GetTotalUsers();
        }

        public int GetTotalOrders()
        {
            return dataAccess.GetTotalOrders();
        }

        public int GetTotalItems()
        {
            return dataAccess.GetTotalItems();
        }

    }
}