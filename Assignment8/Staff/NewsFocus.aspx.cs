using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment8.Staff
{
    public partial class NewsFocus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Initialize NewsFocusService to make calls
            NewsFocusService.ServiceClient newsService = new NewsFocusService.ServiceClient();
            string input2 = TextBox3.Text;
            //Get the results in to outputText
            string[] outputText2 = newsService.GetNewsFocus(input2);
            string separator = "\n";
            TextBox4.Text = string.Join(separator, outputText2);
        }
    }
}