using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class opendraft : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DatabaseAccess da = new DatabaseAccess();
            DatabaseAccess da2 = new DatabaseAccess();
            System.Data.DataSet ds = new System.Data.DataSet();
            System.Data.DataSet ds2 = new System.Data.DataSet();

            ds = da.getData("select * from tbl_mails where msg_id=" + Request.QueryString.Get("msg_id").ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    ds2 = da2.getData("select email from tbl_user where user_id=" + ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString());
                    TextBox1.Text = ds2.Tables[0].Rows[i].ItemArray.GetValue(0).ToString();
                    TextBox2.Text = ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString();
                    TextBox3.Text = ds.Tables[0].Rows[i].ItemArray.GetValue(4).ToString();

                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        int touserid;
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select * from tbl_user where email='" +TextBox1.Text + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            touserid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        }
        else
        {
            Label1.Text = "invalid mail id";


            return;

        }



        //  System.DateTime.Now.Date.ToString()

        int result;
        result = da.execute("update tbl_mails set from_user_id=" + Session["FromUserID"].ToString() + ",to_user_id=" + touserid.ToString() + ",subject='" + TextBox2.Text + "',message='" + TextBox3.Text + "',mail_status=0,date='" + System.DateTime.Now.Date.ToString("MM/dd/yyyy") + "' where msg_id=" + Request.QueryString.Get("msg_id").ToString());
        //int maxid;
        //ds = da.getData("select max(msg_id)  from tbl_mails");
        //maxid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        ds = da.getData("select * from tbl_tempattachments");
        int i;
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            da.execute("insert into tbl_attachments(message_id,attachment) values(" + Request.QueryString.Get("msg_id").ToString() + ",'" + ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() + "')");



        }
        da.execute("delete from tbl_tempattachments");
        da.execute("update tbl_mails set mail_status=0 where msg_id=" + Request.QueryString.Get("msg_id").ToString());
        Response.Redirect("UserHome.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sub = "";
        string content = "";
        sub = TextBox2.Text;
        content = TextBox3.Text;



         DatabaseAccess da = new DatabaseAccess();
        int touserid;
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select * from tbl_user where email='" + TextBox1.Text + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            touserid = int.Parse(ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

        }
        else
        {
            Label1.Text = "invalid mail id";


            return;

        }



        //  System.DateTime.Now.Date.ToString()

        int result;
        result = da.execute("update tbl_mails set from_user_id=" + Session["FromUserID"].ToString() + ",to_user_id=" + touserid.ToString() + ",subject='" + sub.ToString() + "',message='" + content.ToString() + "',mail_status=1,date='" + System.DateTime.Now.Date.ToString("MM/dd/yyyy") + "' where msg_id=" + Request.QueryString.Get("msg_id").ToString());
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
        Response.Redirect("UserHome.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload1.PostedFile.SaveAs(Server.MapPath(Request.ApplicationPath) + "/MessageAttachments/" + FileUpload1.FileName);

        DatabaseAccess da = new DatabaseAccess();
        da.execute("insert into  tbl_tempattachments(temp_attachment) values('" + FileUpload1.FileName + "')");
    }
}
