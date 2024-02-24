<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

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
        .style15
        {
        }
        .style16
        {
        }
        .style17
        {
            width: 155px;
            height: 15px;
        }
        .style18
        {
            height: 15px;
        }
        .style19
        {
            text-align: right;
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
					<li style="background:none; color: #FFFFFF; font-size: medium;">
                        <a href="blanklogout.aspx" 
                            style="font-family: 'Times New Roman', Times, serif; font-weight: bold; font-size: 14px;">Log out</a></li>
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
            <!--  / TXT BOX \ -->
            <div class="txtbox" style="color: #0000FF; font-size: small; font-weight: bold;">
                TYPE NEWS HERE<table class="style1">
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="TextBox1" runat="server" Height="91px" TextMode="MultiLine" 
                                Width="445px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                Text="POST NEWS" Width="118px" ForeColor="#000099" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="successfully posted" 
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style18">
                            </td>
                        <td class="style18">
                            </td>
                    </tr>
                    <tr>
                        <td class="style15" colspan="2">


                       


                            <table class="style1">
                                <tr>
                                    <td class="style18">
                                        
                                    </td>
                                    <td class="style17">
                                       
                                    </td>
                                    <td class="style18">
                                        </td>
                                    <td class="style18">
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style16" colspan="2">
                                         </td>
                                    <td class="style19">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       
                                        </td>

                                    <td class="style19">
                                      

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
