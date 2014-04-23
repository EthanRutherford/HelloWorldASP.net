using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace WebApplication2
{
    public class SQL
    {
        public SQL()
        {
            conn.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\data.mdf;Integrated Security=True;User Instance=True";
        }
        public void send(String instr)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = instr;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void read(String instr, Repeater repeater)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = instr;
            cmd.Connection = conn;
            repeater.DataSource = cmd.ExecuteReader();
            repeater.DataBind();
            conn.Close();
        }
        SqlConnection conn = new SqlConnection();
    }
}