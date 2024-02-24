using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class giveanswer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds=new System.Data.DataSet();
        ds=da.getData ("select name from tbl_user where user_id=" +Session["FromUserID"]);
        string student="";
        student=ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
        da.execute("insert into tbl_answers values(" + Request.QueryString.Get("qid").ToString() + ",'" + TextBox1.Text + "'," + Session["FromUserID"] + ",'" + student + "',0)");
        Label1.Visible = true;
        Label1.Text = "successfully posted";

    }
}