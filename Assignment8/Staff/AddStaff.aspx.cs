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

namespace Assignment8.Staff
{
    public partial class AddStaff : System.Web.UI.Page
    {

        private static string fLocation = HttpRuntime.AppDomainAppPath + @"\App_Data\Staff.xml";
        EncryptDecrypt.Encryption encryption = new Encryption();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void bnAdd_Click(object sender, EventArgs e)
        {

            string user = UserName.Text;
            string password = Password.Text;
            errorUser.Visible = false;


            XmlDocument myDoc = new XmlDocument();
            myDoc.Load(fLocation);
            XmlElement rootElement = myDoc.DocumentElement;
            foreach (XmlNode node in rootElement.ChildNodes)
            {
                if (node["UserName"].InnerText == user)
                {
                    errorUser.Text = String.Format("*Staff with user name {0} already exists.", user);
                    errorUser.ForeColor = Color.Red;
                    errorUser.Visible = true;
                    Password.Text = "";
                    RePassword.Text = "";
                    return;
                }
                
            }
            
            
                XmlElement myMember = myDoc.CreateElement("Staff", rootElement.NamespaceURI);
                rootElement.AppendChild(myMember);
                XmlElement myUser = myDoc.CreateElement("UserName", rootElement.NamespaceURI);
                myMember.AppendChild(myUser);
                myUser.InnerText = user;

                XmlElement myPwd = myDoc.CreateElement("Password", rootElement.NamespaceURI);
                myMember.AppendChild(myPwd);
                myPwd.InnerText = encryption.encryption(password);
                myDoc.Save(fLocation);

                errorUser.Text = String.Format("Staff with user name {0} registered successfully", user);
                errorUser.ForeColor = Color.Green;
                errorUser.Visible = true;
                Password.Text = "";
                RePassword.Text = "";
                UserName.Text = "";

        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}