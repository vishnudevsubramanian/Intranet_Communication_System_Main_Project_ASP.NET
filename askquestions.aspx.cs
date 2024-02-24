using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class askquestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DatabaseAccess da = new DatabaseAccess();
            System.Data.DataSet ds = new System.Data.DataSet();
            ds = da.getData("select * from tbl_dept");
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = "dept_name";
            DropDownList1.DataValueField = "dept_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "-select-");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
            if (TextBox1.Text.Equals(""))
            {
                Label1.Text = "enter a question";
                return;
            }
            if (DropDownList1.SelectedItem.Text.Equals("-select-"))
            {
                Label1.Text = "choose dept";
                return;
            }
           
            DatabaseAccess da = new DatabaseAccess();
            System.Data.DataSet ds = new System.Data.DataSet();
            ds = da.getData("select name from tbl_user where user_id=" + Session["FromUserID"]);
            da.execute("insert into tbl_question values('" + TextBox1.Text + "'," + Session["FromUserID"] + "," + DropDownList1.SelectedValue.ToString() + ",'" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "','" + ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString() + "')");
            Label1.Text="successfully posted";

        }
   
}