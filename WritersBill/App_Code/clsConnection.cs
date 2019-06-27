using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for clsConnection
/// </summary>
public class clsConnection
{
		//
		// TODO: Add constructor logic here
		//

        public string ConString = "";

        public SqlConnection ConnectByXML()
        {
            //Data Source=HRDMUSHFIQ;Initial Catalog=dbINMAC;User ID=sa
            ConString = "Data Source = " + System.Configuration.ConfigurationManager.AppSettings["ServerName"]; 
            ConString += "; Initial Catalog = " + System.Configuration.ConfigurationManager.AppSettings["DatabaseName"]; 
            ConString += "; Integrated Security = " + System.Configuration.ConfigurationManager.AppSettings["Integrated Security"];
            ConString += "; User ID = " + System.Configuration.ConfigurationManager.AppSettings["User ID"];
            ConString += "; Password = " + System.Configuration.ConfigurationManager.AppSettings["Password"];
            ConString += "; Trusted_connection = " + System.Configuration.ConfigurationManager.AppSettings["Trusted_connection"];
            ConString += "; Max Pool Size = " + System.Configuration.ConfigurationManager.AppSettings["Max Pool Size"];
            ConString += "; Connection Timeout = " + System.Configuration.ConfigurationManager.AppSettings["Connection Timeout"];
            return new SqlConnection(ConString);
        }

}