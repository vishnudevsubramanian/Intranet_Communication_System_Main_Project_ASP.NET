using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for DatabaseAccess
/// </summary>
public class DatabaseAccess
{
	public DatabaseAccess()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int execute(String Qry)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=.;Initial Catalog=intranet  communication system;Integrated Security=True";

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = Qry;
            com.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }



    }

    public DataSet getData(String Qry)
    {

        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=.;Initial Catalog=intranet  communication system;Integrated Security=True";
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        SqlDataAdapter ad = new SqlDataAdapter();
        DataSet ds = new DataSet();
        ad.SelectCommand = com;
        con.Open();
        com.CommandText = Qry;
        ad.SelectCommand.ExecuteNonQuery();
        ad.Fill(ds);
        con.Close();
        return ds;


    }

}