using Newtonsoft.Json;
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
    public partial class CovidInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            object input = new object();
            List<string> results = new List<string>();
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page6/api/CovidInfo");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "GET";

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                string jsonString = streamReader.ReadToEnd();
                results = JsonConvert.DeserializeObject<List<string>>(jsonString);
                //string separator = "\n";
                //TextBox1.Text = string.Join(separator, results);
                foreach (var result in results)
                {
                    TableRow r = new TableRow();
                    string[] array = result.Split(';');
                    for (int i = 0; i < array.Length; i++)
                    {
                        TableCell c = new TableCell();
                        c.Controls.Add(new LiteralControl(array[i]));
                        //c.Attributes.Add("style", "border-left: black thin solid;");
                        r.Cells.Add(c);
                    }

                    Table1.Rows.Add(r);


                }
                //Table1.BorderWidth = 1;
                Table1.GridLines = GridLines.Vertical;
                Table1.CellPadding = 4;
                Table1.CellSpacing = 4;


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page6/api/CovidInfo?state=" + TextBox1.Text);
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "GET";

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                string jsonString = streamReader.ReadToEnd();
                string result = JsonConvert.DeserializeObject<string>(jsonString);

                //string separator = "\n";
                //TextBox1.Text = string.Join(separator, results);

                string[] array = result.Split('\n');
                for (int i = 0; i < array.Length; i++)
                {
                    TableRow r = new TableRow();

                    TableCell c = new TableCell();
                    c.Controls.Add(new LiteralControl(array[i]));
                    r.Cells.Add(c);
                    Table2.Rows.Add(r);
                }
                //Table2.Rows.Add(r);


            }
            Table2.BorderWidth = 1;


        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}