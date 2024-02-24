using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteInboxMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        da.execute("insert into tbl_trashmail(msg_id,from_user_id,to_user_id,subject,message,mail_status,date,open_status) select * from tbl_mails where msg_id=" + Request.QueryString.Get("msg_id").ToString());
        da.execute("delete from tbl_mails where msg_id=" + Request.QueryString.Get("msg_id").ToString());
        Response.Redirect("inbox.aspx");
    }
}