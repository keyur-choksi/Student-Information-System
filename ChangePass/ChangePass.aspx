<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="ChangePass_ChangePass" %>

<html>

<head>
    <title>Change Password - Student Information System</title>
    <link rel="stylesheet" href="../Common_Style.css" />
    <link rel="stylesheet" href="css/Style.css" />
    <link rel="shortcut icon" type="image/x-icon" href="../images/bg_logo.png" />
</head>
<body>
    <div class="header">
        Student Information System <a href="../Login/Login.aspx">Log Out</a>
    </div>

    <div class="bodyblock1">
        Change Password <hr>
        <form id="form1" runat="server">
           <table class="table"> 
               <tr> <td>User :</td>
                <td><asp:DropDownList ID="dd_id" runat="server" DataSourceID="SqlDataSource1" DataValueField="uid" Font-Bold="True" Font-Size="Medium" Width="100%" Height="10%"/>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [uid] FROM [Login_Master] WHERE ([isActive] IS NOT NULL)" />
            
                    </td></tr>
               <tr>
                   <td>
            Enter Admin Password :
                       </td>
                   <td>
                <asp:TextBox ID="txtadminpas"  TextMode="Password" runat="server" Width="100%" Height="30px" />
            </td></tr>
               <tr>
                   <td>
            Enter New Password :</td>
                   <td>
                <asp:TextBox ID="txtnewpas"  TextMode="Password" runat="server" Width="100%" Height="30px" />
            </td></tr>
               <tr>
                    <td colspan="2"><br> <center>
                <asp:Button ID="cmd_update" runat="server" Text="Update Password" CssClass="button" onclick="cmd_update_Click" />
                </td></tr>
            </table>
        </form>
    </div>
</body>
</html>
