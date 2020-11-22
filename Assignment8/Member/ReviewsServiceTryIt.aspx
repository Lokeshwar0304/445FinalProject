<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewsServiceTryIt.aspx.cs" Inherits="Assignment8.Member.ReviewsServiceTryIt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Reviews </title>
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
            <h3>This is Hospital Reviews Page</h3>
                <p>This page displays hospital reviews. User can add reviews to existing hospitals or add review for a new hospital.  </p>
            <div class="jumbotron" style="padding-bottom:20px">
            <asp:Label ID="errorLabel" runat="server" Text="Error:"  Visible="false"  style="color:red; font-weight:bold;"></asp:Label>  
             <asp:Table ID="reviewTable" runat="server" Width="100%" Visible="false"> 
            <asp:TableRow style="font-size:90%;font-weight:bold; font-family:Calibri">
                <asp:TableCell>Hospital Name</asp:TableCell>
                <asp:TableCell>Hospital Address</asp:TableCell>
                <asp:TableCell>Distance(mi)</asp:TableCell>
                <asp:TableCell>Ratings</asp:TableCell>
                <asp:TableCell>Reviews</asp:TableCell>
                <asp:TableCell>Beds Available</asp:TableCell>
                <asp:TableCell>Ventilators Available</asp:TableCell>
                <asp:TableCell>COVID Testing</asp:TableCell>
                <asp:TableCell>Contact</asp:TableCell>
            </asp:TableRow>
            </asp:Table> 
        </div>

        
        <div style="padding-bottom:20px"> 
        <p style="font-family:Calibri">Do you want to provide a review?</p>  
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" >  
        <asp:ListItem Value="">Please Select</asp:ListItem>  
         </asp:DropDownList>
        <asp:TextBox ID="tb_review" runat="server"  Text="Enter Review" style="font-family:Calibri"></asp:TextBox>  
        <asp:TextBox ID="tb_rating" runat="server" Text="Enter Rating" style="font-family:Calibri"></asp:TextBox>  
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />  
        </div>

        <div style="padding-bottom:15px"> 
        <p style="font-family:Calibri">Do you want to provide a review to a new hospital?</p>  
        <asp:TextBox ID="tb_new_hospital" runat="server"  Text="Enter Hospital Name" OnTextChanged="tb_new_hospital_TextChanged" AutoPostBack="true" style="font-family:Calibri"></asp:TextBox>  
        <asp:TextBox ID="tb_new_review" runat="server"  Text="Enter Review" style="font-family:Calibri"></asp:TextBox>  
        <asp:TextBox ID="tb_new_rating" runat="server" Text="Enter Rating" style="font-family:Calibri"></asp:TextBox>
        <asp:TextBox ID="tb_new_contact" runat="server" Text="Enter Contact number" style="font-family:Calibri"></asp:TextBox> 
         <div style="padding-bottom:15px">  
            <asp:Label LabelID="Label1" runat="server" Text="Is COVID testing available?"  style="font-family:Calibri"></asp:Label>  
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" GroupName="testing" style="font-family:Calibri; font-weight:normal" />  
            <asp:RadioButton ID="RadioButton2" runat="server" Text="No" GroupName="testing"  style="font-family:Calibri; font-weight:normal"/>  
        </div>
         <div style="padding-bottom:15px">  
            <asp:Label LabelID="Label2" runat="server" Text="Are Ventilators available?" style="font-family:Calibri" ></asp:Label>  
            <asp:RadioButton ID="RadioButton3" runat="server" Text="Yes" GroupName="vent" style="font-family:Calibri; font-weight:normal" />  
            <asp:RadioButton ID="RadioButton4" runat="server" Text="No" GroupName="vent"  style="font-family:Calibri; font-weight:normal"/>  
        </div>  
        <asp:Button ID="SubmitButton2" runat="server" Text="Submit" OnClick="SubmitButton2_Click" />  
        </div>
        

        
        </div>
    </form>
</body>
</html>
