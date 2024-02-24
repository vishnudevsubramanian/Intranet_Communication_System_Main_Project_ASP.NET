using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class trashdraftopen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DatabaseAccess da = new DatabaseAccess();
            DatabaseAccess da2 = new DatabaseAccess();
            System.Data.DataSet ds = new System.Data.DataSet();
            System.Data.DataSet ds2 = new System.Data.DataSet();

            ds = da.getData("select * from tbl_trashmail where msg_id=" + Request.QueryString.Get("msg_id").ToString());
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
}