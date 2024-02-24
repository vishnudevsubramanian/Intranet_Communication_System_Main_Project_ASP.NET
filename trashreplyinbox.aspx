<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trashreplyinbox.aspx.cs" Inherits="trashreplyinbox" %>

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
        }
        .style3
        {
            width: 408px;
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

                    <% DatabaseAccess da0 = new DatabaseAccess();
                       System.Data.DataSet ds0 = new System.Data.DataSet();
                       ds0 = da0.getData("select * from tbl_user where user_id=" + Session["FromUserID"]);
                        
                         %>


					<li style="background:none;"><a href="blanklogout.aspx">Log out</a></li>
				       <li>
                           <img alt="" src="UserImages/<%=ds0.Tables[0].Rows[0].ItemArray.GetValue(10).ToString()%> "style="height: 30px; width:50px"/>
                           <table class="style1">
                               <tr>
                                   <td style="font-family: 'Times New Roman', Times, serif; font-size: 15px; color: #CC3300; font-weight: bold;">
                                      <%=ds0.Tables[0].Rows[0].ItemArray.GetValue(1).ToString()%> </td>
                               </tr>
                           </table>
                       </li>
				 
                 
                 
                 
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
                            <table class="style1">
                                <%
                                    DatabaseAccess da12 = new DatabaseAccess();
                                    System.Data.DataSet ds12 = new System.Data.DataSet();
                                    ds12 = da12.getData("select * from tbl_user");
                                    

                                        for (int j = 0; j < ds12.Tables[0].Rows.Count; j++)
                                        {
                                            if (int.Parse(Session["FromUserID"].ToString()) == int.Parse(ds12.Tables[0].Rows[j].ItemArray.GetValue(0).ToString()))
                                            {
                                                continue;
                                            }
                                            
                                     %>
                                
                                <tr>
                                    <td class="style2">
                                    <%
                                        
if (int.Parse(ds12.Tables[0].Rows[j].ItemArray.GetValue(11).ToString()) == 1) //login check
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

                                      <a href="chat.aspx?contact_user_id=<%=ds12.Tables[0].Rows[j].ItemArray.GetValue(0).ToString()%>" 
                                            style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-style: inherit">  <%=ds12.Tables[0].Rows[j].ItemArray.GetValue(1).ToString()%></a></td>
                                </tr>

                                <% 
                                 
                                        }
                                    %>
                            </table>
            <!--  \ news box / -->
          </div>
          <!--  \ LEFT CONTAINER / -->
          <!--  / RIGHT CONTAINER \ -->
          <div id="rightCntr">
              <div class="txtbox">


<%
    
    DatabaseAccess da = new DatabaseAccess();
    System.Data.DataSet ds = new System.Data.DataSet();
    ds = da.getData("select tbl_reply.reply_id,tbl_reply.reply_message,tbl_reply.date,tbl_user.user_name from tbl_reply,tbl_user where tbl_reply.from_id=tbl_user.user_id and tbl_reply.msg_id =" + Request.QueryString.Get("msg_id").ToString());

    int i;
    for (i = 0; i < ds.Tables[0].Rows.Count; i++)
    {
    
    
     %>





                  <table class="style1">
                      <tr>
                          <td class="style2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              <%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString() %></td>
                          <td>
                              <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString() %></td>
                      </tr>
                      <tr>
                          <td class="style2" colspan="2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() %>
                             
                          </td>
                     
                     
                     
                      </tr>
                      <tr>
                          <td class="style2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style2" colspan="2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                             
                             
                             
                             
                             
                              <table class="style1">
                                  <tr>
                                      <td>
                                          Attachments              <td>
                                          &nbsp;</td>
                                  </tr>



                                   <%
        
        
          DatabaseAccess da1 = new DatabaseAccess();
    System.Data.DataSet ds1 = new System.Data.DataSet();
    ds1 = da.getData("select * from tbl_replyattachments where msg_id=" + Request.QueryString.Get("msg_id").ToString() + " and reply_id=" + ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString());

    int count = int.Parse(ds1.Tables[0].Rows.Count.ToString());
    if (count > 0)
    {

        int j;
        for (j = 0; j < ds1.Tables[0].Rows.Count; j++)
        {
        
         %>
                                  <tr>
                                      <td>
                                          <%= ds1.Tables[0].Rows[j].ItemArray.GetValue(2).ToString()%></td>
                                      <td>
                                          <a href="MessageAttachments/<%=ds1.Tables[0].Rows[j].ItemArray.GetValue(2).ToString()%>"> Download</a></td>
                                  </tr>

<% } %>
<% } %>





                              </table>




                          </td>
                      </tr>
                  </table>
<br /><br /><br /><br /><br /><br /><br />

<%
        
        
}
         %>




            </div>
            <!--  \ TXT BOX / -->
            <!--  / intro box \ -->
            <div class="introbox">
			
              <!--  / solution box \ -->
              <!--  \ solution box / -->
			  
              <!--  / services box \ -->
              <!--  \ services box / -->
			  <%
			 DatabaseAccess da2 = new DatabaseAccess();
    System.Data.DataSet ds2 = new System.Data.DataSet();
    ds2 = da.getData("select * from tbl_trashmail where msg_id=" + Request.QueryString.Get("msg_id").ToString());
			        
			       %>
                  <table class="style1">
                      <tr>
                          <td class="style2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              &nbsp;</td>
                          <td style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style2" colspan="2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              <%=ds2.Tables[0].Rows[0].ItemArray.GetValue(4).ToString()%></td>
                      </tr>
                      <tr>
                          <td class="style2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              &nbsp;</td>
                          <td style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style2" colspan="2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              <table class="style1">
                                  <tr>
                                      <td>
                                          Attachments</td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                 <% 
                                 DatabaseAccess da4 = new DatabaseAccess();
System.Data.DataSet ds4 = new System.Data.DataSet();
ds4 = da.getData("select * from tbl_attachments where message_id=" + Request.QueryString.Get("msg_id").ToString());
                              int count1 = int.Parse(ds4.Tables[0].Rows.Count.ToString());
                              if (count1 > 0)
                              {

                                  int m;
                                  for (m = 0; m < ds4.Tables[0].Rows.Count; m++)
                                  {
                                     
                                     
                                     
                                      %>  
                                 
                                 
                                  <tr>
                                      <td>
                                          <%= ds4.Tables[0].Rows[m].ItemArray.GetValue(2).ToString()%></td>
                                      <td>
                                          <a href="MessageAttachments/<%=ds4.Tables[0].Rows[m].ItemArray.GetValue(2).ToString()%>"> Download</a></td>
                                  </tr>
                                   
                                   <% } %>
                                   <% } %>





                              </table>
                          </td>
                      </tr>
                      <tr>
                          <td class="style2" colspan="2" 
                              style="font-family: 'Times New Roman', Times, serif; font-size: 15px">
                              <table class="style1">
                                  <tr>
                                      <td class="style3">
                                          
                                      </td>
                                      <td>
                                         
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
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
