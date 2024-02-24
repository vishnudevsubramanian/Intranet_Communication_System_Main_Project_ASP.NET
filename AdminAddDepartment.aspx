<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminAddDepartment.aspx.cs" Inherits="AdminAddDepartment" %>

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
            width: 95px;
        }
        .style3
        {
            width: 109px;
        }
        .style4
        {
            width: 95px;
            height: 114px;
        }
        .style5
        {
            height: 114px;
        }
        .style6
        {
            height: 27px;
        }
        .style7
        {
            text-align: center;
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
          <!--  \ LEFT CONTAINER / -->
          <!--  / RIGHT CONTAINER \ -->
          <div id="rightCntr">
            <!--  / TXT BOX \ -->
            <div class="txtbox">
              <h1 class="style7" 
                    style="font-family: 'Times New Roman', Times, serif; font-weight: bold;">Departments</h1>
              &nbsp;<asp:UpdatePanel 
                    ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style2" 
                                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #0000FF">
                                    Departments</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:ListBox ID="lstDepartments" runat="server" AutoPostBack="True" 
                                        Height="112px" onselectedindexchanged="lstDepartments_SelectedIndexChanged" 
                                        Width="155px"></asp:ListBox>
                                </td>
                                <td class="style5" valign="top">
                                    <table class="style1">
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style3" 
                                                style="color: #0000FF; font-family: 'Times New Roman', Times, serif; font-size: medium">
                                                &nbsp;Department</td>
                                            <td>
                                                <asp:TextBox ID="txtDepartmentName" runat="server" Width="129px" Height="30px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txtDepartmentName" ErrorMessage="enter dept"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td valign="top">
                                    <table class="style1">
                                        <tr>
                                            <td class="style6">
                                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" 
                                                    Width="62px" Font-Bold="True" Font-Names="Times New Roman" 
                                                    Font-Size="Medium" ForeColor="#0000CC" />
                                            </td>
                                            <td class="style6">
                                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Delete" 
                                                    Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" 
                                                    ForeColor="#0000CC" />
                                            </td>
                                            <td class="style6">
                                                <asp:Button ID="Button3" runat="server" Text="Modify" onclick="Button3_Click" 
                                                    Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" 
                                                    ForeColor="#0000CC" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" colspan="2">
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                            </td>
                                            <td class="style6">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
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