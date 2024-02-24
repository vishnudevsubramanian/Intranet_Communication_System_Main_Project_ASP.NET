<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        Session["i"] = 0;
        Session["FromEmailID"] = "";
        Session["Msg"] = "";
        Session["qtn"] = "";
        Session["search"] = "";
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        DatabaseAccess da = new DatabaseAccess();
        da.execute("update tbl_user set log_in_status=0 where user_id=" + Session["FromUserID"]);
        da.execute("update tbl_login set log_out_time='" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss") + "' where login_no='" + Session["login_no"] + "'");
        Session["qtn"] = "-select-";
        Session.Abandon();
    }
       
</script>
