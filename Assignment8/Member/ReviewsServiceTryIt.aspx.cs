using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment8.Member
{
    public partial class ReviewsServiceTryIt : System.Web.UI.Page
    {
        public List<String> list = new List<string>();
        public Dictionary<string, string> hospitals = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                String baseURL = "http://webstrar81.fulton.asu.edu/Page2/api/Review/GetReviews/";


                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(new Uri($"{baseURL}")).Result;

                    if (response != null)
                    {
                        list = JsonConvert.DeserializeObject<List<String>>(response);
                    }

                }
                if (list.Count > 0 && string.Equals(list[0].ToString(), "ERROR"))
                {
                    reviewTable.Visible = false;
                    errorLabel.Visible = true;
                    errorLabel.Text = "ERROR: " + list[1].ToString();

                }
                if (list.Count > 0 && !string.Equals(list[0].ToString(), "ERROR"))
                {

                    reviewTable.Visible = true;
                    errorLabel.Visible = false;
                    TableRow row;
                    TableCell cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9;

                    foreach (var review in list)
                    {
                        row = new TableRow();
                        cell1 = new TableCell();
                        cell2 = new TableCell();
                        cell3 = new TableCell();
                        cell4 = new TableCell();
                        cell5 = new TableCell();
                        cell6 = new TableCell();
                        cell7 = new TableCell();
                        cell8 = new TableCell();
                        cell9 = new TableCell();
                        string[] colvalues = review.Split('#');
                        cell1.Text = colvalues[1];
                        DropDownList1.Items.Add(colvalues[1]);
                        hospitals.Add(colvalues[0], colvalues[1]);
                        cell2.Text = colvalues[2];
                        cell3.Text = colvalues[4];
                        cell4.Text = colvalues[5];
                        cell5.Text = colvalues[6];
                        cell6.Text = colvalues[7];
                        cell7.Text = colvalues[8];
                        cell8.Text = colvalues[9];
                        cell9.Text = colvalues[3];
                        row.Cells.Add(cell1);
                        row.Cells.Add(cell2);
                        row.Cells.Add(cell3);
                        row.Cells.Add(cell4);
                        row.Cells.Add(cell5);
                        row.Cells.Add(cell6);
                        row.Cells.Add(cell7);
                        row.Cells.Add(cell8);
                        row.Cells.Add(cell9);
                        reviewTable.Rows.Add(row);

                    }
                }
                else
                {
                    reviewTable.Visible = false;
                }

            }
            catch (Exception ex)
            {
                errorLabel.Visible = true;
                reviewTable.Visible = false;
                errorLabel.Text = "ERROR: " + ex.Message.ToString();
            }

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                string json = new JavaScriptSerializer().Serialize(new
                {
                    hospitalID = hospitals.FirstOrDefault(x => x.Value.ToLower() == DropDownList1.Text.ToLower()).Key,
                    hospitalName = DropDownList1.Text,
                    review = new string[] { tb_review.Text },
                    rating = tb_rating.Text
                });
                var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page2/api/Review/PostReview/?review=" + json);
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    streamWriter.Write(json);
                }
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();


                }

            }
            catch (Exception)
            {

            }
            finally
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }


        }

        protected void SubmitButton2_Click(object sender, EventArgs e)
        {
            try
            {
                var key = hospitals.FirstOrDefault(x => x.Value.ToLower() == DropDownList1.Text.ToLower()).Key;
                string json = new JavaScriptSerializer().Serialize(new
                {
                    hospitalID = key != null ? key : "-99",
                    hospitalName = tb_new_hospital.Text,
                    review = new string[] { tb_new_review.Text },
                    rating = tb_new_rating.Text,
                    contact = tb_new_contact.Text,
                    testing = RadioButton1.Checked ? RadioButton1.Text : RadioButton2.Text,
                    ventilatorsAvailable = RadioButton3.Checked ? RadioButton3.Text : RadioButton4.Text

                });
                var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page2/api/Review/PostReview/?review=" + json);
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    streamWriter.Write(json);
                }
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();


                }
            }
            catch (Exception)
            {

            }
            finally
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubmitButton2.Enabled = false;
            SubmitButton.Enabled = true;
        }

        protected void tb_new_hospital_TextChanged(object sender, EventArgs e)
        {
            SubmitButton2.Enabled = true;
            SubmitButton.Enabled = false;
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}