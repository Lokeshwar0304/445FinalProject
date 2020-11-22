using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using EncryptDecrypt;

namespace Assignment8
{
    public partial class About : Page
    {
        private static string fLocation = HttpRuntime.AppDomainAppPath + @"\App_Data\Member.xml";
        EncryptDecrypt.Encryption encryption = new Encryption();
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (IsPostBack)
            { 
                if (!(String.IsNullOrEmpty(Password.Text.Trim())) && !(String.IsNullOrEmpty(RePassword.Text.Trim())))
                {
                    Password.Attributes["value"] = Password.Text;
                    RePassword.Attributes["value"] = RePassword.Text;
                }
                
            }
            
        }

        protected void register_Click(object sender, EventArgs e)
        {
            errorUser.Visible = false;
            Output.Visible = false;
            
            string user = UserName.Text;
            string password = Password.Text;


           

            if (!string.IsNullOrEmpty(user) && !string.IsNullOrEmpty(password))
            {

                if (tbcaptcha.Text.ToUpper() != Session["Captcha"].ToString())
                {
                    Output.Text = "Please enter the correct verification code!";
                    Output.Visible = true;
                    return;
                }

                XmlDocument myDoc = new XmlDocument();
                myDoc.Load(fLocation);
                XmlElement rootElement = myDoc.DocumentElement;
                foreach (XmlNode node in rootElement.ChildNodes)
                {
                    if (node["UserName"].InnerText == user)
                    {
                        errorUser.Text = String.Format("*Account with user name {0} already exists.", user);
                        errorUser.ForeColor = Color.Red;
                        errorUser.Visible = true;
                        Password.Text = "";
                        RePassword.Text = "";
                        tbcaptcha.Text = "";
                        return;
                    }
                }
                if (!errorUser.Visible)
                {
                    XmlElement myMember = myDoc.CreateElement("Member", rootElement.NamespaceURI);
                    rootElement.AppendChild(myMember);
                    XmlElement myUser = myDoc.CreateElement("UserName", rootElement.NamespaceURI);
                    myMember.AppendChild(myUser);
                    myUser.InnerText = user;

                    XmlElement myPwd = myDoc.CreateElement("Password", rootElement.NamespaceURI);
                    myMember.AppendChild(myPwd);
                    myPwd.InnerText = encryption.encryption(password);
                    myDoc.Save(fLocation);

                    Output.Text= String.Format("Account with user name {0} registered successfully", user);
                    Output.ForeColor = Color.Green;
                    Output.Visible = true;
                    tbcaptcha.Text = "";
                    UserName.Text = "";
                    Session["Captcha"] = null;
                    Password.Attributes["value"] = "";
                    RePassword.Attributes["value"] = "";
                    CalendarUserControl1.SelectedDate = "";
                    

                }
            }

            else
            {
                Output.Text = "Please enter User Name/ Password";
                Output.ForeColor = Color.Red;
                Output.Visible = true;
                tbcaptcha.Text = "";
            }

            




        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MemberLogin.aspx");
        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {
            errorUser.Visible = false;
            Output.Visible = false;
        }

        protected void bnRefresh_Click(object sender, EventArgs e)
        {
            tbcaptcha.Text = "";
            Session["Captcha"] =null;
        }

       
    }
}