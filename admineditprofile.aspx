<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admineditprofile.aspx.cs" Inherits="admineditprofile" %>

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
            width: 158px;
        }
        .style3
        {
            width: 158px;
            height: 15px;
        }
        .style4
        {
            height: 15px;
        }
        .style5
        {
            width: 158px;
            height: 13px;
        }
        .style6
        {
            height: 13px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

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
          <!--  / LEFT CONTAINER \ -->
          <div id="leftCntr">
            <div class="leftmenuCntr">
              <ul>
                <li><a href="AdminAddDepartment.aspx">Add Department</a></li>
                <li><a href="UserRegistration.aspx">User Registration</a></li>
                <li><a href="report.aspx">Login Schedule </a></li>
                <li><a href="news.aspx">News</a></li>
                <li></li>
              </ul>
            </div>
            <!-- / LEFT MENU CONTAINER BOX \ -->
            <!-- \ LEFT MENU CONTAINER BOX  /-->
            <!--  / news box \ -->
            <h2>Company News</h2>
              <a href="#">
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
                            <td style="text-decoration:blink">
                               <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString()%></td>
                        </tr>
                        <tr>
                            <td style="text-decoration:blink">
                                <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()%> </td>
                        </tr>




                        <tr>
                            <td>
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
          <!--  \ LEFT CONTAINER / -->
          <!--  / RIGHT CONTAINER \ -->
          <div id="rightCntr">
            <!--  / TXT BOX \ -->
            <div class="txtbox">
              <h1>User Modification</h1>
              &nbsp;<table class="style1">
                    <tr>
                        <td class="style5">
                            employee id</td>
                        <td class="style6">
                            <asp:TextBox ID="TextBox1" runat="server" Width="168px"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Height="18px" Text="search" 
                                Width="48px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="TextBox2" runat="server" Width="168px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Address</td>
                        <td class="style4">
                            <asp:TextBox ID="TextBox3" runat="server" Width="169px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style4">
                            </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            email</td>
                        <td class="style4">
                            <asp:TextBox ID="TextBox4" runat="server" Width="170px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Designation</td>
                        <td class="style4">
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="17px" Width="172px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Department</td>
                        <td class="style4">
                            <asp:DropDownList ID="DropDownList3" runat="server" Height="18px" Width="173px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Date of Join</td>
                        <td class="style4">
                            <asp:TextBox ID="TextBox5" runat="server" Width="172px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Button ID="Button1" runat="server" Text="MODIFY" Width="121px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
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
                        <td class="style3">
                            &nbsp;</td>
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
                        <td class="style3">
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
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
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
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
