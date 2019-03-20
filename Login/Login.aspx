<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login_Login" Debug="true" %>
<!DOCTYPE >
<html>

<head>
    <title>Login - Student Information System</title>
    
    <link rel="shortcut icon" type="image/x-icon" href="../images/bg_logo.png" />
    <link href="css/Style.css" rel='stylesheet' type='text/css' />
    <link href="../Common_Style.css" rel='stylesheet' type='text/css' />

</head>
<body>
      
    <div class="header">
        Student Information System
        <a href="../About_dev/About_dev.aspx">About Developers</a>
    </div>
    <form id="form1" runat="server">

            <img class="leftimg" src="../images/bg_logo.png" />

        <div class="loginblock">
            Login<hr /><br />

            <div>
                <asp:Label ID="lbl_User" runat="server" Text="Username :" />
                <asp:TextBox ID="txt_Username" runat="server" Width="70%" placeholder="Username" />
            </div><br />
            
            <div>
                <asp:Label ID="Label1" runat="server" Text="Password :" />
                <asp:TextBox ID="txt_Pass" TextMode="Password" runat="server" Width="70%" placeholder="Password"/>
            </div><br />
            
            <div>
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="button" OnClick="cmd_login_Click" />
            </div>
        </div>
        </form>
        <div class="footer">
            Copyright 2018 | All Rights Reserved -- Developed by <strong>Rahul Patalia</strong> & <strong>Keyur Choksi</strong>
        </div>
    
</body>
</html>
