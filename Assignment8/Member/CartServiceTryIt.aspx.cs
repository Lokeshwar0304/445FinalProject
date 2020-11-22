using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment8.Member
{
    public partial class CartServiceTryIt : System.Web.UI.Page
    {
        public Dictionary<string, string> cart = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bn_cartdet_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(tb_cartname.Text))
            {
                errorLabel.Visible = false;
                try
                {
                    String baseURL = "http://webstrar81.fulton.asu.edu/Page2/api/Cart/GetCartDetails/";


                    using (var httpClient = new HttpClient())
                    {
                        var response = httpClient.GetStringAsync(new Uri($"{baseURL}?name={tb_cartname.Text}")).Result;

                        if (response != null)
                        {
                            cart = JsonConvert.DeserializeObject<Dictionary<string, string>>(response);

                        }

                    }
                    if (cart.Count > 0 && cart.ContainsKey("ERROR"))
                    {
                        cartTable.Visible = false;
                        errorLabel.Visible = true;
                        errorLabel.Text = "ERROR: " + cart["ERROR"];

                    }
                    if (cart.Count > 0 && !cart.ContainsKey("ERROR"))
                    {

                        cartTable.Visible = true;
                        errorLabel.Visible = false;
                        TableRow row;
                        TableCell cell1, cell2, cell3, cell4;

                        row = new TableRow();
                        cell1 = new TableCell();
                        cell2 = new TableCell();
                        cell3 = new TableCell();
                        cell4 = new TableCell();

                        cell1.Text = cart["CartName"];
                        cell2.Text = cart["UserName"];
                        cell3.Text = cart["ContactNumber"];
                        cell4.Text = cart["Address"];

                        row.Cells.Add(cell1);
                        row.Cells.Add(cell2);
                        row.Cells.Add(cell3);
                        row.Cells.Add(cell4);

                        cartTable.Rows.Add(row);

                        for (int i = 0; i < cart.Count - 4; i++)
                        {
                            row = new TableRow();
                            cell1 = new TableCell();
                            cell2 = new TableCell();
                            var p = "Product" + i.ToString();
                            var details = cart[p];

                            if (details != null && !string.IsNullOrWhiteSpace(details))
                            {
                                Label1.Visible = true;
                                products.Visible = true;
                                cell1.Text = details.Split('X')[0];
                                cell2.Text = details.Split('X')[1];
                            }
                            row.Cells.Add(cell1);
                            row.Cells.Add(cell2);
                            products.Rows.Add(row);
                        }


                    }
                    else
                    {
                        cartTable.Visible = false;
                        Label1.Visible = false;
                        products.Visible = false;
                    }




                }
                catch (Exception ex)
                {
                    errorLabel.Visible = true;
                    cartTable.Visible = false;
                    Label1.Visible = false;
                    products.Visible = false;
                    errorLabel.Text = "ERROR: " + ex.Message.ToString();
                }
            }
            else
            {
                errorLabel.Visible = true;
                errorLabel.Text = "ERROR: Enter a valid user name or cart name";
            }
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}