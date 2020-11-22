<%@ Page Title="Member Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberRegister.aspx.cs" Inherits="Assignment8.About" %>
<%@ Register src="Calendar.ascx" tagname="CalendarUserControl" tagprefix="uc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
	 <div style="padding-top:25px">
		<h3>Register a New Member</h3>
		 
		<asp:Label ID="lb1" Text="Username: " RunAt="server" />
		<asp:TextBox ID="UserName" RunAt="server"  OnTextChanged="UserName_TextChanged" AutoPostBack="false"  />
		
		<asp:Label ID="errorUser" Visible="false" RunAt="server" />
		<br />
		<br />Submit
		<asp:Label ID="lb2" Text="Password: " RunAt="server" />
		<asp:TextBox ID="Password" TextMode="password" RunAt="server" />
		
		<br />
		<br />
		<asp:Label ID="lb22" Text="Re-enter Password: " RunAt="server" />
		<asp:TextBox ID="RePassword" TextMode="password" RunAt="server"    />
		<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="RePassword" ErrorMessage="Password  must be same" ForeColor="Red" ></asp:CompareValidator>
		<br />
		<br />
		 Date of Birth: <uc1:CalendarUserControl ID="CalendarUserControl1" runat="server" />		 
		 <br />
		 <br />
		 <asp:Image ID="captchaImage" runat="server" ImageUrl="~/Captcha.aspx"/>
		<asp:Button Text="Refresh" OnClick="bnRefresh_Click" ID="bnRefresh" RunAt="server" />
		
        <asp:Label ID="lbcaptcha" Text="Please enter the verification code: " RunAt="server" />
        <asp:TextBox ID="tbcaptcha" runat="server" ></asp:TextBox>
		<br />
		<br />
		<asp:Button Text="Register" OnClick="register_Click" ID="register" RunAt="server" />
		<asp:Button Text="Login" OnClick="login_Click" ID="login" RunAt="server" />
	    <br />
		<br />
		<asp:Label ID="Output" RunAt="server"  Font-Bold="true" />
		
		
	</div>

   
		



   
</asp:Content>
