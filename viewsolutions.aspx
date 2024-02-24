<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewsolutions.aspx.cs" Inherits="viewsolutions" %>

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
        .style14
        {
            width: 27px;
        }
        .style15
        {
        }
        .style16
        {
        }
        .style17
        {
            width: 155px;
        }
        .style18
        {
            height: 15px;
        }
        .style19
        {
            width: 392px;
        }
        .style20
        {
            height: 15px;
            width: 392px;
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
          <!--  / LEFT CONTAINER \ -->
          <div id="leftCntr">
            <!-- / LEFT MENU CONTAINER BOX \ -->
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
                                    <td class="style14">
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

                                      <a href="chat.aspx?contact_user_id=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString()%>">  <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()%></a></td>
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
            <!--  / TXT BOX \ -->
            <div class="txtbox" style="color: #000000">
                <table class="style1">

                <%
                    DatabaseAccess da5=new DatabaseAccess();
                    System.Data.DataSet ds5 = new System.Data.DataSet();
                    ds5 = da5.getData("select * from tbl_question where q_id=" + Request.QueryString.Get("qid").ToString());
                    
                                             %>

                    <tr>
                        <td colspan="2" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                            <%=ds5.Tables[0].Rows[0].ItemArray.GetValue(1).ToString() %></td>
                    </tr>



                    <tr>
                        <td colspan="2" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                            &nbsp;</td>
                    </tr>


                    <% DatabaseAccess da8 = new DatabaseAccess();
                       System.Data.DataSet ds8 = new System.Data.DataSet();
                       ds8 = da8.getData("select * from tbl_answers where q_id=" + Request.QueryString.Get("qid").ToString()+ " order by likes desc");
                        int k;
                        if (ds8.Tables[0].Rows.Count > 0)
                        {
                            for (k = 0; k < ds8.Tables[0].Rows.Count; k++)
                            {
                                    
                                                
                        %>



                    <tr>
                        <td 
                            
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                            answer by: <%=ds8.Tables[0].Rows[k].ItemArray.GetValue(4).ToString()%> </td>
                        <td 
                            
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                            &nbsp;</td>
                    </tr>



                    <tr>
                        <td 
                            
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                           <%= ds8.Tables[0].Rows[k].ItemArray.GetValue(2).ToString()%></td>
                        <td 
                            
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                            <a href="likeanswer.aspx?ans_id=<%=ds8.Tables[0].Rows[k].ItemArray.GetValue(0).ToString() %>&qid=<%=ds8.Tables[0].Rows[k].ItemArray.GetValue(1).ToString() %>">like</a></td>
                    </tr>
                  


                    <tr>
                        <td class="style20">
                            <%=ds8.Tables[0].Rows[k].ItemArray.GetValue(5).ToString()%> likes</td>
                        <td class="style18">
                            </td>
                    </tr>





                    <tr>
                        <td class="style20">
                            &nbsp;</td>
                        <td class="style18">
                            &nbsp;</td>
                    </tr>



                      <%
}
                        }
                        else
                        {
                             %>
                             <tr>
                        <td 
                            
                            style="font-family: 'Times New Roman', Times, serif; font-size: large; color: #CC3300; font-weight: bold">
                           no answers</td>
                        <td 

                    <tr>
                    <%}
                         %>
                        <td class="style20">
                        </td>
                        <td class="style18">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style19">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style20">
                            </td>
                        <td class="style18">
                            </td>
                    </tr>
                    <tr>
                        <td class="style15" colspan="2">





                            <table class="style1">
                                <tr>
                                    <td class="style16">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style16" colspan="2">
                                         </td>
                                    <td>
                                        &nbsp;</td>

                                    <td>
                                        &nbsp;</td>

                                </tr>
                                <tr>
                                    <td class="style16" colspan="2">
                                         &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>




                        </td>
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
