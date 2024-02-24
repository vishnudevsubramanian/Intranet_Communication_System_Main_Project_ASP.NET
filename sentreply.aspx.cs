using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sentreply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["msg_id"] = Request.QueryString.Get("msg_id").ToString();
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select subject,from_user_id from tbl_mails where msg_id=" + Session["msg_id"].ToString());
        Session["reply_subject"] = ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();


        DatabaseAccess da1 = new DatabaseAccess();
        System.Data.DataSet ds1 = new System.Data.DataSet();
        ds1 = da1.getData("select email from tbl_user where user_id=" + ds.Tables[0].Rows[0].ItemArray.GetValue(1).ToString());

        Session["reply_to"] = ds1.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
        Response.Redirect("chainreply.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["forwardmsgid"] = Request.QueryString.Get("msg_id");
        Response.Redirect("forwardmail.aspx");
    }
}