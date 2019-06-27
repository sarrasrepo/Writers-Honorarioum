using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// Summary description for clsDataProvider
/// </summary>
public class clsDataProvider
{
	public clsDataProvider()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();
    SqlDataAdapter daGen;
    DataSet dsGen;

    public void ExecuteCommand(string MyQuery)
    {
        con = dbCon.ConnectByXML();               
        con.Open();                
        SqlCommand sqlComm = new SqlCommand(MyQuery, con);               
        //sqlComm.CommandType = CommandType.Text;               
        sqlComm.ExecuteNonQuery();             
        con.Close();       
    }

    //public void ExecuteCommand1(string MyQuery)
    //{
    //    string connString = @"Data Source=192.168.10.75; Initial Catalog=ALOCIR; Integrated Security=false; Max Pool Size=20; Connection Timeout=5";
    //    try
    //    {
    //        for (int i = 0; i < 100; i++)
    //        {
    //            SqlConnection sc = new SqlConnection(connString);
    //            sc = connString.ConnectByXML();
    //            sc.Open();
                
    //            SqlCommand sCmd = new SqlCommand(MyQuery, sc);
    //            sCmd.ExecuteNonQuery();
    //            sc.Close();

    //            //Console.WriteLine("Connections open: {0}", i.ToString());
    //            //SqlDataReader sdr = sCmd.ExecuteReader();
    //            //sdr.Close();
    //        }
    //    }
    //    catch (Exception e)
    //    {
    //        Console.WriteLine(e);
    //    }
    //}

    public DataSet getDataSet(string MyQuery, string MyString)
    {
        dsGen = new DataSet();
        con = dbCon.ConnectByXML();
        daGen = new SqlDataAdapter(MyQuery, con);
        daGen.Fill(dsGen, MyString);

        return dsGen;
    }


    public SqlDataReader getDataReader(string MyQuery)
    {
        con = dbCon.ConnectByXML();
        con.Open();
        SqlCommand cmd = new SqlCommand(MyQuery, con);
        //SqlDataReader sdr = cmd.ExecuteReader();

        //if (sdr.HasRows)
        //{
            //sdr.Read();
            return cmd.ExecuteReader();
        //}

    }


    
    public DataTable getDataTable(string MyQuery, string MyTable)
    {
        DataTable dt = new DataTable();

        dsGen = new DataSet();
        con = dbCon.ConnectByXML();
        daGen = new SqlDataAdapter(MyQuery, con);
        daGen.Fill(dsGen, MyTable);
        dt = dsGen.Tables[MyTable];
        dsGen.Tables.Remove(MyTable);

        return dt;
    }

    public int getResultBit(string MyQuery)
    {
        DataTable dt = new DataTable();
        int resultBit;

        dsGen = new DataSet();
        con = dbCon.ConnectByXML();
        daGen = new SqlDataAdapter(MyQuery, con);
        daGen.Fill(dsGen);
        dt = dsGen.Tables[0];
        resultBit = Convert.ToInt16(dt.Rows[0][0]);

        return resultBit;
    }

    public string getResultString(string MyQuery)
    {
        DataTable dt = new DataTable();
        string resultString;

        dsGen = new DataSet();
        con = dbCon.ConnectByXML();
        daGen = new SqlDataAdapter(MyQuery, con);
        daGen.Fill(dsGen);
        dt = dsGen.Tables[0];
        resultString = dt.Rows[0][0].ToString();

        return resultString;
    }
    }