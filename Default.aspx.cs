using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ddlusertype.Text == "Admin")
        {

            DatabaseAccess da = new DatabaseAccess();
            DataSet ds = new DataSet();
            ds = da.getData("select * from tbl_Admin where Username='" + txtusername.Text + "' and Password='" + txtpassword.Text + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {

                Response.Redirect("AdminHome.aspx");

            }
            else
            {

                lblMessage.Text = "Invalid Login";

            }




        }
        else if (ddlusertype.Text == "Staff")
        {

            DatabaseAccess da = new DatabaseAccess();
            DataSet ds = new DataSet();
            ds = da.getData("select * from tbl_user where User_name='" + txtusername.Text + "' and Password='" + txtpassword.Text + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["login_no"] = Guid.NewGuid();
                Session["FromUserID"] = ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
                da.execute("update tbl_user set log_in_status=1 where user_id=" + ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());
                da.execute("insert into tbl_login(user_id,name,email,login_date_time,dept,login_no) values(" + ds.Tables[0].Rows[0].ItemArray.GetValue(0).ToString() + ",'" + txtusername.Text + "','" + ds.Tables[0].Rows[0].ItemArray.GetValue(4).ToString() + "','" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss") + "','" + ds.Tables[0].Rows[0].ItemArray.GetValue(6).ToString() + "','" + Session["login_no"] + "')");
                Response.Redirect("about-us.aspx");

            }
            else
            {

                lblMessage.Text = "Invalid Login";

            }



        }
    }
}