<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Assignment8.Member.Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Member Page</title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>

<body>
    <form runat="server">
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
        <div style="padding-top:50px;padding-left:50px">
            <h4>Features for Member:</h4>
<ul>
<li>Viewing COVID-19 information for different states in United States</li>
<li>Searching reviews for nearby health services</li>
<li>Creating/Managing appointments with health services</li>
<li>Buying COVID safety-related equipment such as masks, thermometers, etc.,</li>
<li>Adding products to cart and currency conversion for payments</li>
</ul>
        </div>
        </form>
</body>
</html>
