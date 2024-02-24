using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tomailid.Text = Session["FromEmailID"].ToString();
        subject.Text = Session["subject"].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        fileAttachment.PostedFile.SaveAs(Server.MapPath(Request.ApplicationPath) + "/MessageAttachments/" + fileAttachment.FileName);

        DatabaseAccess da = new DatabaseAccess();
        da.execute("insert into  tbl_reply_tempattachment(temp_attachment) values('" + fileAttachment.FileName + "')");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
         DatabaseAccess da = new DatabaseAccess();
                System.Data.DataSet ds = new System.Data.DataSet();
        ds=da.getData("select user_id from tbl_user where email='" + tomailid.Text +"'");
        int toreply=int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());
        da.execute("insert into tbl_reply(msg_id,reply_message,date,from_id,to_id,view_status)Values(" + Session["msg_id"].ToString() + ",'" + composemessage.Text + "','" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "'," + Session["FromUserID"].ToString() + "," + toreply.ToString() + ",0)");

                ds = da.getData("select max(reply_id) from tbl_reply");
                int maxid = int.Parse( ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        
        
        ds = da.getData("select * from tbl_reply_tempattachment");
                int i;
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    da.execute("insert into tbl_replyattachments(msg_id,reply_id,reply_attachments) values(" + Session["msg_id"].ToString() + "," + maxid.ToString() + ",'" + ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() + "')");



                }
                da.execute("delete from tbl_reply_tempattachment");
               Session["Msg"] = "successfully replied";
               Response.Redirect("inbox.aspx");
    }
}