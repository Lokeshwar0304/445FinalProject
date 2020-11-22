<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncryptDecrypt.aspx.cs" Inherits="EncryptionDecryption.EncryptDecrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Encryption-Decryption</title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>This is the TryIt page for text encryption-decryption. This is used in Member/Staff password encryption-decryption in the form of DLL.</h3>
        <div style="padding-left:30px">
             <p>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Encryption Decryption Service"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Enter to Encrypt "></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Width="337px" Height="36px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ENCRYPT" Width="97px" />
    </p>
    <p>
        <asp:TextBox ID="TextBox2" runat="server" Width="624px" OnTextChanged="TextBox2_TextChanged" Height="31px"></asp:TextBox>
    </p>
    <p>
        Enter to Decrypt</p>
    <p>
        <asp:TextBox ID="TextBox3" runat="server" Width="336px" OnTextChanged="TextBox3_TextChanged" Height="35px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Decrypt" Width="99px" />
    </p>
    <p>
        <asp:TextBox ID="TextBox4" runat="server" Width="616px" OnTextChanged="TextBox4_TextChanged" Height="32px"></asp:TextBox>
    </p>
            <br />
            <br />
            <asp:Label ID="errorMsg" runat="server" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
