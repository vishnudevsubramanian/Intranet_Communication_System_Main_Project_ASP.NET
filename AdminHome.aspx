<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

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
					<li style="background:none; color: #FFFFFF; font-size: medium;"><a href="blanklogout.aspx">Log out</a></li>
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
                <li><a href="AdminAddDepartment.aspx">Add Department</a></li>
                <li><a href="UserRegistration.aspx">User Registration</a></li>
                <li><a href="report.aspx">Login Schedule </a></li>
                <li><a href="news.aspx">News</a></li>
                
                <li style="color: #FFFFFF; font-size: x-small">&nbsp;<a href="AdminHome.aspx">Home</a></li>
              </ul>
            </div>
            <!-- / LEFT MENU CONTAINER BOX \ -->
            <!-- \ LEFT MENU CONTAINER BOX  /-->
            <!--  / news box \ -->
            <h2>Company News
            <div class="newsbox">
                <p>
                    &nbsp;</p>
              <ul>
                <li> 
                    <table class="style1">


                    <%
                        DatabaseAccess da = new DatabaseAccess();
                        System.Data.DataSet ds = new System.Data.DataSet();
                        ds = da.getData("select * from tbl_news order by date desc");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                
                         %>
                        <tr>
                            <td style="font-family: 'Times New Roman', Times, serif; font-weight: bold; color: #0000FF;">
                               <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString()%></td>
                        </tr>
                        <tr>
                            <td style="font-family: 'Times New Roman', Times, serif; font-weight: bold; color: #0000FF;">
                                <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()%> </td>
                        </tr>




                        <tr>
                            <td style="font-family: 'Times New Roman', Times, serif; font-weight: bold; color: #0000FF">
                                &nbsp;</td>
                        </tr>
                        <%
                                
                            if (i == 1)
                            {
                                break;
                            }
}
                        } %>



                    </table>
&nbsp;</li>
              </ul>
            </div>
              </a>
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