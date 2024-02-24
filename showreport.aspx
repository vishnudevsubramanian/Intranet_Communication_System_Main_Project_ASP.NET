<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showreport.aspx.cs" Inherits="showreport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 194px;
        }
        .style3
        {
            width: 131px;
        }
        .style4
        {
            width: 173px;
        }
        .style5
        {
            width: 159px;
        }
        .style6
        {
            background-color: #FF6600;
        }
        .style7
        {
            width: 159px;
            background-color: #FF6600;
        }
        .style8
        {
            width: 131px;
            background-color: #FF6600;
        }
        .style9
        {
            width: 194px;
            background-color: #FF6600;
        }
        .style10
        {
            width: 173px;
            background-color: #FF6600;
        }
        .style11
        {
            width: 131px;
            font-size: 15pt;
        }
        #print
        {
            width: 70px;
        }
    </style>
    <script>
        function f1() {
            document.getElementById('print').style.visibility = 'hidden';
            window.print();


        }
    
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style11">
                    <strong>Login Report</strong></td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style10">
                    name</td>
                <td class="style9">
                    email id</td>
                <td class="style8">
                    department</td>
                <td class="style7">
                    login time</td>
                <td class="style6">
                    log out time</td>
            </tr>

            <%
                DatabaseAccess da = new DatabaseAccess();
                System.Data.DataSet ds = new System.Data.DataSet();
                //DateTime dt = DateTime.Parse(Session["reportdate"].ToString());
                ds = da.getData("select * from tbl_login where CONVERT(varchar(25),login_date_time,25)like '"+ Session["reportdate"] + "%'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                   
                 %>



            <tr>
                <td class="style4">
                    <%=ds.Tables[0].Rows[i].ItemArray.GetValue(1).ToString()%></td>
                <td class="style2">
                    <%=ds.Tables[0].Rows[i].ItemArray.GetValue(2).ToString()%></td>
                <td class="style3">
                    <%=ds.Tables[0].Rows[i].ItemArray.GetValue(4).ToString()%></td>
                <td class="style5">
                    <%=ds.Tables[0].Rows[i].ItemArray.GetValue(3).ToString()%></td>
                <td>
                    <%=ds.Tables[0].Rows[i].ItemArray.GetValue(5).ToString()%></td>
            </tr>
            <%
}
                } %>




            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <input id="print" type="button" value="Print" onclick="f1()" /></td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
