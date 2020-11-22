<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Assignment8.Staff.AddStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Add Staff</title>
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

        <div style="padding-top:30px">
            <h3> Enter details below to add new Staff</h3>
            <asp:Label ID="lb1" Text="Username: " RunAt="server" />
		    <asp:TextBox ID="UserName" RunAt="server" AutoPostBack="false"  />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="User Name is Required" ControlToValidate="UserName" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lb2" Text="Password: " RunAt="server" />
		    <asp:TextBox ID="Password" TextMode="password" RunAt="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is Required" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
		    <br />
		    <asp:Label ID="lb22" Text="Re-enter Password: " RunAt="server" />
		    <asp:TextBox ID="RePassword"  RunAt="server"  />
		    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="RePassword" ErrorMessage="Password  must be same" ForeColor="Red" ></asp:CompareValidator>
		    <br />
		    <br />
            <asp:Button Text="Add" OnClick="bnAdd_Click" ID="bnAdd" RunAt="server" />
            <br />
            <br />
            <asp:Label ID="errorUser" Visible="false" RunAt="server" />

        </div>
    </form>
</body>
</html>
