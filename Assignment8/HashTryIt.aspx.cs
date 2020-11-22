using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PasswordCryption;
namespace WebApplication
{

    public partial class HashTryIt : System.Web.UI.Page
    {
        PasswordCryption.Class1 cryption = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = TextBox1.Text;
            Output.Text = cryption.hash_password(str);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            bool ax = cryption.verify_hash(Output.Text, TextBox2.Text);
            if (ax)
            {
                Output2.Text = "Hash matched with the entered value";
                Output2.ForeColor = Color.Green;
                Output2.Visible = true;
            }
            else
            {
                Output2.Text = "Hash doesn't match the entered value";
                Output2.ForeColor = Color.Red;
                Output2.Visible = true;
            }
        }
    }
}