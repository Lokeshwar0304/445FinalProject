﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartServiceTryIt.aspx.cs" Inherits="Assignment8.Member.CartServiceTryIt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Cart </title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body >
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" style="font-family:Calibri">
                        <li style="font-size:larger"><h3 class="navbar-brand"   style="padding-right:50px"><% Response.Write("Welcome," + Context.User.Identity.Name ); %> </h3></li>
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
        <div runat="server" style="padding-top:50px;padding-bottom:30px;padding-left:25px; padding-right:25px">
                  <h3>This is Cart  Page</h3>
                <p>User can search his/her cart details based on cart name or user name  </p>
            <asp:Label ID="labelcartname" runat="server" Text="Enter cart name or user name: "></asp:Label>
            <asp:TextBox ID="tb_cartname" runat="server" ></asp:TextBox>  
            <asp:Button ID="bn_cartdet" runat="server" Text="Cart Details" OnClick="bn_cartdet_Click" />  
        </div>
        <div  style="padding-bottom:20px">
            <asp:Label ID="errorLabel" runat="server" Text="Error:"  Visible="false"  style="color:red; font-weight:bold;"></asp:Label>  
             <asp:Table ID="cartTable" runat="server" Width="100%" Visible="false" BorderStyle="Dotted"> 
            <asp:TableRow style="font-size:90%;font-weight:bold; font-family:Calibri">
                <asp:TableCell>Cart Name</asp:TableCell>
                <asp:TableCell>UserName</asp:TableCell>
                <asp:TableCell>Contact Number</asp:TableCell>
                <asp:TableCell>Address</asp:TableCell>
            </asp:TableRow>
            </asp:Table> 
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Product Details"  Visible="false"  style="color:darkgreen; font-weight:bold; padding-bottom:20px"></asp:Label>  
             <asp:Table ID="products" runat="server" Width="100%" Visible="false" BorderStyle="Dotted"> 
            <asp:TableRow style="font-size:90%;font-weight:bold; font-family:Calibri">
                <asp:TableCell>Product Name</asp:TableCell>
                <asp:TableCell>Product Quantity</asp:TableCell>
            </asp:TableRow>
            </asp:Table> 
        </div>
       
</form>
</body>
</html>
