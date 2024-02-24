<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fakeinbox.aspx.cs" Inherits="fakeinbox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 

	<title>Business.Com</title>

	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

	<meta name="keywords" content="" />	
	<meta name="description" content="" />
	<meta name="robots" content="" /><!-- change into index, follow -->
    
	<!--[if lte IE 6]>
        <script type="text/javascript" src="javascripts/pngfix.js"></script>
        <script type="text/javascript" src="javascripts/ie6.js"></script>
        <link rel="stylesheet" href="stylesheets/ie6.css" type="text/css" />
	<![endif]-->

    


    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 20px;
        }
        .style3
        {
            height: 20px;
            width: 31px;
            background-color: #3333CC;
        }
        .style5
        {
            height: 20px;
            color: #FFFFFF;
            background-color: #3333CC;
        }
        .style6
        {
            color: #FFFFFF;
        }
        .style7
        {
            text-align: center;
        }
        .style8
        {
            width: 31px;
        }
        .style9
        {
            width: 112px;
        }
        .style10
        {
            width: 154px;
        }
        .style11
        {
            width: 103px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
<!--  / WRAPPER \ -->
<div id="wrapper">
	
	<!--  / MAIN CONTAINER \ -->
  <div id="mainCntr">
		
		<!--  / HEADER CONTAINER \ -->
		<div id="headerCntr">		  
          <!-- / LOGO \ -->
			<div class="logo"> <a href="index.html"><img src="images/logo.jpg" alt="logo" /></a> </div>
		  <!-- \ LOGO / -->
 			<!-- / MENU CONTAINER \ -->
				 <div class="menuCntr">
				   <ul>
					<li><a href="about-us.aspx">Home</a></li>
					<li><a href="askquestions.aspx">Ask questions</a></li>
					<li><a href="showmysolutions.aspx">View Solutions</a></li>
					   <li>&nbsp;&nbsp;&nbsp;&nbsp; </li>
					<li style="background:none;"><a href="blanklogout.aspx">Log out</a></li>
				  </ul>
				</div>
			    <!-- \  MENU CONTAINER  /-->  
		  		<span class="headertxt">
				Managed <span class="header2txt">Solutions</span><br />Reliable Scalable and Effective
				
				</span>
      </div>
	  <!--  \ HEADER CONTAINER / -->
      <!--  / CONTENT CONTAINER \ -->
      <div id="contentCntr">
          <!--  / LEFT CONTAINER \ -->
          <div id="leftCntr">
            <div class="leftmenuCntr">
              <ul>
                <li><a href="composemsg.aspx">compose mail</a></li>
                <li><a href="inbox.aspx">inbox</a></li>
                <li><a href="draft.aspx">drafts</a></li>
                <li><a href="sent.aspx">sent mail</a></li>
                <li><a href="allmail.aspx">all mail</a></li>
                <li><a href="trash.aspx">trash</a></li>
                  <li></li>
              </ul>
            </div>
            <!-- / LEFT MENU CONTAINER BOX \ -->
            <!-- \ LEFT MENU CONTAINER BOX  /-->
            <!--  / news box \ -->
            <h2>Chat</h2>
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style1">
                                <%
                                    DatabaseAccess da = new DatabaseAccess();
                                    System.Data.DataSet ds = new System.Data.DataSet();
                                    ds = da.getData("select * from tbl_user");
                                    

                                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                        {
                                            if (int.Parse(Session["FromUserID"].ToString()) == int.Parse(ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()))
                                            {
                                                continue;
                                            }
                                            
                                     %>
                                
                                <tr>
                                    <td class="style2">
                                    <%
                                        
if (int.Parse(ds.Tables[0].Rows[i].ItemArray.GetValue(11).ToString()) == 1) //login check
{
                                            
                                       
                                         %>
                                        <img alt="" src="images/download.jfif" width=10 height=10 />
                                        <%
}
else
{
                                            
                                            
                                             %>
                                             <img alt="" src="images/images.jfif" width=10 height=10 />
                                             <%
} 
                                        %>
                                    </td>

                                    <td>

                                      <a href="chat.aspx?contact_user_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()%>" 
                                            style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-style: inherit">  <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()%></a></td>
                                </tr>

                                <% 
                                 
                                        }
                                    %>
                            </table>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                    
            <!--  \ news box / -->
          </div>
          <!--  \ LEFT CONTAINER / -->
          <!--  / RIGHT CONTAINER \ -->
          <div id="rightCntr">
              <div class="txtbox">
                  <table class="style1">
                      <tr>
                          <td>
                              <asp:Label ID="lblMessage" runat="server"></asp:Label>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <table class="style1">
                                  <tr>
                                      <td class="style7">
                                          <asp:TextBox ID="TextBox1" runat="server" Width="322px" placeholder="enter subject to search"></asp:TextBox>
                                          
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                              </table>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr style="font-size: large">
                          <td style="font-family: 'Times New Roman', Times, serif; font-size: 24px; font-weight: bold; color: #CC3300;">
                              <br />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  INBOX&nbsp;&nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
              </div>
            <!--  \ TXT BOX / -->
            <!--  / intro box \ -->
            <div class="introbox">
			
              <!--  / solution box \ -->
              <!--  \ solution box / -->
			  
              <!--  / services box \ -->
              <!--  \ services box / -->
			  
                <table class="style1">
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style5">
                            From</td>
                        <span class="style6">
                        <td class="style5">
                            subject</td>
                        <td class="style5">
                            date</span></td>
                        <td class="style2">
                        </td>
                    </tr>
                    
    
                            

                             


                </table>
			  
                <br />
                <table class="style1">

                <%
                    DatabaseAccess da = new DatabaseAccess();
                    System.Data.DataSet ds = new System.Data.DataSet();
                    ds = da.getData("select tbl_mails.msg_id,tbl_user.name,tbl_mails.subject,tbl_mails.date,tbl_mails.to_user_id,tbl_mails.from_user_id,tbl_mails.mail_status,tbl_mails.open_status from tbl_mails,tbl_user where tbl_user.user_id=tbl_mails.to_user_id and (tbl_mails.to_user_id=" + Session["FromUserID"] + " or tbl_mails.from_user_id="+ Session["FromUserID"] + ") and tbl_mails.mail_status=0 order by tbl_mails.date desc");
                   int i;
                   int open_status;

                   if (ds.Tables[0].Rows.Count > 0)
                   {
                       for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                       {
                           
                           DatabaseAccess da1 = new DatabaseAccess();
                           System.Data.DataSet ds1 = new System.Data.DataSet();
                           ds1 = da1.getData("select reply_id,from_id,to_id,view_status from tbl_reply where msg_id=" + ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()+" and to_id=" + Session["FromUserID"] +" order by date desc");
                           if (ds1.Tables[0].Rows.Count > 0) // if msg has replies
                           {
                               for (int j = 0; j < 1; j++)
                               {
                                   if(int.Parse(ds1.Tables[0].Rows[j].ItemArray.GetValue(3).ToString())==0)
                                   {
                                   
                                                     
                                                            
                                     %>

                                                                  <tr style="font-weight:bold">
                                                                    

                                                        <%

                                   } //five
                                   else 
                                   {
                                       
                                                                                            %>
                                                                                            <tr >
                                                                                            <%}
                                   %>
                                                                                             <td class="style8">
                                                                                               </td>
                                                                                               <td class="style9">
                                                                                               <a href="replyinbox.aspx?msg_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()%>">reply,<%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()%></a></td>
                                                                                             <td class="style10">
                                                                                            </td>
                                                                                             <td class="style10">
                                                                                               <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString()%></td>
                                                                                              <td class="style11">
                                                                                         <%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString()%></td>
                                                                                         <td>
                                                                                           &nbsp;</td>
                                                                                             </tr>
                                                                                       <%}
                                                                                            

                                   

                               } // four 

                           else if (int.Parse(ds.Tables[0].Rows[i].ItemArray.GetValue(4).ToString()) == int.Parse(Session["FromUserID"].ToString()))
                           {
                               DatabaseAccess da0 = new DatabaseAccess();
                               System.Data.DataSet ds0 = new System.Data.DataSet();
                               ds0 = da0.getData("select name from tbl_user where user_id=" + ds.Tables[0].Rows[i].ItemArray.GetValue(5).ToString());
                               if (int.Parse(ds.Tables[0].Rows[i].ItemArray.GetValue(7).ToString())==0)
                                   
                               {
                                    %>

                                                                  <tr style="font-weight:bold">
                                                                    

                                                        <%
                               }
                                   else if (int.Parse(ds.Tables[0].Rows[i].ItemArray.GetValue(7).ToString())==1)
                                   {
                                       %>
                                                             <tr >
                                                                    <%
                                   }                
                                   
                                   %>
                                   
                                   
                                                                                                <td class="style8">
                                                                                               </td>
                                                                                               <td class="style9">
                                                                                               <a href="viewinbox.aspx?msg_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()%>"><%=ds0.Tables[0].Rows[0].ItemArray.GetValue(0).ToString()%></a></td>
                                                                                             <td class="style10">
                                                                                            </td>
                                                                                             <td class="style10">
                                                                                               <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString()%></td>
                                                                                              <td class="style11">
                                                                                         <%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString()%></td>
                                                                                         <td>
                                                                                           &nbsp;</td>
                                                                                             </tr>
                                   
                                   <%
                           }
                       }
                   }
                            %>











                                   
                             
                             



                </table>
			  
            </div>
            <!--  \ intro box / -->
          </div>
          <!--  \ RIGHT CONTAINER / -->
        </div>
      <!--  \ CONTENT CONTAINER / -->
    </div>
	<!--  \ MAIN CONTAINER / -->

		<!--  / FOOTER CONTAINER \ -->
		<div id="footerCntr">
			<div id="footerCntrouter">
				<div id="footerCntrleft">Copyright &copy; Company . All Rights Reserved.			
				</div>
				<div id="footerCntrright">
				<a href="#"> Privacy Policy.</a> <a href="privacy.html">Terms of Use.</a> 
				</div>
			</div>
		</div>
		<!--  \ FOOTER CONTAINER / -->

</div>
<!--  \ WRAPPER / -->

    </form>

</body>

</html>
