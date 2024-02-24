<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
    <style type="text/css">

* { margin: 14px 0px 0px 0px; 
padding: 0px; }
#wrapper { position: relative; display: block; width: 100%; min-height: 100%; background:url('images/bg.jpg') repeat-x left top;
        }

#mainCntr {margin: 0 auto; width:692px; overflow:hidden;}

	#headerCntr { padding:0px; height:358px; width:692px; overflow:hidden; background:url('images/banner.jpg') no-repeat right 168px;
        }
		
		#headerCntr .logo {padding:22px 0px 0px 27px; height:94px;}
		
		a{color:#4E595D; text-decoration:underline; font-weight:normal;}
		.menuCntr{padding:0px 0px 0px 9px; overflow:hidden; height:113px;}				
			.menuCntr ul{ padding:0px; margin:0px; list-style-type:none; }						
			.menuCntr li{ padding:18px 31px 0px 30px; margin:0px; float:left; background:url('images/navi_dot.jpg') no-repeat right 0px;
        }						
			.menuCntr ul li a { line-height:normal; font-weight:normal; color: #ffffff; text-decoration:none; font-size:13px; padding:0px; float:left; font-family:Arial, Helvetica, sans-serif;}						
						
		.headertxt{font-family:Arial, Helvetica, sans-serif; font-size:21px; color:#FFFFFF; display:block; padding:0px 0px 0px 58px; height:129px; background:url('images/navi_img.jpg') no-repeat 10px bottom;
        }
			.header2txt{color:#F69A0B;}
	
	#contentCntr {width:670px; overflow:hidden; padding:0px 12px 0px 10px;}	
		#leftCntr {float:left; width:179px;}				
			.leftmenuCntr{ width:179px; padding:0px; background:url('images/navi_bg2.jpg') repeat-y left top; 
border-bottom:1px solid #EBE8D7;
        }			
				.leftmenuCntr ul{ padding:4px 0px 30px 0px; margin:0px; list-style-type:none;}					
				.leftmenuCntr li{ padding:0px; margin:0px; background:url('images/navi_bo.jpg') repeat-x left bottom;
        }					
				.leftmenuCntr ul li a{ line-height:normal; font-weight:normal; color:#ffffff; text-decoration:none; font-size:11px; background:url('images/navi_dot2.jpg') no-repeat 26px 9px; 
padding:4px 0px 0px 47px; height:20px; display:block;
        }					
				#leftCntr h2 {font-size:16px; line-height: normal; font-weight:normal; color: #ffffff; text-decoration: none; height:27px; font-family:Arial, Helvetica, sans-serif; padding:7px 0px 0px 14px; background-color:#958961;}
			
			.newsbox{ padding:0px 0px 11px 12px; width:167px; color:#4E595D;}			
				.newsbox ul{padding:0px; list-style-type:none; margin:0px;}
					.newsbox li{list-style-type:none; margin:0px;}			
						.newsbox li span{font-size:11px;font-weight:bold;display:block;color:#4E595D; padding-top:13px;}				
						.newsbox li p{padding:5px 0px 11px 0px;}				
						.newsbox li p span{font-size:11px;font-weight:bold;display:inline;color:#BE4808;padding:0px;}										
		
		#rightCntr {float:right; width:472px; overflow:hidden;}		
			.txtbox{padding:30px 0px 27px 0px; overflow:hidden; width:472px;}							
				.style1
        {
            width: 100%;
        }
        .style2
        {
            width: 158px;
        }
        .style5
        {
            width: 364px;
        }
        .style3
        {
            height: 15px;
        }
        .style4
        {
            height: 15px;
            width: 364px;
        }
        .style6
        {
            height: 13px;
        }
        .style7
        {
            height: 13px;
            width: 364px;
        }
        .style10
        {
            height: 31px;
        }
    		.introbox{padding:2px 8px 30px 0px; width:464px; overflow:hidden;}
				#footerCntr {height:56px; font-size: 11px; line-height: normal; color: #ffffff; text-decoration: none; font-weight:normal; background:url('images/footer_bg.jpg') repeat-x left top;
        }	
			#footerCntrouter{width:635px; overflow:hidden; padding:19px 28px 0px 29px; margin:0px auto;}
				#footerCntrleft{float:left; text-align:left;}
				#footerCntrright{float:right; text-align:right;}		
					#footerCntrouter a { font-size: 11px; font-style: normal; line-height: normal; font-weight:bold; color: #ffffff; text-decoration: none; }		
					</style>
</head>


<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
<title>Business.Com</title>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
<meta content="" name="keywords" />
<meta content="" name="description" />
<meta content="" name="robots" />
<!-- change into index, follow -->
    
	<!--[if lte IE 6]>
        <script type="text/javascript" src="javascripts/pngfix.js"></script>
        <script type="text/javascript" src="javascripts/ie6.js"></script>
        <link href="stylesheets/ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<link href="stylesheets/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 158px;
        }
        .style3
        {
            height: 15px;
        }
        .style4
        {
            height: 15px;
            width: 364px;
        }
        .style5
        {
            width: 364px;
        }
        .style6
        {
            height: 13px;
        }
        .style7
        {
            height: 13px;
            width: 364px;
        }
        .style10
        {
            height: 31px;
        }
    .style11
    {
        width: 100%;
    }
    .style12
    {
        width: 26px;
    }
    </style>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager2" runat="server">
            </asp:ScriptManager>
<!--  / WRAPPER \ -->
<div id="wrapper">
	
	<!--  / MAIN CONTAINER \ -->
    <div id="mainCntr">
		
		<!--  / HEADER CONTAINER \ -->
		<div id="headerCntr">
          <!-- / LOGO \ -->
			<div class="logo">
                <a href="index.html">
                
                <img alt="logo" src="images/logo.jpg" /></a>
            </div>
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
		  		<span class="headertxt">Managed <span class="header2txt">Solutions</span><br />
            Reliable Scalable and Effective 
            
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
                <h2>
                    Chat</h2>
                    
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
                                    <td class="style12">
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
            <!--  / TXT BOX \ -->
                <div class="txtbox">
                    &nbsp;<table class="style1">
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style5">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style5">
                                &nbsp;</td>
                        </tr>

                        <% DatabaseAccess da0 = new DatabaseAccess();
                           System.Data.DataSet ds0 = new System.Data.DataSet();
                           ds0 = da0.getData("select name from tbl_user where user_id=" + Request.QueryString.Get("contact_user_id"));
                            
                            %>

                        <tr>
                            <td class="style3" 
                                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #0000FF; font-weight: bold">
                                Chat with <%=ds0.Tables[0].Rows[0].ItemArray.GetValue(0).ToString() %></td>
                            <td class="style4">
                                &nbsp;</td>
                        </tr>



                        <tr>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style4">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="2">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table class="style11">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtMessage" runat="server" Height="314px" TextMode="MultiLine" 
                                                        Width="468px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Timer ID="Timer1" runat="server" Interval="500" ontick="Timer1_Tick">
                                                    </asp:Timer>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                            </td>
                            <td class="style7">
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="368px"></asp:TextBox>
                            </td>
                            <td class="style4">
                                            <asp:Button ID="Button2" runat="server" Text="SEND" Width="67px" 
                                                onclick="Button2_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="2">
                                <table class="style1">
                                    <tr>
                                        <td class="style10">
                                            &nbsp;</td>
                                        <td class="style10">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            &nbsp;</td>
                                        <td class="style3">
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
                <div id="footerCntrleft">
                    Copyright © Company . All Rights Reserved.
                  </div>
                <div id="footerCntrright">
                    <a href="#">Privacy Policy.</a> <a href="privacy.html">Terms of Use.</a>
                </div>
            </div>
    </div>
		<!--  \ FOOTER CONTAINER / -->

</div>
<!--  \ WRAPPER / -->

    </form>


