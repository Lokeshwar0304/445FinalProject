using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EncryptionDecryption
{
    public partial class EncryptDecrypt : System.Web.UI.Page
    {
        Assignment8.EncryptionDecryptService.Service1Client encdeService = new Assignment8.EncryptionDecryptService.Service1Client();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            errorMsg.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            errorMsg.Visible = false;
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                string str1 = encdeService.encryption(TextBox1.Text);
                TextBox2.Text = str1;
            }
            else
            {
                errorMsg.Text = "Please enter a message/word to encrypt";
                errorMsg.Visible = true;
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            errorMsg.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            errorMsg.Visible = false;
            if (!string.IsNullOrEmpty(TextBox3.Text))
            {
                string str2 = encdeService.decryption(TextBox3.Text);
                TextBox4.Text = str2;
            }
            else
            {
                errorMsg.Text = "Please enter a message/word to de-crypt";
                errorMsg.Visible = true;
            }
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }
        

        
    }
}