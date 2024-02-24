<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

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
            <div class="txtbox">
              <h1 style="font-family: 'Times New Roman', Times, serif; font-size: x-large; font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User Registration</h1>
              &nbsp;<table class="style1">
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px">
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtName" runat="server" Width="168px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="* enter name"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" 
                            style="color: #CC3300; font-style: normal; font-weight: bold; font-size: 12px;">
                            Address</td>
                        <td class="style4">
                            <asp:TextBox ID="txtAddress" runat="server" Width="177px" Height="53px" 
                                TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="* enter address"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="color: #CC3300; font-weight: bold; font-size: 12px">
                            contact number</td>
                        <td class="style4">
                            <asp:TextBox ID="txtphone" runat="server" ontextchanged="TextBox1_TextChanged" 
                                Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtphone" ErrorMessage="* enter contact no"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" style="color: #CC3300; font-weight: bold; font-size: 12px">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            email</td>
                        <td class="style4" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            <asp:TextBox ID="txtEmail" runat="server" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="* email"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            Date of join</td>
                        <td class="style4">
                            <asp:TextBox ID="txtDOJ" runat="server" Width="169px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtDOJ" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            Designation</td>
                        <td class="style4">
                            <asp:DropDownList ID="ddlDesignation" runat="server" Height="17px" 
                                Width="172px">
                                <asp:ListItem>software designer</asp:ListItem>
                                <asp:ListItem>project developer</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="ddlDesignation" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            Department</td>
                        <td class="style4">
                            <asp:DropDownList ID="ddlDepartment" runat="server" Height="16px" Width="170px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="ddlDepartment" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            User Name</td>
                        <td class="style4">
                            <asp:TextBox ID="txtUserName" runat="server" Width="173px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            Password</td>
                        <td class="style4">
                            <asp:TextBox ID="txtPassword" runat="server" Width="171px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            confirm password</td>
                        <td class="style4">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" Width="171px" 
                                TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="txtConfirmPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style4">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                ErrorMessage="Passwords are not matching"></asp:CompareValidator>
                            </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" style="font-size: 12px; font-weight: bold; color: #CC3300">
                            photograph</td>
                        <td class="style4">
                            <asp:FileUpload ID="filePhotograph" runat="server" Width="167px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="filePhotograph" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5" style="color: #CC3300; font-weight: bold; font-size: small;">
                            alternate mail id</td>
                        <td class="style6">
                            <asp:TextBox ID="TextBox1" runat="server" Width="173px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Button ID="Button1" runat="server" Text="REGISTER" Width="121px" 
                                onclick="Button1_Click" ForeColor="#0000CC" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
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