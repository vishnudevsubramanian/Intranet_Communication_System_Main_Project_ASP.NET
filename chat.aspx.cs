using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string from="";
        string to="";
      

        DatabaseAccess da = new DatabaseAccess();
        DatabaseAccess da1 = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        ds=da.getData("select name from tbl_user where user_id="+ Session["FromUserID"].ToString());
        from=ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
        ds=da.getData("select name from tbl_user where user_id="+ Request.QueryString.Get("contact_user_id"));
        to=ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
        da1.execute("insert into tbl_chat values(" + Request.QueryString.Get("contact_user_id") + "," + Session["FromUserID"].ToString() + "," + Request.QueryString.Get("contact_user_id") + ",'" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") +"','" + from + "','" + to + "','" + TextBox4.Text + "')");
        TextBox4.Text = "";
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select * from tbl_chat where (to_user_id=" + Request.QueryString.Get("contact_user_id") + " and from_user_id=" + Session["FromUserID"].ToString() + ") or (from_user_id="+Request.QueryString.Get("contact_user_id")+ " and contact_id="+Session["FromUserID"].ToString()+") order by time");
        string msg = "";
        string sndr = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
       {
           if (int.Parse(ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()) == int.Parse(Session["FromUserID"].ToString()))
           {
               sndr = "you";
           }
           else
           {
               sndr = ds.Tables[0].Rows[i].ItemArray.GetValue(4).ToString();
           }


           msg = msg + sndr + ":       " + ds.Tables[0].Rows[i].ItemArray.GetValue(6).ToString() + "        at " + ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString() + Environment.NewLine + Environment.NewLine;
        }
        txtMessage.Text = msg;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}