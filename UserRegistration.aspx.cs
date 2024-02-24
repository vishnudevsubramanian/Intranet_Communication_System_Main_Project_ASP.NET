using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DatabaseAccess da = new DatabaseAccess();
            DataSet ds = new DataSet();
            ds = da.getData("Select * from tbl_dept");
            ddlDepartment.DataSource = ds.Tables[0];
            ddlDepartment.DataTextField = "dept_name";
            ddlDepartment.DataValueField = "dept_id";
            ddlDepartment.DataBind();


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DatabaseAccess da1 = new DatabaseAccess();
        System.Data.DataSet ds1 = new System.Data.DataSet();
        ds1 = da1.getData("select * from tbl_user where user_name='" + txtUserName.Text + "'");
        if (ds1.Tables[0].Rows.Count > 0)
        {
            lblMessage.Text = "user name already exists";
            return;


        }
       
        ds1 = da1.getData("select * from tbl_user where email='" + txtEmail.Text + "'");
        if (ds1.Tables[0].Rows.Count > 0)
        {
            lblMessage.Text = "email id already exists";
            return;


        }



        DatabaseAccess da2 = new DatabaseAccess();
        System.Data.DataSet ds2 = new System.Data.DataSet();
        ds2 = da2.getData("select * from tbl_user where email='" + txtEmail.Text + "'");
        if (ds2.Tables[0].Rows.Count > 0)
        {
            lblMessage.Text = "email already exists";
            return;

        }
        filePhotograph.PostedFile.SaveAs(Server.MapPath(Request.ApplicationPath) + "/UserImages/" + filePhotograph.FileName);
        DatabaseAccess da = new DatabaseAccess();
        int result;
        result = da.execute("insert into tbl_user(log_in_status,name,address,phone,email,dept_id,designation,user_name,password,doj,photo,alt_email) values(0,'" + txtName.Text + "','" + txtAddress.Text + "','" + txtphone.Text + "','" + txtEmail.Text + "'," + ddlDepartment.SelectedValue.ToString() + ",'" + ddlDesignation.Text +"','" + txtUserName.Text + "','" + txtPassword.Text + "','" + txtDOJ.Text.ToString() + "','" + filePhotograph.FileName + "','" + TextBox1.Text + "')");
        if (result == 1)
        {
            lblMessage.Text = "Inserted sucessfully";
            txtAddress.Text = "";
            txtConfirmPassword.Text = "";
            txtDOJ.Text = "";
            txtEmail.Text = "";
            txtName.Text = "";
            txtPassword.Text = "";
            txtphone.Text = "";
            txtUserName.Text = "";
            TextBox1.Text = "";

           
        }
        else
        {
            lblMessage.Text = "Insertion Failed";
        }
    }
protected void  TextBox1_TextChanged(object sender, EventArgs e)
{

}
}