<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Student_index" %>


<html>
<head runat="server">
    <title>Home - Student</title>

    <link rel="shortcut icon" type="image/x-icon" href="../images/bg_logo.png" />
    <link rel="stylesheet" type="text/css" href="../Common_Style.css" />
    <link rel="stylesheet" type="text/css" href="css/Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            Student Information System 
            <asp:LinkButton ID="btn" Text="Logout" runat="server" OnClick="btn_Click" />
        </div>

        <div class="bodyblock">
            Student Information
            <hr class="hr" />
            <table class="table" border="0" cellpadding="5">
                <tr class="tr">
                    <td class="td">Full Name :<br />
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="lbl_Stud_nm" runat="server" Text="Rahul Patalia " Visible="true" />
                        <asp:TextBox ID="txt_Stut_nm" runat="server" Text="" Visible="false" Width="415px" /><br />
                        <asp:RequiredFieldValidator ID="RFV1" runat="server" ErrorMessage="This field can't be empty!" ControlToValidate="txt_Stut_nm" Font-Bold="True" Font-Names="Arial" ForeColor="Red" />
                    </td>
                    <td rowspan="4" class="td">
                        <asp:Image ID="Img_stud" runat="server" Height="10%" Width="100%" />
                        <asp:FileUpload ID="FU_Stud_Img" runat="server" Visible="false" /><br />
                    </td>
                </tr>
                <tr>
                    <td>Father's Name :<br />
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="Lbl_father_nm" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:TextBox ID="txt_father_nm" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RFV3" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_father_nm" />
                    </td>
                </tr>
                <tr>
                    <td>Mother's Name :<br />
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="Lbl_mother_nm" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:TextBox ID="txt_mother_nm" runat="server" Text="" Visible="false" /><br />
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
                                <asp:Label ID="lbl_year" runat="server" Text="Year :" Visible="false" /><asp:DropDownList ID="dd_year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_year_SelectedIndexChanged" Visible="false" />
                                <asp:Label ID="lbl_month" runat="server" Text="Month :" Visible="false" /><asp:DropDownList ID="dd_month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_month_SelectedIndexChanged" Visible="false" />
                                <asp:Calendar ID="Calendar1" runat="server" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                </asp:Calendar>
                                <asp:Label ID="Lbl_dob" runat="server" Visible="true" /><br /><br />
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
                        <asp:Label ID="lbl_gen" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:RadioButton ID="rb_male" Text="Male" runat="server" GroupName="gen" Visible="false" />
                        <asp:RadioButton ID="rb_female" Text="Female" runat="server" GroupName="gen" Visible="false" />
                        <br />
                        <br />
                    </td>
                    <td colspan="2">Group : 
                        <asp:Label ID="lbl_grp" runat="server" Text="" Visible="true" />
                        <asp:TextBox ID="txt_grp" runat="server" Text="" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td>Mobile No. :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_mobile" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:TextBox ID="txt_mobile" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_mobile" />
                    </td>
                </tr>
                <tr>
                    <td>Parent's Mobile :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_parent_mobile" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:TextBox ID="txt_parent_mobile" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_parent_mobile" />
                    </td>
                </tr>
                <tr>
                    <td>Address :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_address" runat="server" Text="" Enabled="False" />
                        <asp:TextBox ID="txt_address" runat="server" Text="" Visible="false" TextMode="MultiLine" BackColor="Transparent" Width="600px" Height="200px" Font-Names="Ebrima" Font-Size="Medium" ForeColor="White" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_address" />
                    </td>
                </tr>
                <tr>
                    <td>Father's Profession :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_father_pro" runat="server" Text="" Visible="true" />
                        <asp:TextBox ID="txt_father_pro" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_father_pro" />
                    </td>
                </tr>
                <tr>
                    <td>Father's Work Place :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_fatherwork" runat="server" Text="" Visible="true" />
                        <asp:TextBox ID="txt_fatherwork" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_fatherwork" />
                    </td>
                </tr>
                <tr>
                    <td>Mother's Profession :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_mother_pro" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:TextBox ID="txt_mother_pro" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_mother_pro" />
                    </td>
                </tr>
                <tr>
                    <td>Mother's Profession Work Place :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lbl_motherwork" runat="server" Text="" Visible="true" />
                        <asp:TextBox ID="txt_motherwork" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_motherwork" />
                    </td>
                </tr>
                <tr>
                    <td>Current Semester :<br />
                        <br />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Lbl_sem" runat="server" Text="Rahul Patalia" Visible="true" />
                        <asp:TextBox ID="txt_sem" runat="server" Text="" Visible="false" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field can't be empty!" Font-Bold="True" Font-Names="Arial" ForeColor="Red" ControlToValidate="txt_sem" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="Btn_Edit" runat="server" CssClass="button" Text="Update Details" OnClick="Btn_Edit_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
