using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;

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
			cmd = new SqlCommand("INSERT INTO RegisterTbl(UserName, UserEmail, UserPassword) VALUES('"+un+"', '"+em+"', '"+pw+"');", con);
			cmd.ExecuteNonQuery();

		}

		public int VerifyRegister(string un, string em)
		{
			int i;
			Connection();
			cmd = new SqlCommand("SELECT COUNT(*) FROM RegisterTbl WHERE UserName='" + un + "' OR UserEmail='"+em+"';", con);
			i = Convert.ToInt32(cmd.ExecuteScalar());

			return i;
		}

		public int LoginCheck(string un, string pw)
		{
			int i;
			Connection();
			cmd = new SqlCommand("SELECT COUNT(*) FROM RegisterTbl WHERE UserName='"+un+"' AND UserPassword='"+pw+"';", con);
			i = Convert.ToInt32(cmd.ExecuteScalar());

			return i;
		}


		public void InsertData(String nm, String gn, String hb1, String hb2, String hb3, String ct, String ad, String im)
		{
			Connection();
			cmd = new SqlCommand("INSERT INTO emp_tbl(Name, Gender, Hobby1, Hobby2, Hobby3, City, Address, Image) VALUES('"+nm+"', '"+gn+"', '"+hb1+"', '"+hb2+"', '"+hb3+"', '"+ct+"', '"+ad+"', '"+im+"');", con);
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
			da = new SqlDataAdapter("SELECT * FROM emp_tbl WHERE Id='"+id+"';", con);
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

			cmd = new SqlCommand("DELETE FROM emp_tbl WHERE Id='"+id+"';", con);
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


	}
}