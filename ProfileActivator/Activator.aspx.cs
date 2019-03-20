using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProfileActivator_Activator : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;

    string role, grp, uid, cid;

    public void getinfo()
    {
        string sel = "select cid,uid,role,grp from Login_Master where uid='" + Session["uid"].ToString() + "'";
        dap = new SqlDataAdapter(sel, con);
        dt = new DataTable();
        dap.Fill(dt);
        dap.Update(dt);

        if (dt.Rows.Count > 0)
        {
            cid = dt.Rows[0][0].ToString();
            uid = dt.Rows[0][1].ToString();
            role = dt.Rows[0][2].ToString();
            grp = dt.Rows[0][3].ToString();
        }
        if (role == "faculty" || role == "admin")
        {
            tbl_other.Visible = true;
            tbl_stud.Visible = false;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string se = Session["role"] as string;

        if (string.IsNullOrEmpty(se))
        {
            Response.Redirect("~/Login/Login.aspx");
        }

        String cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);
        con.Open();

        getinfo();

        if (!IsPostBack)
        {
            Load_Cal();
            Loadmonths();
        }

        lblgroup.Text = lblgrp.Text = grp;
        proname.Text = "(" + role;
        proname.Text += " : " + uid + ")";

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (role == "student")
        {
            string act = "update Login_Master set isActive='" + 1 + "',ups='" + txtcpass.Text + "' where uid='" + uid + "'";
            new SqlCommand(act, con).ExecuteNonQuery();

            string gen;
            if (rb_male.Checked) gen = "Male"; else gen = "Female";

            string ins = "insert into tbl_Students values(" + cid + ",'" + txt_Stut_nm.Text + "','" + txt_father_nm.Text + "','" + txt_mother_nm.Text + "','" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "','" + gen + "','" + txt_mobile.Text + "','" + txt_address.Text + "','" + txt_parent_mobile.Text + "','" + txt_father_pro.Text + "','" + txt_mother_pro.Text + "','" + txt_fatherwork.Text + "','" + txt_motherwork.Text + "','" + dd_sem.Text + "','" + lblgrp.Text + "')";

            new SqlCommand(ins, con).ExecuteNonQuery();

            if (FU_Stud_Img.HasFile)
            {
                FU_Stud_Img.PostedFile.SaveAs(MapPath("~/images/") + uid + ".jpg");
            }

            Response.Redirect("~/Login/Login.aspx");
        }
        if (role == "faculty" || role == "admin")
        {
            string act = "update Login_Master set isActive='" + 1 + "',ups='" + txtcpass1.Text + "' where uid='" + uid + "'";
            dap = new SqlDataAdapter(act, con);
            dt = new DataTable();
            dap.Fill(dt);
            dap.Update(dt);

            string ins = "insert into Faculty_Master values('" + cid + "','" + txtname.Text + "','" + txtaddr.Text + "','" + txtmno.Text + "','" + txtemail.Text + "','" + uid + "')";
            dap = new SqlDataAdapter(ins, con);
            dt = new DataTable();
            dap.Fill(dt);
            dap.Update(dt);

            if (FU_Img.HasFile)
            {
                FU_Img.PostedFile.SaveAs(MapPath("~/images/") + uid + ".jpg");
            }
            Response.Redirect("~/Login/Login.aspx");
        }

    }
    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Lbl_dob.Text = Calendar1.SelectedDate.ToShortDateString();
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
    protected void btn_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= Session.Count - 1; i++)
        {
            Session.Abandon(); Session.Clear();
        }
        Response.Redirect("~/Login/Login.aspx");
    }
}