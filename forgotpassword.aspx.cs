using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class forgotpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DatabaseAccess da = new DatabaseAccess();
        System.Data.DataSet ds = new System.Data.DataSet();
        ds = da.getData("select * from tbl_user where alt_email='" + txtpassword.Text + "' and user_name='" + txtusername.Text + "' and phone='" + TextBox1.Text + "'");
       
        string password="";
        if (ds.Tables[0].Rows.Count > 0)
        {
            password=ds.Tables[0].Rows[0].ItemArray.GetValue(8).ToString();
            try
            {
                var client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("icsvarsha3@gmail.com", "varsh@1029"),
                    EnableSsl = true
                };
                client.Send("icsvarsha3@gmail.com", txtpassword.Text, "recovery",password);

                Console.WriteLine("Sent");
                Console.ReadLine();
                lblMessage.Text = "password successfully sent to your recovery mail";
                

            }
            catch (Exception ex)
            {

            }
        }
        else
        {
            lblMessage.Text = "wrong credentials";
        }

    
    
    
    }





}