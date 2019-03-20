<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Master_Page.master" AutoEventWireup="true" CodeFile="Studinfo_NewAttendance.aspx.cs" Inherits="Faculty_Studinfo_NewAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Faculty - New Attendance
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <center>Add New Attendance</center>
    <hr style="margin-left:-41px;" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT uid FROM Login_Master WHERE (isActive IS NOT NULL) AND (role = @role)">
        <SelectParameters>
            <asp:Parameter DefaultValue="student" Name="role" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" width="95%" style="color:white;" >
                <tr>
                    <td width="40%" >Select Student Name :
                        <asp:DropDownList ID="dd_list_stud" runat="server" DataSourceID="SqlDataSource1" DataTextField="uid" DataValueField="uid" Width="108px"></asp:DropDownList>
                    </td>
                    <td>
                        Year :
                        <asp:DropDownList ID="dd_year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_year_SelectedIndexChanged" />
                        Month :
                        <asp:DropDownList ID="dd_month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_month_SelectedIndexChanged" />

                        <asp:Calendar ID="Calendar1" runat="server" Width="100px" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="0" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="80px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                    <td width="40%">
                        <asp:CheckBox ID="chck_AP" runat="server" Text="Present" />
                </tr>

                <tr>
                    <td colspan="3" align="center">
                        <hr />
                        <asp:Button ID="btn_Add" runat="server" Text="Click to add" CssClass="button" OnClick="btn_Add_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="te" runat="server" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" Visible="False" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="95%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Stud_id" HeaderText="Student ID">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Full_Name" HeaderText="Student Name">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Grp" HeaderText="Group" />
                    <asp:BoundField DataField="Attend_Date" HeaderText="Date" DataFormatString="{0:d} ">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="Attend" HeaderText="Present">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="dd_year" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="dd_month" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>

