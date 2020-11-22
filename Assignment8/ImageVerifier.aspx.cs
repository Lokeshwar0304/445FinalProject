using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ImageVerifier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void VerifyBtn_Click(object sender, EventArgs e)
        {
            if (Session["Imagecaptcha"].Equals(CaptchaTextbox.Text))
            {
                // Your input is correct, and can access
                Output.Text = "Image Verified!";
                Output.ForeColor = Color.Green;
                Output.Visible = true;
            }
            else
            {
                CaptchaTextbox.Text = "";
                Session["Imagecaptcha"] = null;
                Output.Text = "Your input is not correct!";
                Output.ForeColor = Color.Red;
                Output.Visible = true;
            }

        }

        protected void getImageBtn_Click(object sender, EventArgs e)
        {
            CaptchaTextbox.Text = "";
            Session["Imagecaptcha"] = null;
            Response.Redirect("~/ImageVerifier.aspx");
        }
    }
}