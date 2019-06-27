using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsHelper
/// </summary>
public class clsHelper
{
    public static void CheckLogin()
    {
        if (HttpContext.Current.Session["IsLoggedIn"] == null || HttpContext.Current.Session["IsLoggedIn"].ToString() != "yes")
        {
            HttpContext.Current.Response.Redirect("Login.aspx");
        }
    }
}