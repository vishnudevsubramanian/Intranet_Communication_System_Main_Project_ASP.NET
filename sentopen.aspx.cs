using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sentopen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select tbl_user.name,tbl_mails.subject,tbl_mails.message,tbl_user.email from tbl_mails,tbl_user where tbl_mails.from_user_id=tbl_user.user_id and tbl_mails.msg_id=" + Request.QueryString.Get("msg_id").ToString());
        lblsubject.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(1).ToString();
        lblfrom.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
        lblfromid.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(3).ToString();
        lblmsg.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(2).ToString();
        Session["FromEmailID"] = ds.Tables[0].Rows[0].ItemArray.GetValue(3).ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session["forwardmsgid"]=Request.QueryString.Get("msg_id").ToString();
        Response.Redirect("forwardmail.aspx");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["subject"] = lblsubject.Text;
        Session["msg_id"] = Request.QueryString.Get("msg_id").ToString();
        
        Response.Redirect("reply.aspx");

    }
}