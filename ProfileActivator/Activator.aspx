<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activator.aspx.cs" Inherits="ProfileActivator_Activator" %>

<html>

<head>
    <title>Profile Activator - Student Information System</title>
    <link rel="stylesheet" href="../Common_Style.css" />
    <link rel="stylesheet" href="css/Style.css" />
    <link rel="shortcut icon" type="image/x-icon" href="../images/bg_logo.png" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            Student Information System 
        <asp:LinkButton ID="btn" Text="Logout" runat="server" OnClick="btn_Click" />
        </div>

        <div class="bodyblock">
            Profile Activator
            <asp:Label ID="proname" runat="server" />
            <hr>
            <table class="table" cellpadding="5" id="tbl_stud" runat="server">
                <tr class="tr">
                    <td class="td">Full Name :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_Stut_nm" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RFV1" runat="server" ErrorMessage="This field can't be empty!" ControlToValidate="txt_Stut_nm" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td class="td">Profile Picture :
                    </td>
                    <td>
                        <asp:FileUpload ID="FU_Stud_Img" runat="server" /><br />
                    </td>
                </tr>
                <tr>
                    <td>Father's Name :<br />
                        <br />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_father_nm" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RFV3" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_father_nm" />
                    </td>
                </tr>
                <tr>
                    <td>Mother's Name :<br />
                        <br />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_mother_nm" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RFV4" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_mother_nm" />
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth :<br />
                        <br />
                    </td>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lbl_year" runat="server" Text="Year :" Visible="false" /><asp:DropDownList ID="dd_year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_year_SelectedIndexChanged" />
                                <asp:Label ID="lbl_month" runat="server" Text="Month :" Visible="false" /><asp:DropDownList ID="dd_month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_month_SelectedIndexChanged" />
                                <asp:Calendar ID="Calendar1" runat="server" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                </asp:Calendar>
                                <asp:Label ID="Lbl_dob" runat="server" Visible="true" /><br />
                                <br />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dd_year" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="dd_month" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>Gender :<br />
                        <br />
                    </td>
                    <td>
                        <asp:RadioButton ID="rb_male" Text="Male" runat="server" GroupName="gen" Checked="true" />
                        <asp:RadioButton ID="rb_female" Text="Female" runat="server" GroupName="gen" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>Group :
                    </td>
                    <td>
                        <asp:Label ID="lblgrp" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>Mobile No. :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_mobile" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_mobile" />
                    </td>
                </tr>
                <tr>
                    <td>Parent's Mobile :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_parent_mobile" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_parent_mobile" />
                    </td>
                </tr>
                <tr>
                    <td>Address :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" BackColor="Transparent" Width="600px" Height="200px" Font-Names="Ebrima" Font-Size="Medium" ForeColor="White" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_address" />
                    </td>
                </tr>
                <tr>
                    <td>Father's Profession :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_father_pro" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_father_pro" />
                    </td>
                </tr>
                <tr>
                    <td>Father's Work Place :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_fatherwork" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_fatherwork" />
                    </td>
                </tr>
                <tr>
                    <td>Mother's Profession:<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_mother_pro" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_mother_pro" />
                    </td>
                </tr>
                <tr>
                    <td>Mother's Profession Work Place :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txt_motherwork" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_motherwork" />
                    </td>
                </tr>
                <tr>
                    <td>Current Semester :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="dd_sem" runat="server" Font-Size="15pt" ForeColor="Red"
                            Height="30px" Width="187px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="dd_sem" />
                    </td>
                </tr>
                <tr>
                    <td>New Password :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtnpass" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txtnpass" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtcpass" runat="server" /><br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToCompare="txtnpass" ControlToValidate="txtcpass"
                            ErrorMessage="Must Be Same" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Activate Profile" OnClick="Button1_Click1" />
                    </td>
                </tr>
            </table>

            <table class="table" id="tbl_other" runat="server" visible="false">
                <tr class="tr">
                    <td class="td">Full Name :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtname" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field can't be empty!" ControlToValidate="txtname" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td class="td">Profile Picture :
                    </td>
                    <td>
                        <asp:FileUpload ID="FU_Img" runat="server" /><br />
                    </td>
                </tr>
                <tr>
                    <td>Group :</td>
                    <td>
                        <asp:Label ID="lblgroup" runat="server" /></td>
                </tr>
                <tr class="tr">
                    <td class="td">Address :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtaddr" runat="server" TextMode="MultiLine" BackColor="Transparent" Width="600px" Height="200px" Font-Names="Ebrima" Font-Size="Medium" ForeColor="White" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field can't be empty!" ControlToValidate="txtaddr" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td class="td">Mobile :
                    </td>
                    <td>
                        <asp:TextBox ID="txtmno" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="This field can't be empty!" ControlToValidate="txtmno" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                </tr>
                <tr class="tr">
                    <td class="td">Email :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtemail" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="This field can't be empty!" ControlToValidate="txtemail" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtemail" ErrorMessage="Invalid Email" ForeColor="Red"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </td>
                </tr>
                <tr>
                    <td>New Password :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtnpass1" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txtnpass1" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtcpass1" runat="server" /><br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server"
                            ControlToCompare="txtnpass1" ControlToValidate="txtcpass1"
                            ErrorMessage="Must Be Same" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="Button2" runat="server" CssClass="button" Text="Activate Profile" OnClick="Button1_Click1" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

