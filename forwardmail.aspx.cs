using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class forwardmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            DatabaseAccess da = new DatabaseAccess();
            DataSet ds = new DataSet();
            ds = da.getData("select * from tbl_mails where msg_id=" + Session["forwardmsgid"].ToString());
            subject.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(3).ToString();
            composemessage.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(4).ToString();
            ds = da.getData("select * from tbl_attachments where message_id=" + Session["forwardmsgid"].ToString());
            int i;

            da.execute("delete from tbl_tempattachments");
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                da.execute("insert into tbl_tempattachments(temp_attachment) values('" + ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString() + "')");


            }




        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        fileAttachment.PostedFile.SaveAs(Server.MapPath(Request.ApplicationPath) + "/MessageAttachments/" + fileAttachment.FileName);

        DatabaseAccess da = new DatabaseAccess();
        da.execute("insert into  tbl_tempattachments(temp_attachment) values('" + fileAttachment.FileName + "')");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        int touserid;
        DataSet ds = new DataSet();
        ds = da.getData("select * from tbl_user where email='" + tomailid.Text + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            touserid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        }
        else
        {
            lblmessage.Text = "invalid mail id";


            return;

        }



        //  System.DateTime.Now.Date.ToString()

        int result;
        result = da.execute("insert into tbl_mails(from_user_id,to_user_id,subject,message,mail_status,date,open_status)values(" + Session["FromUserID"].ToString() + "," + touserid.ToString() + ",'" + subject.Text + "','" + composemessage.Text + "',0,'" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "',0)");
        int maxid;
        ds = da.getData("select max(msg_id) from tbl_mails");
        maxid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        ds = da.getData("select * from tbl_tempattachments");
        int i;
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            da.execute("insert into tbl_attachments(message_id,attachment) values(" + maxid.ToString() + ",'" + ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() + "')");



        }
        da.execute("delete from tbl_tempattachments");
        ds=da.getData("select * from tbl_reply where msg_id=" + Session["forwardmsgid"].ToString());
        DatabaseAccess da1 = new DatabaseAccess();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DatabaseAccess da2 = new DatabaseAccess();
        int j;
        int k;
        if (ds.Tables[0].Rows.Count > 0)
        {

            for (j = 0; j < ds.Tables[0].Rows.Count; j++)
            {
                da1.execute("insert into tbl_reply(msg_id,reply_message,date,view_status,from_id,to_id) values(" + maxid.ToString() + ",'" + ds.Tables[0].Rows[j].ItemArray.GetValue(2).ToString() + "','" + System.DateTime.Now.Date.ToString("MM/dd/yyyy") + "',0," + Session["FromUserID"].ToString() + "," + touserid.ToString() + ")");
                int maxreplyid;
                ds2=da2.getData("select max(reply_id) from tbl_reply");
                maxreplyid=int.Parse(ds2.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());
                ds2 = da2.getData("select * from tbl_replyattachments where reply_id=" + ds.Tables[0].Rows[j].ItemArray.GetValue(1).ToString());
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    for (k = 0; k < ds2.Tables[0].Rows.Count; k++)
                    {
                        da2.execute("insert into tbl_replyattachments(msg_id,reply_id,reply_attachments) values(" + maxid.ToString() + "," + maxreplyid.ToString() + ",'" + ds2.Tables[0].Rows[k].ItemArray.GetValue(2).ToString() + "')");
                    }

                }
          }

            









        }





        Response.Redirect("about-us.aspx");
    }
}