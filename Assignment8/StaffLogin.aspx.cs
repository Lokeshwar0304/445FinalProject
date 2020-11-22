using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using EncryptDecrypt;


namespace Assignment8
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        public static string filepath = HttpRuntime.AppDomainAppPath + @"\App_Data\Staff.xml";
        EncryptDecrypt.Decryption decryption = new Decryption();
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                
                if (!(String.IsNullOrEmpty(Password.Text.Trim())))
                {
                   Password.Attributes["value"] = Password.Text;
                   

                }
            }

            
        }

        protected void logIn_Click(object sender, EventArgs e)
        {

            string user = UserName.Text;
            string password = Password.Text;
            try
            {

                if (tbcaptcha.Text.ToUpper() != Session["Captcha"].ToString())
                {
                    Output.Text = "Please enter the correct verification code!";
                    Output.Visible = true;
                    return;
                }


                XmlDocument myDoc = new XmlDocument();
                myDoc.Load(filepath);    // open file
                XmlElement rootElement = myDoc.DocumentElement;
                foreach (XmlNode node in rootElement.ChildNodes)
                {
                    if (node["UserName"].InnerText == user)
                    {
                        var ax = decryption.decryption(node["Password"].InnerText);
                        if (decryption.decryption(node["Password"].InnerText) == password)
                        {
                            Output.Visible = false;
                            createLoginCookie(user);
                            Response.Redirect("~/Staff/Staff.aspx");
                            return;
                        }
                        else
                        {
                            Output.Visible = true;
                            Output.Text = "Incorrect Password";
                            tbcaptcha.Text = "";
                            Output.ForeColor = Color.Red;
                            return;
                        }
                    }
                }
                Output.Visible = true;
                Output.Text = "Staff name / password does not exists";
                tbcaptcha.Text = "";
                Output.ForeColor = Color.Red;
                return;
            }
            catch(Exception ex)
            {
                Output.Visible = true;
                Output.Text = ex.Message.ToString();
                tbcaptcha.Text = "";
                Output.ForeColor = Color.Red;
                return;

            }
        }

        public void createLoginCookie(string user)
        {
            if (true)
            {
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1, // Ticket version
                user, // Username associated with ticket
                DateTime.Now, // Date/time issued
                DateTime.Now.AddDays(7), // Date/time to expire
                true, // "true" for a persistent user cookie
                "staff", // User-data, in this case the roles
                FormsAuthentication.FormsCookiePath);// Path cookie valid for

                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(
                FormsAuthentication.FormsCookieName, // Name of auth cookie
                hash)// Hashed ticket
                {
                    HttpOnly = true,
                    Secure = FormsAuthentication.RequireSSL,
                    Path = FormsAuthentication.FormsCookiePath
                };

                // Set the cookie's expiration time to the tickets expiration time
                cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);
            }
        }

        

        protected void bnRefresh_Click(object sender, EventArgs e)
        {
            tbcaptcha.Text = "";
            Session["Captcha"] = null;
        }
    }

}