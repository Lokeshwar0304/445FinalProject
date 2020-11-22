<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Assignment8.Staff.Staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Staff Page</title>
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
                        <li style="font-size:larger"><h3 class="navbar-brand"   style="padding-right:200px"><% Response.Write("Hello Staff, " + Context.User.Identity.Name); %></h3></li>
                        <li style="font-size:large"><a runat="server" href="~/Staff/Staff">Home</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Staff/WeatherServiceTryIt">Weather Prediction</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Staff/NewsFocus">News</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Staff/AddStaff">Add Staff</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Staff/ViewUsers">View Users</a></li>
                        <li style="font-size:large"><a runat="server" href="~/Staff/Encryption">Encrypt-Decrypt</a></li>
                        <li style="font-size:medium;padding-top:13px;padding-left:100px"><asp:Button Text="SignOut" OnClick="signout_Click" ID="Button1" RunAt="server" BackColor="Transparent" BorderStyle="None" ForeColor="WhiteSmoke" /></li>
                    </ul>
                </div>
                
            </div>
          </div>
          <div style="padding-top:50px;padding-left:50px;">
            <h4>Features for Staff:</h4>
            <ul>
         
                <li>Viewing Members list using the application</li>
                <li>Using Weather Service in order to get weather forecast</li>
                <li>Newsfocus Service in order to get latest news on COVID-19</li>	
                <li>Adding new Staff member</li>
            </ul>
        </div>
    </form>
</body>
</html>
