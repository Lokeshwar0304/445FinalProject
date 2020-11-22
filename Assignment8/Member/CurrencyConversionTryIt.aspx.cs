using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment8.Member
{
    public partial class CurrencyConversionTryIt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                HttpWebRequest gettingapi = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page9/api/Currency?From_input=" + (TextBox1.Text).ToUpper() + "&To_output=" + (TextBox2.Text).ToUpper() + "&amount=" + (TextBox4.Text));
                gettingapi.Method = "GET";

                HttpWebResponse get_response = (HttpWebResponse)gettingapi.GetResponse();
                Stream new_stream = get_response.GetResponseStream();
                StreamReader strm = new StreamReader(new_stream);
                var result = strm.ReadToEnd();
                TextBox3.Text = result;
            }
            catch (Exception)
            {
                //string output = "Please, enter only float values at amount, and from currency and To currency should be Strings";

                //TextBox3.Text = Convert.ToDouble(output);

            }

        }
    }
}