using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label1.Visible = true;
            Label1.Text = "enter news first";
            return;
        }
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        da.execute("insert into tbl_news values('" + TextBox1.Text + "','" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "')");
        Label1.Visible = true;
        Label1.Text = "successfully posted";
    }
}