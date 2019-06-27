using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Enum
/// </summary>
public class Enum
{
    public enum UserFunctionLoadOption
    {
        LoadByAll = 1,
        LoadById = 3,
        LoadByGroup = 4
    }
    public enum GroupFunctionLoadOption
    {
        LoadAll = 1,
        LoadById = 3,
        LoadByGroupIdFunctionId = 4
    }
    public enum enumFunctionId
    {
        FORM_createUser=10,
        FORM_userGroup=20,
        FORM_groupAuthorization=30,
    }
}