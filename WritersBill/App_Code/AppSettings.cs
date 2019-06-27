using System;
using System.Data;
using System.Configuration;


/// <summary>
/// Summary description for AppSettings
/// </summary>
public class AppSettings
{
    public string ConnectionString
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["ConString"].ToString();
        }
    }
	public AppSettings()
	{
		//
		// TODO: Add constructor logic here
		//
	}

}
