using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blanklogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        DatabaseAccess da = new DatabaseAccess();
        da.execute("update tbl_user set log_in_status=0 where user_id=" + Session["FromUserID"]);
        da.execute("update tbl_login set log_out_time='" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss") + "' where login_no='" + Session["login_no"] + "'");

        Session.Abandon();
        Response.Redirect("Default.aspx");

    }
}