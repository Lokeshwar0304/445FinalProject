<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Calendar.ascx.cs" Inherits="Assignment8.Calendar" %>


	<asp:TextBox ID="txtDate" runat="server" Width="115px" Height="25px"></asp:TextBox>
    <asp:ImageButton ID="ImgBtn" runat="server" 
    ImageUrl="~/Images/calendar.jpg" onclick="ImgBtn_Click" Height="23px"  />
    <br />
    <br />
    <asp:Calendar ID="Calendar1"  runat="server" onselectionchanged="Calendar1_SelectionChanged">
    
    </asp:Calendar>

