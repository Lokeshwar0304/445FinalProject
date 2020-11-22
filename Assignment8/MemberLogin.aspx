<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="Assignment8.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="padding-top:25px">
		<h3> Member Login</h3>
		<asp:Label ID="lb1" Text="Username: " RunAt="server" />
		<asp:TextBox ID="UserName" RunAt="server" />
		<br />
		<br />
		<asp:Label ID="lb2" Text="Password: " RunAt="server" />
		<asp:TextBox ID="Password" TextMode="password" RunAt="server" />
		<br />
		<br />
		<asp:Button Text="Log In" OnClick="logIn_Click" ID="logIn" RunAt="server" />
		<br />
		<br />
		<asp:CheckBox Text="Keep me signed in" ID="Persistent" RunAt="server" OnCheckedChanged="Persistent_CheckedChanged"/>
		<br />
		<br />
		<asp:Label ID="lb3" RunAt="server" Text="New User?     " />
		<asp:HyperLink ID="register" runat="server" NavigateUrl="~/MemberRegister.aspx" Text="Register" />
		<br />
		<br />
		<asp:Label ID="Output" RunAt="server" />
	</div>
</asp:Content>
