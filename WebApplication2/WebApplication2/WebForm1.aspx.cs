using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sql.send("IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[stuff]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)CREATE TABLE [dbo].[stuff] (name varchar(255), description varchar(255));");
            if (!Page.IsPostBack)
                sql.read("select * from stuff", things);
        }
        protected void submit(object sender, EventArgs e)
        {
            sql.send("Insert stuff (name, description) values ('" + txt1.Text + "', '" + txt2.Text + "');");
            sql.read("select * from stuff", things);
        }
        SQL sql = new SQL("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\data.mdf;Integrated Security=True;User Instance=True");
    }
}