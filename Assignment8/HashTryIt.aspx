<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HashTryIt.aspx.cs" Inherits="WebApplication.HashTryIt" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    	 <div style="padding-top:25px">


Enter String to Hash it
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="HashIt" OnClick="Button1_Click" />
             <br />
             <br />
		     Hashed Output is:
		<asp:Label ID="Output" RunAt="server" />
             <br />
             <br />
             Verify above hash with text below<br />
             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <asp:Button ID="Button2" runat="server" Text="Verify" OnClick="Button2_Click" />
             <br />
             <br />
             Verification Result:
             <asp:Label ID="Output2" runat="server" ></asp:Label>
    <br />
             </div>
    </asp:Content>

