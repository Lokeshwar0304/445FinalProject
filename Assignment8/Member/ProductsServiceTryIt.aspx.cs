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
    public partial class ProductsServiceTryIt : System.Web.UI.Page
    {
        public List<String> list = new List<string>();
        public static Dictionary<string, string> cart = new Dictionary<string, string>();
        public static bool firstLoad = true;
        public static string searchword = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            userCartdetails.Visible = false;
            if (Session["productslist"] != null)
            {
                var selected = productsList.SelectedValue;
                if (cart.ContainsKey(selected))
                {
                    // var x = cart[selected];
                    //var y = x+ tb_quantity.Text;
                    // var z = cart[selected];
                    // cart[selected] = y;
                }
                else
                {
                    cart.Add(selected, tb_quantity.Text);
                }
                displayTable((List<string>)Session["productslist"]);
            }
        }



        protected void SearchButton_Click(object sender, EventArgs e)
        {
            searchword = tb_item.Text;

            if (string.IsNullOrWhiteSpace(searchword))
            {
                errorLabel.Visible = true;
                productsTable.Visible = false;
                errorLabel.Text = "ERROR: " + "Please enter a product keyword to search";
            }
            else
            {

                try
                {
                    String baseURL = "http://webstrar81.fulton.asu.edu/Page2/api/Products/GetProducts/";

                    productsList.Items.Clear();
                    using (var httpClient = new HttpClient())
                    {
                        var response = httpClient.GetStringAsync(new Uri($"{baseURL}?searchword={searchword}")).Result;

                        if (response != null)
                        {
                            list = JsonConvert.DeserializeObject<List<String>>(response);
                            Session["productslist"] = list;
                            userCartdetails.Visible = false;
                        }

                    }

                    displayTable(list);

                }
                catch (Exception ex)
                {
                    errorLabel.Visible = true;
                    productsTable.Visible = false;
                    errorLabel.Text = "ERROR: " + ex.Message.ToString();
                }
            }

        }

        protected void displayTable(List<string> list)
        {
            if (list.Count > 0 && string.Equals(list[0].ToString(), "ERROR"))
            {
                productsTable.Visible = false;
                errorLabel.Visible = true;
                errorLabel.Text = "ERROR: " + list[1].ToString();

            }
            if (list.Count > 0 && !string.Equals(list[0].ToString(), "ERROR"))
            {

                productsTable.Visible = true;
                errorLabel.Visible = false;
                TableRow row;
                TableCell cell1, cell2, cell3, cell4, cell5, cell6, cell7;
                productsList.Items.Clear();
                productsTable.Rows.Clear();
                tb_quantity.Text = "Enter Quantity";

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

                    string[] colvalues = review.Split('#');
                    cell1.Text = colvalues[1];
                    productsList.Items.Add(colvalues[1]);
                    cell2.Text = colvalues[2];
                    cell3.Text = colvalues[5];
                    cell4.Text = colvalues[7];
                    cell5.Text = colvalues[4];
                    cell6.Text = colvalues[6];
                    cell7.Text = colvalues[8];

                    row.Cells.Add(cell1);
                    row.Cells.Add(cell2);
                    row.Cells.Add(cell3);
                    row.Cells.Add(cell4);
                    row.Cells.Add(cell5);
                    row.Cells.Add(cell6);
                    row.Cells.Add(cell7);
                    row.Attributes.Add("style", "font-size:70%;font-family:Calibri;");
                    productsTable.Rows.Add(row);

                }

            }
            else
            {
                productsTable.Visible = false;
            }
        }



        protected void AddToCart_Click(object sender, EventArgs e)
        {

        }

        protected void CheckOutCart_Click(object sender, EventArgs e)
        {

            List<string> selectedProducts = new List<string>();
            try
            {

                foreach (KeyValuePair<string, string> entry in cart)
                {
                    if (!string.IsNullOrWhiteSpace(entry.Value) && entry.Value != "Enter Quantity")
                    {
                        string p1 = new JavaScriptSerializer().Serialize(new
                        {

                            productName = entry.Key,
                            productQuantity = entry.Value

                        });
                        selectedProducts.Add(p1);
                    }
                }


                string json = new JavaScriptSerializer().Serialize(new
                {
                    userName = tb_username.Text,
                    cartName = tb_cartname.Text,
                    products = string.Join("X", selectedProducts),
                    contactNumber = tb_contact.Text,
                    address = tb_address.Text

                }); ; ; ;
                var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://webstrar81.fulton.asu.edu/Page2/api/Cart/PostCartDetails/?cartItems=" + json);
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
            catch (Exception ex)
            {

            }
            finally
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            userCartdetails.Visible = true;
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}