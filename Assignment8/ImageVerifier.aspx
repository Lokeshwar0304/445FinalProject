<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="ImageVerifier.aspx.cs" Inherits="WebApplication.ImageVerifier" %>
<%@ Register Src="~/Captcha.ascx" TagName="CaptchaControl" TagPrefix="TWebControl"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="padding-top:25px">
		 TryIt for Image Verification<br />
        
		 <br />

		<TWebControl:CaptchaControl ID="Header" runat="server" />
        <br />
         <br />
        <asp:Button ID="getImageBtn" runat="server" Text="Get New Image" OnClick="getImageBtn_Click" />

         <br />
        <br />

		 Enter Text from Image<br />
         <asp:TextBox ID="CaptchaTextbox" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="VerifyBtn" runat="server" OnClick="VerifyBtn_Click" Text="Verify" />
         <br />
         <br />

		<asp:Label ID="Output" RunAt="server" />
        </div>

    </asp:Content>
