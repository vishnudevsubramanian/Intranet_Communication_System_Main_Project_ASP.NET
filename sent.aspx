<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sent.aspx.cs" Inherits="sent" %>

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
        .style4
        {
            width: 31px;
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
            height: 20px;
            color: #FFFFFF;
            background-color: #3333CC;
            width: 137px;
        }
        .style8
        {
            width: 137px;
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
                              <asp:TextBox ID="TextBox1" runat="server" Width="392px" placeholder="enter subject to search"></asp:TextBox>
                              <asp:Button ID="Button1" runat="server" Height="18px" onclick="Button1_Click" 
                                  Text="search" />
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td style="font-family: 'Times New Roman', Times, serif; font-size: 25px; color: #CC3300; font-weight: bold;">
                              <br />
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              SENT MAILS</td>
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
                        <td class="style7">
                            to</td>
                        <span class="style6">
                        <td class="style5">
                            subject</td>
                        <td class="style5">
                            date</span></td>
                        <td class="style2">
                        </td>
                    </tr>
                    
            <%            
                DatabaseAccess da = new DatabaseAccess();
                System.Data.DataSet ds = new System.Data.DataSet();
                ds = da.getData("select tbl_user.name, tbl_mails.subject,tbl_mails.date,tbl_mails.msg_id,tbl_mails.open_status from tbl_user,tbl_mails where tbl_user.user_id =tbl_mails.to_user_id and tbl_mails.from_user_id=" + Session["FromUserID"].ToString()+ " and tbl_mails.mail_status=0 order by date desc");
                int i;
                
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    
                    
                
                 %>        

                   
                 
                  
                  <tr>
                 
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style8" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: 100; font-style: normal">
                        <%                    
                    
DatabaseAccess da3 = new DatabaseAccess();
System.Data.DataSet ds3 = new System.Data.DataSet();
ds3 = da3.getData("select count(*) from tbl_reply where msg_id=" + ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString() );
int count1 = int.Parse(ds3.Tables[0].Rows[0].ItemArray.GetValue(0).ToString());

if (count1 > 0)
{
                    
                    
                     %> 
                         <a href="sentreply.aspx?msg_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString() %>">     <%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()%></a></td>
                      <% }
else
{ %>
                     
                        <a href="sentopen.aspx?msg_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString() %>">     <%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()%></a></td>
                     <% } %>
                       
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: 100; font-style: normal">
                            <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() %></td>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: 100; font-style: normal">
                           <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString() %></td>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: 100; font-style: normal">
                           <a href="DeleteInboxMsg.aspx?msg_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString() %>"> del</a></td>
                    
              

</tr>

                    <%
                    
                    

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
