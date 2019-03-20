<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Master_Page.master" AutoEventWireup="true" CodeFile="Studinfo_index.aspx.cs" Inherits="Faculty_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Faculty - Student Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <center>Student Information</center>
    <hr style="margin-left:-41px;" />
    Select Student Name : <asp:DropDownList ID="dd_list_stud" runat="server" DataSourceID="SqlDataSource1" DataTextField="uid" DataValueField="uid" Width="108px" ></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT uid FROM Login_Master WHERE (isActive IS NOT NULL) AND (role = @role)">
        <SelectParameters>
            <asp:Parameter DefaultValue="student" Name="role" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btn" runat="server" Text="Click Show Info!" CssClass="button" OnClick="btn_Click" />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="table" border="0" id="tbl_stud" cellpadding="5" runat="server" visible="false">
        <tr>
            <th colspan="3">
                Student Information    
            </th>
        </tr>
        <tr>
            <td class="td">
                Student Name :
            </td>
            <td>
                <asp:Label ID="lbl_nm" runat="server" Text="" />
            </td>
            <td rowspan="3" class="tdimg">
                <asp:Image ID="img_stud" runat="server" Width="100%" />
            </td>
        </tr>
        <tr>
            <td class="td">
                Group : 
            </td>
            <td >
                <asp:Label ID="lbl_grp" runat="server" Text="" />
            </td>
        </tr>
        <tr>
            <td class="td">
                Current Semester : 
            </td>
            <td >
                <asp:Label ID="lbl_Sem" runat="server" Text="" />
            </td>
        </tr>
        <tr>
            <td class="td">
                Birth Date :
            </td>
            <td colspan="2" >
                <asp:Label ID="lbl_db" runat="server" Text="" />
            </td>
        </tr>
        <tr>
            <td class="td">
                Gender :
            </td>
            <td colspan="2">
                <asp:Label ID="lbl_gen" runat="server" Text="" />
            </td>
        </tr>
        <tr>
            <td class="td">
                Contect Info :
            </td>
            <td colspan="2" >
                <asp:Label ID="lbl_mobile" runat="server" Text="" />
            </td>
        </tr>
    </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
<br />
</asp:Content>

