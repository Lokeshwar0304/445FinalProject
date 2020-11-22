<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyConversionTryIt.aspx.cs" Inherits="Assignment8.Member.CurrencyConversionTryIt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Currency Coverter Page</title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body>
    <form id="form1" runat="server">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" style="font-family:Calibri">
                        <li style="font-size:larger"><h3 class="navbar-brand"   style="padding-right:50px"><% Response.Write("Hello " + Context.User.Identity.Name + ", Welcome."); %> </h3></li>
                       <li style="font-size:large"><a runat="server" href="~/Member/Member">Home</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Member/CovidInfo">Covid Info</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Member/ReviewsServiceTryIt">Reviews</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Member/CreateAppointment">Create Appointment</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Member/ProductsServiceTryIt">Products</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Member/CartServiceTryIt">Cart</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Member/CurrencyConversionTryIt">CurrencyConversion</a></li>
                        <li style="font-size:medium;padding-top:13px;padding-left:30px"><asp:Button Text="SignOut" OnClick="signout_Click" ID="signout" RunAt="server" BackColor="Transparent" BorderStyle="None" ForeColor="WhiteSmoke" /></li>
                    </ul>
                </div>
                
            </div>
          </div>
        <div style="padding-top:50px;padding-bottom:30px;padding-left:25px; padding-right:25px" >
            <h3>This is Currency Conversion  Page</h3>
            <p>User can look for currency exchange values.  </p>
            <br />
            <br />
        <p>
            <asp:Label ID="Label2" runat="server" Text="From currency"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" style="margin-left: 83px"></asp:TextBox>
        </p>
        <p>
        <asp:Label ID="Label3" runat="server" Text="To currency"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" style="margin-left: 98px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Amount "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" style="margin-left: 120px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 190px" Text="Converter Button" />
        </p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Converted Value "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" style="margin-left: 60px"></asp:TextBox>
                </p>
        </div>
    </form>
</body>
</html>
