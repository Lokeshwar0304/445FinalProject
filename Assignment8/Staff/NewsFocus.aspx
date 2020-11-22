<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsFocus.aspx.cs" Inherits="Assignment8.Staff.NewsFocus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> News Page</title>
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
                        <li style="font-size:medium;padding-top:13px;padding-left:100px"><asp:Button Text="SignOut" OnClick="Button1_Click" ID="Button1" RunAt="server" BackColor="Transparent" BorderStyle="None" ForeColor="WhiteSmoke" /></li>
                    </ul>
                </div>
                
            </div>
          </div>
        
             <div style="padding-left:25px;padding-top:50px">
             <p>NewsFocus accepts a string of keywords as parameter and returns list of URLS with the given keywords using Google news Api.</p>
                <br />
                 <br />
     
             Enter keyword for newfocus:
             <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" />
             <br />
             <br />
            <br />
             <asp:TextBox ID="TextBox4" runat="server" Height="278px" TextMode="MultiLine"  Width="2599px"></asp:TextBox>
             <br />
        </div>
        
    </form>
</body>
</html>
