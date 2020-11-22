<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment8._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3>COVID HEALTH SERVICES</h3>
        <p style="font-size:18px">The purpose of this integrated application is to help the public in getting COVID testing done.
The application has two different user roles namely Member and Staff. 
Members are the people who can get COVID-19 related features, booking testing appointments, etc., whereas staff can manage users, add new staff etc.,</p>
        <p style="font-size:18px">Login to corresponding Member/Staff Page to view the features provided.</p>
        
    </div>

    <div>
        <asp:Button OnClick="bnMemRegister_Click" ID="bnMemRegister" runat="server" Text="Member Register"  />  
        <asp:Button OnClick="bnMemLogin_Click" ID="bnMemLogin" runat="server" Text="Member Login"  />  
        <asp:Button OnClick="bnMemPage_Click" ID="bnMemPage" runat="server" Text="Member Page"  />  
        <br />
        <br />
        <asp:Button OnClick="bnStaffPage_Click" ID="bnStaffPage" runat="server" Text="Staff Page"  />  
        <asp:Button OnClick="bnStaffLogin_Click" ID="bnStaffLogin" runat="server" Text="Staff Login"  />   
    </div>

    <div style="padding-top:50px">
        <h3> Below are the explicit TryIt Pages</h3>
        <a href="ImageVerifier.aspx">TryIt page for Image Verifier</a>
        <br />
        <a href="EncryptDecrypt.aspx">TryIt page for Encryption-Decryption</a>
        <br />
        <a href="HashTryIt.aspx">TryIt page for text hashing</a>
        <br />


    </div>

</asp:Content>
