<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsServiceTryIt.aspx.cs" Inherits="Assignment8.Member.ProductsServiceTryIt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Products </title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>

<body style="padding-left:25px; padding-right:25px">
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" style="font-family:Calibri">
                        <li style="font-size:larger"><h3 class="navbar-brand"   style="padding-right:50px"><% Response.Write("Welcome," + Context.User.Identity.Name); %> </h3></li>
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

        <div style="padding-top:30px">
            <h3>This is Products  Page</h3>
                <p>User can search for COVID-related products, select the required quantity, add them to cart and save the cart.  </p>
            <div class="jumbotron" style="padding-bottom:20px">
        
        <div runat="server" style="padding-bottom:25px">
            <asp:Label ID="labelcartname" runat="server" Text="Enter an item to search: "></asp:Label>
            <asp:TextBox ID="tb_item" runat="server" ></asp:TextBox>  
            <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />  
        </div>
           
        
        <div style="padding-bottom:25px ;font-family:Calibri">
            <asp:Label ID="errorLabel" runat="server" Text="Error:"  Visible="false"  style="color:red; font-weight:bold; "></asp:Label>  
             <asp:Table ID="productsTable" runat="server" Width="100%" Visible="false" BorderStyle="Solid"> 
            <asp:TableRow style="font-size:90%;font-weight:bold; font-family:Calibri; padding-top:10px;">
                <asp:TableCell>Product Name</asp:TableCell>
                <asp:TableCell>Category Name</asp:TableCell>
                <asp:TableCell>ShipToLocations</asp:TableCell>
                <asp:TableCell>Current Price</asp:TableCell>
                <asp:TableCell>Shipping Cost</asp:TableCell>
                <asp:TableCell>1DayShippingAvailable</asp:TableCell>
                <asp:TableCell>Return Accepted</asp:TableCell>
            </asp:TableRow>
            </asp:Table> 
        </div>
            <div id="buy" style="font-family:Calibri">
             <asp:Label LabelID="Label2" runat="server" Text="Want to buy products?" ></asp:Label>
             <asp:DropDownList ID="productsList" runat="server"  >  
            <asp:ListItem Value="">Please Select</asp:ListItem>
             </asp:DropDownList>
             <asp:TextBox ID="tb_quantity" runat="server"  Text="Enter Quantity"></asp:TextBox> 
            <asp:Button ID="AddToCart" runat="server" Text="Add to Cart" OnClick="AddToCart_Click"  />  
                <asp:Button ID="Button2" runat="server" Text="Done" OnClick="Button2_Click"   />
                  
         </div>
            <div style="padding-top:30px;font-family:Calibri" id="userCartdetails" runat="server">
                <asp:Label LabelID="Label3" runat="server" Text="Enter check out details" ></asp:Label>
                  <asp:TextBox ID="tb_username" runat="server"  Text="Enter userName"></asp:TextBox>
                  <asp:TextBox ID="tb_cartname" runat="server"  Text="Enter cartName"></asp:TextBox>
                  <asp:TextBox ID="tb_contact" runat="server"  Text="Enter contact number"></asp:TextBox>
                  <asp:TextBox ID="tb_address" runat="server"  Text="Enter address"></asp:TextBox>
                <asp:Button ID="CheckOutCart" runat="server" Text="CheckOutCart" OnClick="CheckOutCart_Click" />
                 <asp:Label LabelID="resultco" runat="server" Text=" "  Visible="false"></asp:Label>
            </div>
              
            
        </div>
        </div>
    </form>
</body>
</html>
