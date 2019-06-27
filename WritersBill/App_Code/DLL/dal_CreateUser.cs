using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_CreateUser
/// </summary>
public class dal_CreateUser
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_CreateUsre bllCreateUser)
    {
        try
        {
            cmd = "EXEC Insert_userList '"
                            + bllCreateUser.FULLNAME + "','"
                            + bllCreateUser.USERDESIGNATION + "','"
                            + bllCreateUser.GROUPID + "','"
                            + bllCreateUser.USERMOBILE + "','"
                            + bllCreateUser.USEREMAIL + "','"
                            + bllCreateUser.USERNAME + "','"
                            + bllCreateUser.USERPASSWORD + "','"
                            + bllCreateUser.CREATEDATE + "','"
                            + bllCreateUser.AUDUSER + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
        }
    }

    public void Update(bll_CreateUsre bllCreateUser)
    {
        try
        {
            cmd = "EXEC Update_userList '"
                            + bllCreateUser.USERID + "','"
                            + bllCreateUser.FULLNAME + "','"
                            + bllCreateUser.USERDESIGNATION + "','"
                            + bllCreateUser.GROUPID + "','"
                            + bllCreateUser.USERMOBILE + "','"
                            + bllCreateUser.USEREMAIL + "','"
                            + bllCreateUser.USERNAME + "','"
                            + bllCreateUser.USERPASSWORD + "','"
                            + bllCreateUser.CREATEDATE + "','"
                            + bllCreateUser.AUDUSER + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }

    public void Delete(bll_CreateUsre bllCreateUser)
    {
        try
        {
            cmd = "EXEC Delete_userList '" + bllCreateUser.USERID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }

    public int ValidateUser(string UserName, string Password)
    {
        try
        {
            cmd = "SELECT dbo.udf_ValidateUser('" + UserName + "', '" + Password + "')";
            return dataProvider.getResultBit(cmd);
        }

        catch (Exception ex)
        {
            return 0;
        }
    }
}