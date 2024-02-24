<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="about_us" %>

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

                    <% DatabaseAccess da = new DatabaseAccess();
                       System.Data.DataSet ds = new System.Data.DataSet();
                       ds = da.getData("select * from tbl_user where user_id=" + Session["FromUserID"]);
                        
                         %>


					<li style="background:none;"><a href="blanklogout.aspx">Log out</a></li>
				       <li>
                           <img alt="" src="UserImages/<%=ds.Tables[0].Rows[0].ItemArray.GetValue(10).ToString()%> "style="height: 30px; width:50px"/>
                           <table class="style1">
                               <tr>
                                   <td style="font-family: 'Times New Roman', Times, serif; font-size: 15px; color: #CC3300; font-weight: bold;">
                                      <%=ds.Tables[0].Rows[0].ItemArray.GetValue(1).ToString()%> </td>
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
                    
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
          <!--  / LEFT CONTAINER \ -->
          <!--  \ LEFT CONTAINER / -->
          <!--  / RIGHT CONTAINER \ -->
          <div id="rightCntr">
        
				<div class="innertext">
				<h1>About Us</h1>
				<div>
				<img src="images/photo-about.jpg" alt="" width="177" height="117" class="aboutus-img" /><br />
				We help organizations across the private, public, and social sectors create the change that matters. We have always helped our clients identify and set the direction toward their most important goals.  Today, we go further: working together to turn these ambitious goals into reality.From the C-suite to the front line, we partner with our clients to transform their organizations in the ways that matter most to them. This means embedding digital, analytics, and design into core processes and mind-sets; building capabilities that help organizations and people to thrive in an ever-changing context; and developing excellence in execution to ensure that actions translate into outcomes, quickly and sustainably.<br />
				<br />
				 <br />
				<br />
				<br />
				</div>
				<div class="clear"></div>
				<div>
				<h5>Our Culture</h5>
				<div>What is culture but a shared set of beliefs, values and practices? Our culture is the foundation of our success and it is completely people oriented, touching lives and making a difference to employees, stakeholders, customers and partners alike. We believe that excellence is not a destination but a journey of continuous improvement and we keenly promote an open culture, encouraging feedback, and actively transforming it into action.</div>
				</div>
				<div class="clear"></div>
				<div class="aboutcolumnzone">
				<div class="aboutcolumn1">
				<div>
				  <h5>Customer Service</h5>
				  <img src="images/ico-med-1.png" alt="" class="abouticon" /> We provide our 
                    customers a wide range of products and mindblowing which satisfy the customers.</div>
				</div>
				<div class="aboutcolumn2">
				<div>
				  <h5>Award Winning</h5>
				  <img src="images/ico-med-2.png" alt="" class="abouticon" /> With awards galore,ICS is one of the most recognized companies in the IT space. Our longstanding reputation is poised to continue with strong growth in the future. We have received innumerable corporate awards that speak for the innovations introduced by us and the various milestones achieved. </div>
				</div>
				<div class="clear"></div>
				<div class="clear"></div>
				</div>
				<div>
				<h5>&nbsp;</h5>
				<div> </div>
				</div>
				
				</div>
         
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
