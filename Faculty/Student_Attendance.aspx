<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Master_Page.master" AutoEventWireup="true" CodeFile="Student_Attendance.aspx.cs" Inherits="Faculty_Student_Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Faculty - View Attendance
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <center>View Attendance</center>
    <hr style="margin-left:-41px;" /> 
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Label ID="lbl_year" runat="server" Text="Year :" />
            <asp:DropDownList ID="dd_year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_year_SelectedIndexChanged" />
            <asp:Label ID="lbl_month" runat="server" Text="Month :" />
            <asp:DropDownList ID="dd_month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_month_SelectedIndexChanged" />

            <asp:Calendar ID="Calendar1" runat="server" Width="20%" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" BorderWidth="1px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
            <br />
            <asp:GridView ID="GridView1" runat="server" Visible="False" HeaderStyle-BackColor="DodgerBlue" AutoGenerateColumns="False" Width="95%" OnRowDataBound="GridView1_RowDataBound" BorderColor="White" CellPadding="5" Font-Names="Ebrima" ForeColor="White" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Stud_id" HeaderText="Student ID">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Full_Name" HeaderText="Student Name">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Grp" HeaderText="Group" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Attend_Date" HeaderText="Date" DataFormatString="{0:d} ">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Present">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Attend") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Attend") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" SelectText="Update Attendance" ShowSelectButton="True" HeaderText="Update Attendence">
                    <ControlStyle CssClass="Button" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="DodgerBlue" />
            </asp:GridView>
            <asp:Label ID="test" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="dd_year" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="dd_month" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

