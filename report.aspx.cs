using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy/MM/dd");
        Calendar1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Equals(""))
        {
            lblMessage.Text = "choose date";
            return;
        }
        DateTime dt = DateTime.Parse(TextBox1.Text.ToString());
        TextBox1.Text = dt.ToString("yyyy/MM/dd");
        Session["reportdate"] = TextBox1.Text ;
        

        Response.Redirect("showreport.aspx");
    }
}