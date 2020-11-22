<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeatherServiceTryIt.aspx.cs" Inherits="Assignment8.Staff.WeatherServiceTryIt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Weather Prediction</title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body style="padding-left:25px;padding-right:25px">
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
                        <li style="font-size:medium;padding-top:13px;padding-left:100px"><asp:Button Text="SignOut" OnClick="signout_Click" ID="signout" RunAt="server" BackColor="Transparent" BorderStyle="None" ForeColor="WhiteSmoke" /></li>
                    </ul>
                </div>
                
            </div>
          </div>
         <div class="jumbotron">
        <p>This page displays a 5-day weather forecast of a particular location.</p>
        <p style="font-size:100%;">Given the zipcode of a particular location, this page displays weather forecast details like temperature, minimum and maximum temperature, humidity, pressure</p>
        
    </div>

    <div style="padding-left:0px;padding-right:0px;padding-top:0px;padding-bottom:15px">
        <asp:TextBox id="tb4" Text="Please provide a valid zipcode" runat="server"  Width="100%" OnTextChanged="tb4_TextChanged" Font-Size="X-Small"  />
        <asp:Button id="b1" Text="Forecast" runat="server"  OnClick="b1_Click" Font-Size="X-Small"/>
    </div>

    <div style="padding-left:15px;padding-right:0px;padding-top:0px;padding-bottom:15px">
       <asp:Table ID="headerTable" runat="server" Width="100%" Visible="false"> 
    <asp:TableRow style="font-size:80%; font-weight:bold">
        <asp:TableCell>ZipCode</asp:TableCell>
        <asp:TableCell>City</asp:TableCell>
        <asp:TableCell>Country</asp:TableCell>
        <asp:TableCell>Latitude</asp:TableCell>
        <asp:TableCell>Longitude</asp:TableCell>
    </asp:TableRow>
    </asp:Table> 
    </div>

    <div>
    <asp:Label ID="errorLabel" runat="server" Text="Error:"  Visible="false"  style="color:red; font-weight:bold;"></asp:Label>  
    <asp:Table ID="myTable" runat="server" Width="100%" Visible="false"> 
    <asp:TableRow style="font-size:80%; font-weight:bold">
        <asp:TableCell>Date</asp:TableCell>
        <asp:TableCell>Temperature</asp:TableCell>
        <asp:TableCell>Minimum Temperature</asp:TableCell>
        <asp:TableCell>Maximum Temperature</asp:TableCell>
        <asp:TableCell>Humidity</asp:TableCell>
        <asp:TableCell>Pressure</asp:TableCell>
    </asp:TableRow>
    </asp:Table> 
    </div>
    </form>
</body>
</html>
