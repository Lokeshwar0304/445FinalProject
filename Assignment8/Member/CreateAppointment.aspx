<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAppointment.aspx.cs" Inherits="Assignment8.Member.CreateAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Create Appointment</title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body style="padding-left:25px;padding-right:25px;padding-top:25px">
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
        <div>
            
        <div style="padding-left:75px; padding-right:25px;padding-top:40px">
            <h3>This is Appointment  Page</h3>
                <p>User can book or update an appointment.  </p>
            <br />
            Enter User ID to filter appointments: 
            <asp:TextBox ID="getUserId" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="getAppts" runat="server" Text="Get" OnClick="getAppts_Click" />
            <br />
            <br />
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
&nbsp;<hr />

                User ID&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="userId" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;<br />

                Appt ID&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="apptId" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;<br />
                FirstName&nbsp;&nbsp; <asp:TextBox ID="firstname" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;<br />
            
                Lastname:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="lastname" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 
            <br />
            Age&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  <asp:TextBox ID="age" runat="server"></asp:TextBox>
            <br />
            Time&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="time" runat="server"></asp:TextBox>
            <br />
           Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="date" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="createBtn" runat="server" Text="Create/Update Appointment" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Result"></asp:Label>
                <br />

                <hr />
            Delete Appointment
            <br />
            User ID&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:TextBox ID="deleteUserId" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;<br />

                Appt ID&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:TextBox ID="deleteApptId" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;<br />
            <asp:Button ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" />

           <br />
             <asp:Label ID="Label2" runat="server" Text="Result"></asp:Label>
                <br />
        </div>
        </div>
    </form>
</body>
</html>
