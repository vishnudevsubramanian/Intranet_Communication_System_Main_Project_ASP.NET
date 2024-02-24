using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class showmysolutions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            DatabaseAccess da = new DatabaseAccess();
            System.Data.DataSet ds = new System.Data.DataSet();
            ds = da.getData("select * from tbl_question where user_id=" +Session["FromUserID"]);
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = "question";
            DropDownList1.DataValueField = "q_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "-select-");
          //  DropDownList1.SelectedItem.Text  = Session["qtn"].ToString();

        }
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Session["qtn"] = DropDownList1.SelectedItem.Text;

    }
}