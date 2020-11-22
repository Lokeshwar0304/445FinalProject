using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

namespace Assignment8.Staff
{
    public partial class ViewUsers : System.Web.UI.Page
    {
        public static string filepath = HttpRuntime.AppDomainAppPath + @"\App_Data\Member.xml";

        protected void Page_Load(object sender, EventArgs e)
        {
            XmlDocument myDoc = new XmlDocument();
            myDoc.Load(filepath);    // open file
            XmlElement rootElement = myDoc.DocumentElement;
            
            foreach (XmlNode node in rootElement.ChildNodes)
            {
                //node["UserName"].InnerText
                HtmlTableRow row = new HtmlTableRow();
                HtmlTableCell cell = new HtmlTableCell();
                cell.InnerText = node["UserName"].InnerText;
                row.Cells.Add(cell);
                table.Rows.Add(row);
            }
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}