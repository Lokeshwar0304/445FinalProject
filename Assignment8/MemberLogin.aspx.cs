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
    public partial class Contact : Page
    {
        public static string filepath = HttpRuntime.AppDomainAppPath + @"\App_Data\Member.xml";
        EncryptDecrypt.Decryption decryption = new Decryption();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            

                if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                var page = Request.QueryString["ReturnUrl"];
                if (page.Contains("Staff"))
                {
                    Response.Redirect("~/StaffLogin.aspx");
                }
            }

           
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Member/Member.aspx");
            }
           
            

        }

        protected void logIn_Click(object sender, EventArgs e)
        {
            
            string user = UserName.Text; 
            string password = Password.Text;

            
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
                        createLoginCookie(user, Persistent.Checked);
                        Response.Redirect("~/Member/Member.aspx");
                        return;
                    }
                    else
                    {
                        Output.Visible = true;
                        Output.Text = "Incorrect Password";
                        Output.ForeColor =Color.Red;
                        return;
                    }
                }
            }
            Output.Visible = true;
            Output.Text = "User name / password does not exists";
            Output.ForeColor = Color.Red;
            return;
        }

        protected void Persistent_CheckedChanged(object sender, EventArgs e)
        {

        }

        public void createLoginCookie(string user, bool ispersistent)
        {
            if (true)
            {
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1, // Ticket version
                user, // Username associated with ticket
                DateTime.Now, // Date/time issued
                DateTime.Now.AddDays(7), // Date/time to expire
                ispersistent, // "true" for a persistent user cookie
                "member", // User-data, in this case the roles
                FormsAuthentication.FormsCookiePath);// Path cookie valid for

                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(
                FormsAuthentication.FormsCookieName, // Name of auth cookie
                hash) // Hashed ticket
                {
                    HttpOnly = true,
                    Secure = FormsAuthentication.RequireSSL,
                    Path = FormsAuthentication.FormsCookiePath

                };

                // Set the cookie's expiration time to the tickets expiration time
                if (true) cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);
                
            }
        }

        
    }
}