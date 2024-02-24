using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeletetrashMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        da.execute("delete from tbl_trashmail where msg_id=" + Request.QueryString.Get("msg_id").ToString());
        Response.Redirect("trash.aspx");

    }
}