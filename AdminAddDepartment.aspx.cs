using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class AdminAddDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DatabaseAccess da = new DatabaseAccess();
            DataSet ds = new DataSet();
            ds = da.getData("select * from tbl_dept");
            lstDepartments.DataSource = ds.Tables[0];
            lstDepartments.DataTextField = "dept_name";
            lstDepartments.DataValueField = "dept_id";
            lstDepartments.DataBind();





        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        DataSet ds = new DataSet();
        ds=da.getData("select * from tbl_dept where dept_name='" +txtDepartmentName.Text + "'" );
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblMessage.Text = "department already exists with the same name";
            return;
        }
        int result;
        result = da.execute("insert into tbl_dept(dept_name) values('" + txtDepartmentName.Text + "')");
        if (result == 1)
        {
            lblMessage.Text = "Inserted sucessfully";

            lstDepartments.Items.Clear();
            
            ds = da.getData("select * from tbl_dept");
            lstDepartments.DataSource = ds.Tables[0];
            lstDepartments.DataTextField = "dept_name";
            lstDepartments.DataValueField = "dept_id";
            lstDepartments.DataBind();
        }
        else
        {
            lblMessage.Text = "Insertion Failed";
        }
    }
    protected void lstDepartments_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtDepartmentName.Text = lstDepartments.SelectedItem.Text;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        int result;
        result = da.execute("delete from tbl_dept where dept_id=" + lstDepartments.SelectedValue.ToString());
        if (result == 1)
        {
            lblMessage.Text = "deleted sucessfully";
            txtDepartmentName.Text = "";
            lstDepartments.Items.Clear();
            DataSet ds = new DataSet();
            ds = da.getData("select * from tbl_dept");
            lstDepartments.DataSource = ds.Tables[0];
            lstDepartments.DataTextField = "dept_name";
            lstDepartments.DataValueField = "dept_id";
            lstDepartments.DataBind();
        }
        else
        {
            lblMessage.Text = "deletion Failed";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        DataSet ds = new DataSet();
        ds = da.getData("select * from tbl_dept where dept_name='" + txtDepartmentName.Text + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblMessage.Text = "department already exists with the same name";
            return;
        }
        int result;
        result = da.execute("update tbl_dept set dept_name='" +txtDepartmentName.Text + "' where dept_id=" + lstDepartments.SelectedValue.ToString());
        if (result == 1)
        {
            lblMessage.Text = "updated sucessfully";

            lstDepartments.Items.Clear();
            
            ds = da.getData("select * from tbl_dept");
            lstDepartments.DataSource = ds.Tables[0];
            lstDepartments.DataTextField = "dept_name";
            lstDepartments.DataValueField = "dept_id";
            lstDepartments.DataBind();
        }
        else
        {
            lblMessage.Text = "update Failed";
        }
    }
}