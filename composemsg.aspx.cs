using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data ;
public partial class composemsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (int.Parse(Session["i"].ToString()) == 0)
            {
                DatabaseAccess da = new DatabaseAccess();
                da.execute("delete from tbl_tempattachments");
            }

        }
       // tomailid.Text = Session["FromEmailID"].ToString();
       // Session["fromEmailID"] = "";
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

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
        DataSet ds=new DataSet();
        ds=da.getData("select * from tbl_user where email='"+ tomailid.Text +"'");
        if(ds.Tables[0].Rows.Count >0)
        {
            touserid=int.Parse(  ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        }
        else
        {
            lblmessage.Text = "invalid mail id";

           
            return ;

        }



      //  System.DateTime.Now.Date.ToString()

        int result;
        result = da.execute("insert into tbl_mails(from_user_id,to_user_id,subject,message,mail_status,date,open_status)values(" + Session["FromUserID"].ToString() + "," + touserid.ToString() + ",'" + subject.Text + "','" + composemessage.Text + "',0,'" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "',0)");
        int maxid;
        
        ds = da.getData("select max(msg_id)  from tbl_mails");
       
       
        maxid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());
        
        ds = da.getData("select * from tbl_tempattachments");
        int i;
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            da.execute("insert into tbl_attachments(message_id,attachment) values(" + maxid.ToString() + ",'" + ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() + "')");



        }
        da.execute("delete from tbl_tempattachments");
 lblmessage.Text = "mail sent";
        int t = 10;
        while (t > 0)
        {
           
            lblmessage.Visible = true;
            if (t == 1)
            {
                lblmessage.Text = "";
                break;
             
            }
            t--;

        }

       Response.Redirect("inbox.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
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
        result = da.execute("insert into tbl_mails(from_user_id,to_user_id,subject,message,mail_status,date,open_status)values(" + Session["FromUserID"].ToString() + "," + touserid.ToString() + ",'" + subject.Text + "','" + composemessage.Text + "',1,'" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss") + "',1)");
        int maxid;
        ds = da.getData("select max(msg_id)  from tbl_mails");
        maxid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        ds = da.getData("select * from tbl_tempattachments");
        int i;
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            da.execute("insert into tbl_attachments(message_id,attachment) values(" + maxid.ToString() + ",'" + ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() + "')");



        }
        da.execute("delete from tbl_tempattachments");
      

        Response.Redirect("inbox.aspx");
    }
}