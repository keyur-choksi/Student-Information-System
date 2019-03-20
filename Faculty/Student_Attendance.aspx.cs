using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Faculty_Student_Attendance : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;
    SqlCommand cmd;

    void Load_Cal()
    {
        DataSet year = new DataSet();
        year.ReadXml(Server.MapPath("~/Student/Year.xml"));

        dd_year.DataTextField = "Number";
        dd_year.DataValueField = "value";

        dd_year.DataSource = year;
        dd_year.DataBind();
    }
    void Loadmonths()
    {
        DataSet Month = new DataSet();
        Month.ReadXml(Server.MapPath("~/Student/Months.xml"));

        dd_month.DataTextField = "Name";
        dd_month.DataValueField = "Number";

        dd_month.DataSource = Month;
        dd_month.DataBind();
    }

    public static class MessageBox
    {
        public static void ShowMessage(string MessageText, Page MyPage)
        {
            ScriptManager.RegisterClientScriptBlock(MyPage, typeof(Page), "MSG Box", "alert('" + MessageText.Replace("'", "\'") + "');", true);
        }
    }

    public void show_addtend(String Date)
    {
        string getinfo = "select Stud_Attendance.Stud_id,   tbl_Students.Full_Name, tbl_Students.Grp  ,Stud_Attendance.Attend_Date,    Stud_Attendance.Attend from Stud_Attendance,tbl_Students";
        getinfo += " where tbl_Students.ID=Stud_Attendance.Stud_id and Stud_Attendance.Attend_Date='" + Date + "' order by Stud_Attendance.Stud_id";
        dap = new SqlDataAdapter(getinfo, con);
        dt = new DataTable();
        dap.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;
            MessageBox.ShowMessage("No Attendance Found !", this.Page);
        }
    }

    //================== End of User Define Methods =====================
    protected void Page_Load(object sender, EventArgs e)
    {
        String cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);
        con.Open();
        if (!IsPostBack)
        {
            Load_Cal(); Loadmonths();
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {

    }
    protected void dd_year_SelectedIndexChanged(object sender, EventArgs e)
    {
        int year = Convert.ToInt16(dd_year.SelectedValue);
        int month = Convert.ToInt16(dd_month.SelectedValue);
        Calendar1.VisibleDate = new DateTime(year, month, 1);
        Calendar1.SelectedDate = new DateTime(year, month, 1);
    }
    protected void dd_month_SelectedIndexChanged(object sender, EventArgs e)
    {
        int year = Convert.ToInt16(dd_year.SelectedValue);
        int month = Convert.ToInt16(dd_month.SelectedValue);
        Calendar1.VisibleDate = new DateTime(year, month, 1);
        Calendar1.SelectedDate = new DateTime(year, month, 1);
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        show_addtend(Calendar1.SelectedDate.ToString("MM-dd-yyyy"));
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox ck = (CheckBox)e.Row.FindControl("CheckBox1");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        String qry;
        GridViewRow row = GridView1.SelectedRow;

        CheckBox ck = (CheckBox)row.FindControl("CheckBox1");
        if (ck.Checked)
        {
            //MessageBox.ShowMessage("false : "+row.Cells[0].Text+" : "+ DateTime.Parse(row.Cells[3].Text).ToString("yyyy-MM-dd"),this.Page);
            qry = "UPDATE Stud_Attendance SET Attend='false' WHERE Stud_id=" + row.Cells[0].Text + " and Attend_Date ='" + DateTime.Parse(row.Cells[3].Text).ToString("yyyy-MM-dd") + "'";
            cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
        }
        else 
        {
            //MessageBox.ShowMessage("true : " + row.Cells[0].Text + " : " + DateTime.Parse(row.Cells[3].Text).ToString("yyyy-MM-dd"), this.Page);
            qry = "UPDATE [dbo].[Stud_Attendance]SET Attend='true' WHERE Stud_id=" + row.Cells[0].Text + " and Attend_Date ='" + DateTime.Parse(row.Cells[3].Text).ToString("yyyy-MM-dd") + "'";
            cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
        }
        show_addtend(Calendar1.SelectedDate.ToString("MM-dd-yyyy"));
    }
}