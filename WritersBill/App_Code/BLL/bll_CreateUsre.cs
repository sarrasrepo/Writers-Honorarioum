using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_CreateUsre
/// </summary>
public class bll_CreateUsre
{
    dal_CreateUser dalCreateUser = new dal_CreateUser();

    #region Data Member

        private int _USERID;
        private string _FULLNAME = "";
        private string _USERDESIGNATION = "";
        private string _USERMOBILE = "";
        private string _USEREMAIL = "";
        private string _USERNAME = "";        
        private string _USERPASSWORD = "";
        private DateTime _CREATEDATE;
        private string _AUDUSER = "";        

    #endregion

    #region Properties

        public int USERID
        {
            get { return _USERID; }
            set { _USERID = value; }
        }
        public string FULLNAME
        {
            get { return _FULLNAME; }
            set { _FULLNAME = value; }
        }
        public string USERDESIGNATION
        {
            get { return _USERDESIGNATION; }
            set { _USERDESIGNATION = value; }
        }
        private int _GROUPID;

        public int GROUPID
        {
            get { return _GROUPID; }
            set { _GROUPID = value; }
        }

        public string USERMOBILE
        {
            get { return _USERMOBILE; }
            set { _USERMOBILE = value; }
        }

        public string USEREMAIL
        {
            get { return _USEREMAIL; }
            set { _USEREMAIL = value; }
        }
        public string USERNAME
        {
            get { return _USERNAME; }
            set { _USERNAME = value; }
        }
        public string USERPASSWORD
        {
            get { return _USERPASSWORD; }
            set { _USERPASSWORD = value; }
        }

        public DateTime CREATEDATE
        {
            get { return _CREATEDATE; }
            set { _CREATEDATE = value; }
        }

        public string AUDUSER
        {
            get { return _AUDUSER; }
            set { _AUDUSER = value; }
        }
    #endregion

    #region Member Functions

    public void Insert()
    {
        dalCreateUser.Insert(this);

    }

    public void Delete()
    {
        dalCreateUser.Delete(this);
    }

    public void Update()
    {
        dalCreateUser.Update(this);
    }
    public int ValidateUser(string UserName, string Password)
    {
        return dalCreateUser.ValidateUser(UserName, Password);
    }


    #endregion
}