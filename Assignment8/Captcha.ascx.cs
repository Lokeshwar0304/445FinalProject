using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Captcha : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Imagecaptcha"] == null)
            {
                Assignment8.ImageService.ServiceClient myClient = new Assignment8.ImageService.ServiceClient();
                string myStr = myClient.GetVerifierString("4");
                Stream myImg = myClient.GetImage(myStr);
                MemoryStream ms = new MemoryStream();
                myImg.CopyTo(ms);
                var byts = ms.ToArray();
                ms.Dispose();
                Session["Imagecaptcha"] = myStr;
                Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(byts);
                Session["ImageArr"] = byts;
            }

        }
    }
}