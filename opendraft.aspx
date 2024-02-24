<%@ Page Language="C#" AutoEventWireup="true" CodeFile="opendraft.aspx.cs" Inherits="opendraft" %>

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
        .style8
        {
            background-color: #BE4808;
        }
        .style9
        {
            color: #FFFFFF;
        }
        .style10
        {
            height: 31px;
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
            <!-- / LEFT MENU CONTAINER BOX \ -->
            <div class="leftmenuCntr">
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
            <!--  / TXT BOX \ -->
            <div class="txtbox">
                COMPOSE MAIL&nbsp;<table class="style1">
                    <tr>
                        <td class="style2">
                            To</td>
                        <td class="style5">
                            <asp:TextBox ID="TextBox1" runat="server" Width="250px" 
                                 ToolTip="Recipients"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Subject</td>
                        <td class="style4">
                            <asp:TextBox ID="TextBox2" runat="server" Width="247px" ToolTip="subject"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" colspan="2">
                            <asp:TextBox ID="TextBox3" runat="server" Width="468px" Height="314px" 
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            </td>
                        <td class="style7">
                            </td>
                    </tr>
                    <tr>
                        <td class="style3" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: small;">
                            attachment</td>
                        <td class="style4">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Button ID="Button1" runat="server" Height="18px" Text="attach more" 
                                Width="74px" onclick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" colspan="2">
                            <table class="style1">
                                <tr class="style9">
                                    <td class="style8">
                                        attchments</td>
                                    <td class="style8">
                                        &nbsp;</td>
                                </tr>



                                <%
                                    DatabaseAccess da1 = new DatabaseAccess();
                                  System.Data.DataSet ds1 = new System.Data.DataSet();
                                  ds1 = da1.getData("select * from tbl_attachments where message_id=" + Request.QueryString.Get("msg_id").ToString());
                                  if (ds1.Tables[0].Rows.Count > 0)
                                  {
                                      for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                                      {
                                          %>
                                     <tr>
                                    <td class="style10"><%=ds1.Tables[0].Rows[j].ItemArray.GetValue(2).ToString()%>
                                    </td>
                                    <td class="style10"> <a href="DeleteAttachments.aspx?tempID=<%=ds1.Tables[0].Rows[j].ItemArray.GetValue(0).ToString() %>">    delete</a>
                                       </td>
                                </tr>
                                    
                                    <%
                                      }
                                  } %>
                                    
                                    
                                    
                                 <%   
                                    
                                    DatabaseAccess da = new DatabaseAccess();
    System.Data.DataSet ds = new System.Data.DataSet();
    ds = da.getData("select * from tbl_tempattachments");
    int i;
    for (i = 0; i < ds.Tables[0].Rows.Count; i++)
    {
     %>
                                <tr>
                                    <td class="style10"><%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString() %>
                                    </td>
                                    <td class="style10"> <a href="DeleteAttachments.aspx?tempID=<%=ds.Tables[0].Rows[i].ItemArray.GetValue(0).ToString() %>">    delete</a>
                                       </td>
                                </tr>
                                                                <%
        
}
        
         %>
                                <tr>
                                    <td class="style3">
                                        <asp:Button ID="Button2" runat="server" Text="SEND" Width="67px" 
                                            onclick="Button2_Click" Font-Bold="True" Font-Names="Times New Roman" 
                                            Font-Size="Small" />
                                    </td>
                                    <td class="style3">
                                        <asp:Button ID="Button3" runat="server" Text="SAVE AS DRAFT" Width="121px" 
                                            onclick="Button3_Click" Font-Bold="True" Font-Names="Times New Roman" 
                                            Font-Size="Small" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    </td>
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
