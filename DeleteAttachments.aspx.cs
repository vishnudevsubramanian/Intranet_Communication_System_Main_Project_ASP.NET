using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteAttachments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        da.execute("delete from tbl_tempattachments where temp_attachment_id=" + Request.QueryString.Get("tempID").ToString());
        Session["i"] = 1;
        Response.Redirect("composemsg.aspx");
    }
}