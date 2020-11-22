using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment8.Member
{
    public partial class CreateAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Table1.Rows.Clear();
            object input = new object();
            List<string> results = new List<string>();
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page6/api/Appointments");
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
                    string[] array = result.Split('#');
                    for (int i = 0; i < array.Length; i++)
                    {
                        TableCell c = new TableCell();
                        c.Controls.Add(new LiteralControl(array[i]));
                        c.Attributes.Add("style", "border-left: black thin solid;");
                        r.Cells.Add(c);
                    }

                    Table1.Rows.Add(r);


                }
                Table1.BorderWidth = 1;


            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page6/home/submitAppointment");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            using (var streamWriter = new

            StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = new JavaScriptSerializer().Serialize(new
                {
                    UserId = userId.Text,
                    ApptId = apptId.Text,
                    Name = firstname.Text,
                    Surname = lastname.Text,
                    Age = age.Text,
                    Time = time.Text,
                    Date = date.Text,
                    Doctor = "XYZ"
                });

                streamWriter.Write(json);
            }
            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                var result = streamReader.ReadToEnd();
                Label1.Text = result;

            }
        }

        protected void getAppts_Click(object sender, EventArgs e)
        {
            Table1.Rows.Clear();

            object input = new object();
            List<string> results = new List<string>();
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page6/api/Appointments?userid=" + getUserId.Text);
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
                    string[] array = result.Split('#');
                    for (int i = 0; i < array.Length; i++)
                    {
                        TableCell c = new TableCell();
                        c.Controls.Add(new LiteralControl(array[i]));
                        c.Attributes.Add("style", "border-left: black thin solid;");
                        r.Cells.Add(c);
                    }

                    Table1.Rows.Add(r);


                }
                Table1.BorderWidth = 1;


            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page6/api/Appointments?userid=" + deleteUserId.Text + "&apptid=" + deleteApptId.Text);
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "DELETE";
            try
            {
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();
                    Label2.Text = result;

                }
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
            }
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}