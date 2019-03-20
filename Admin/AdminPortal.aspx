<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPortal.aspx.cs" EnableEventValidation="false" Inherits="Admin_AdminPortal" %>


<html>
<head runat="server">
    <title>Admin Panal - Student Information System</title>

    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />

    <link href="../Common_Style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="shortcut icon" type="image/x-icon" href="../images/bg_logo.png" />

</head>
<body>
    <form id="frm" runat="server">
        <div class="header">
            Student Information System
            <a href="../ChangePass/ChangePass.aspx">Password Manager</a>
            <asp:LinkButton ID="btn" Text="Logout" runat="server" OnClick="btn_Click" />
            <asp:LinkButton ID="btn_info" Text="About" runat="server" OnClick="btn_info_Click" />
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div runat="server" id="about" visible="false" class="bodyblock">
                    <table class="table" border="0" cellpadding="5">
                        About you
                        <hr class="hr" style="margin-left: -25px;" />
                        <tr>
                            <td style="width: 15%;">Name</td>
                            <td style="width: 1%;">:</td>
                            <td><asp:Label ID="nm" runat="server" /></td>
                            <td rowspan="3" style="width: 20%;"><asp:Image ID="Image1" runat="server" Width="70%" /></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>:</td>
                            <td><asp:Label ID="city" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Contect</td>
                            <td>:</td>
                            <td><asp:Label ID="contect" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>:</td>
                            <td colspan="2"><asp:Label ID="email" runat="server" /></td>
                        </tr>
                    </table>
                </div>

                <div class="bodyblock">
                    Welcome<asp:Label ID="lbl_admin" runat="server" />
                    <hr class="hr" />

                    <div class="bodyblock childleft">
                        <i class="fa fa-user"></i>&nbsp;&nbsp;Create a single user
            <hr class="hr" style="margin-left: -25px;" />
                        <table border="0" class="table" cellpadding="8">
                            <tr>
                                <td class="td">User Name 
                                </td>
                                <td width="1%">:</td>
                                <td>
                                    <asp:TextBox ID="txt_id" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Temparary Password
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txt_stemppass" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Assign Role
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:DropDownList ID="dd_role" runat="server" Height="25px" Width="80px">
                                        <asp:ListItem>student</asp:ListItem>
                                        <asp:ListItem>faculty</asp:ListItem>
                                        <asp:ListItem>admin</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Group
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:DropDownList ID="Grp" runat="server" Height="25px" Width="80px">
                                        <asp:ListItem>BCA</asp:ListItem>
                                        <asp:ListItem>PGDCA</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="3">
                                    <asp:Button ID="btn_addsingle" runat="server" Text="Add User" CssClass="button" OnClick="btn_Singleuser" />
                                    <asp:Label ID="lbl_user" runat="server" ForeColor="Lime" />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="bodyblock childright">
                        <i class="fa fa-users"></i>&nbsp;&nbsp;Multiple Student Users
            <hr class="hr" style="margin-left: -25px;" />
                        <table border="0" class="table" cellpadding="6">
                            <tr>
                                <td class="td">Prefix
                                </td>
                                <td width="1%">:</td>
                                <td>
                                    <asp:TextBox ID="txt_prefix" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Start ID
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txt_startid" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>End ID
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txt_Endid" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Temparary Password
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txt_temppass" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Group
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:DropDownList ID="dd_grp" runat="server" Height="25px" Width="80px">
                                        <asp:ListItem>BCA</asp:ListItem>
                                        <asp:ListItem>PGDCA</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="3">
                                    <asp:Button ID="btn_multiuser" runat="server" Text="Add Users" CssClass="button" OnClick="btn_multiuser_Click" />
                                    <asp:Label ID="lbl_multi" runat="server" ForeColor="Lime" />
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div class="Gridtable">
                        All Users in Portal<hr />
                        <asp:GridView ID="GridView1" Width="100%" runat="server" DataKeyNames="cid" AutoGenerateColumns="False" CellPadding="7" ForeColor="White" Font-Names="Ebrima" Font-Size="20px"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:BoundField DataField="cid" HeaderText="Candidate ID">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="uid" HeaderText="User Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="ups" HeaderText="Password">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="role" HeaderText="Role in Portal">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="grp" HeaderText="Group">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:CheckBoxField DataField="isActive" HeaderText="Active">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>

                                <asp:CommandField ButtonType="Button" HeaderText="Delete User" SelectText="Delete" ShowSelectButton="True">
                                    <ControlStyle CssClass="Button" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>

                            </Columns>
                            <HeaderStyle BackColor="#000000" />
                        </asp:GridView>
                    </div>

                </div>

                <div class="adminfooter">
                    Copyright 2018 | All Rights Reserved -- Developed by <strong>Rahul Patalia</strong> & <strong>Keyur Choksi</strong>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleting" />
                <asp:AsyncPostBackTrigger ControlID="btn_info" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

    </form>
</body>
</html>
