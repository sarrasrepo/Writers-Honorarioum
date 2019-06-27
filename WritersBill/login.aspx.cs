using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class login : System.Web.UI.Page
{

    bll_CreateUsre bllCreateUser = new bll_CreateUsre();
    clsDataProvider dataProvider = new clsDataProvider();

    #region All Global Variable

        public string strValueFromMailLink = "";

    #endregion

    #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

            lblDate.Text = DateTime.Today.ToString("dddd , dd-MMMM-yyyy");
            lblTime1.Text = System.DateTime.Now.ToLongTimeString();

            if (!Page.IsPostBack)
            {
                getCookie();
            }
        }

    #endregion

    #region All Private methods

        private void UpdateTimer()
         {
            lblTime1.Text = System.DateTime.Now.ToLongTimeString();
         }
       protected void Timer1_Tick(object sender, EventArgs e)
         {
            UpdateTimer();
         }
       public void getCookie()
       {
           if (Request.Cookies["UserCookies"] != null)
           {
               string strUserName = Request.Cookies["UserCookies"]["userName"].ToString();
               string strPassword = Request.Cookies["UserCookies"]["password"].ToString();

               this.txtUserName.Text = strUserName;
               this.txtPassword.Text = strPassword;
           }
       }


    #endregion

    #region All Button Events

        protected void btnLogin_Click(object sender, EventArgs e)
        {            

            if (Page.IsValid)
            {
                int i = 0;

                i = bllCreateUser.ValidateUser(txtUserName.Text, txtPassword.Text);

                if (i != 0)
                {                   

                    if (this.chkKeepMeLogin.Checked)
                    {
                        HttpCookie UserCookies = new HttpCookie("UserCookies");
                        UserCookies.Values["userName"] = this.txtUserName.Text;
                        UserCookies.Values["password"] = this.txtPassword.Text;
                        UserCookies.Expires = DateTime.Now.AddHours(1);
                        Response.Cookies.Add(UserCookies);
                    }

                    Session["IsLoggedIn"] = "yes";
                    Session["UserName"] = this.txtUserName.Text;

                    string selUserGrp = "Select groupId from userList where userName='" + txtUserName.Text + "' ";
                    string strGroup = dataProvider.getResultString(selUserGrp);

                    if (strGroup == "14")
                    {
                        Session["userGrp"] = "14";
                        Response.Redirect("WritersBill.aspx");                        
                    }
                    else if (strGroup == "16" || strGroup == "17")
                    {
                        Session["userGrp"] = "16";
                        Response.Redirect("LineageBill.aspx");                        
                    }
                    else if (strGroup == "18")
                    {
                        Session["userGrp"] = "18";
                        Response.Redirect("LineageBillApprv.aspx");
                    }
                    else
                    {
                        Session["userGrp"] = "Admin";
                        Response.Redirect("Home.aspx");                        
                    }
                }
               
                else
                {
                   divError.Visible = true;
                  
                }
            }
            
        }

        protected void btnRtvPassword_Click(object sender, EventArgs e)
        {
            string strUserName = "";
            string strPassword = "";
            string strEmail = "";
            bool sendMail = false;



            SmtpClient smtpClient = new SmtpClient();
            MailMessage message = new MailMessage();

            string selUserName = "SELECT userName,userPassword,userEmail FROM userList WHERE userName='" + txtRtvUserName.Text + "' OR userMobile='" + txtMobile.Text + "' OR userEmail='" + txtEmail.Text + "' AND delStatus<>1";
            SqlDataReader sdr = dataProvider.getDataReader(selUserName);

            while (sdr.Read())
            {
                strUserName = sdr["userName"].ToString();
                strPassword = sdr["userPassword"].ToString();
                strEmail = sdr["userEmail"].ToString();

                sendMail = true;
            }

            sdr.Close();

            if (sendMail == true)
            {
                smtpClient.Host = "10.168.2.5";
                MailAddress fromAddress = new MailAddress("system@circulation.com", "Circulation system");
                message.From = fromAddress;
                message.To.Add(strEmail);
                message.Subject = "Circulation login details";
                message.IsBodyHtml = true;
                string body = string.Format("<b>Dear ,&nbsp;&nbsp;</b>{0}<br/><br/>Your login details.<br /><br /><b>&nbsp;&nbsp;&nbsp;&nbsp;User Name:</b>{1}<br/><b>&nbsp;&nbsp;&nbsp;&nbsp;Password:</b>{2}<br/>{3}", strUserName, strUserName, strPassword, "It's System generated mail.");
                message.Body = body;
                smtpClient.Send(message);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('Please check your inbox');", true);
                
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('Wrong E-mail or mobile number');", true);

                //lblError.Visible = true;
            }

            
            txtRtvUserName.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
        }

    #endregion
        
}