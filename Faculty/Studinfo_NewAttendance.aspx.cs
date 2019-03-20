using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faculty_Studinfo_NewAttendance : System.Web.UI.Page
{
    //============== User Define Methods ==============

    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;

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
    //============== End of User Define Methods ==============
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

    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {

        //try
        //{
            string getstud = "select cid from Login_Master where uid='" + dd_list_stud.Text + "'";
            dap = new SqlDataAdapter(getstud, con);
            dt = new DataTable();
            dap.Fill(dt);
            int cid = int.Parse(dt.Rows[0][0].ToString());
            
            if (Calendar1.SelectedDate.ToString() != "")
            {
                string ch = "Select Attend_Date from Stud_Attendance where Stud_id='" + dt.Rows[0][0].ToString() + "' and Attend_Date='" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "'";
                dap = new SqlDataAdapter(ch, con);
                dt = new DataTable();
                dap.Fill(dt);
                
                if (dt.Rows.Count == 0)
                {
                    string insert = "insert into Stud_Attendance values (" + cid + ",'" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "','" + chck_AP.Checked.ToString() + "')";
                    new SqlCommand(insert, con).ExecuteNonQuery();
                }
                else
                {
                    MessageBox.ShowMessage("This record already exists !", this.Page);
                }
            }

            string getinfo = "select Stud_Attendance.Stud_id,tbl_Students.Full_Name,tbl_Students.Grp,Stud_Attendance.Attend_Date,Stud_Attendance.Attend from Stud_Attendance,tbl_Students ";
            getinfo += "where Stud_Attendance.Stud_id=" + cid + " and ID=" + cid + " order by Attend_Date";
            dap = new SqlDataAdapter(getinfo, con);
            dt = new DataTable();
            dap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        //}
        //catch (Exception ex) { MessageBox.ShowMessage(ex.ToString(), this.Page); }
        //finally { dap.Dispose(); dt.Clear(); dt.Dispose(); }

    }
}