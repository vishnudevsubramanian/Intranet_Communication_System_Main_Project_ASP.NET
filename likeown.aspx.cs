using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class likeown : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select * from tbl_likes where liked_user_id=" + Session["FromUserID"] + " and answer_id=" + Request.QueryString.Get("ans_id").ToString());
        if (ds.Tables[0].Rows.Count == 0)
        {
            da.execute("update tbl_answers set likes=likes+1 where answer_id=" + Request.QueryString.Get("ans_id").ToString());
            da.execute("insert into tbl_likes values(" + Request.QueryString.Get("ans_id").ToString() + "," + Session["FromUserID"]+")");
            
        }
        Response.Redirect("showmysolutionafterlike.aspx?qid=" + Request.QueryString.Get("qid").ToString());
    }
}