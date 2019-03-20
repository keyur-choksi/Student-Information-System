using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Student_index : System.Web.UI.Page
{

    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;

    string uid;
    string cid;
    //==================== User Define Methods ====================
    public static class MessageBox
    {
        public static void ShowMessage(string MessageText, Page MyPage)
        {
            MyPage.ClientScript.RegisterStartupScript(MyPage.GetType(),
                "MessageBox", "alert('" + MessageText.Replace("'", "\'") + "');", true);
        }
    }

    void Show_Hide(bool Show_Hide)
    {
        //====== True
        txt_grp.Visible = lbl_year.Visible = lbl_month.Visible = Calendar1.Visible = dd_year.Visible = dd_month.Visible =
        txt_Stut_nm.Visible = txt_father_nm.Visible = txt_mother_nm.Visible = rb_female.Visible = rb_male.Visible = txt_mobile.Visible = Show_Hide;
        txt_address.Visible = txt_parent_mobile.Visible = txt_father_pro.Visible = txt_mother_pro.Visible = txt_sem.Visible = txt_motherwork.Visible = txt_fatherwork.Visible = Show_Hide;
        FU_Stud_Img.Visible = Show_Hide;

        //====== False
        lbl_grp.Visible =
        lbl_Stud_nm.Visible = Lbl_father_nm.Visible = Lbl_mother_nm.Visible = lbl_gen.Visible = lbl_fatherwork.Visible = !Show_Hide;
        lbl_mobile.Visible = lbl_address.Visible = lbl_parent_mobile.Visible = lbl_father_pro.Visible = lbl_mother_pro.Visible = Lbl_sem.Visible =
        lbl_motherwork.Visible = !Show_Hide;
    }

    public void getinfo()
    {
        string sel = "SELECT * FROM tbl_Students WHERE ID = '" + cid + "'";

        dap = new SqlDataAdapter(sel, con);
        dt = new DataTable();
        dap.Fill(dt);

        if (!IsPostBack)
        {
            if (dt.Rows.Count > 0)
            {
                lbl_Stud_nm.Text = txt_Stut_nm.Text = dt.Rows[0][1].ToString();
                Lbl_father_nm.Text = txt_father_nm.Text = dt.Rows[0][2].ToString();
                Lbl_mother_nm.Text = txt_mother_nm.Text = dt.Rows[0][3].ToString();
                Lbl_dob.Text = DateTime.Parse(dt.Rows[0][4].ToString()).ToString("dd-MM-yyyy");
                lbl_gen.Text = dt.Rows[0][5].ToString(); if (dt.Rows[0][5].ToString() == "Male") rb_male.Checked = true; else rb_female.Checked = true;
                lbl_mobile.Text = txt_mobile.Text = dt.Rows[0][6].ToString();
                lbl_address.Text = txt_address.Text = dt.Rows[0][7].ToString();
                lbl_parent_mobile.Text = txt_parent_mobile.Text = dt.Rows[0][8].ToString();
                lbl_father_pro.Text = txt_father_pro.Text = dt.Rows[0][9].ToString();
                lbl_fatherwork.Text = txt_fatherwork.Text = dt.Rows[0][11].ToString();
                lbl_mother_pro.Text = txt_mother_pro.Text = dt.Rows[0][10].ToString();
                lbl_motherwork.Text = txt_motherwork.Text = dt.Rows[0][12].ToString();
                Lbl_sem.Text = txt_sem.Text = dt.Rows[0][13].ToString();
                lbl_grp.Text = txt_grp.Text = dt.Rows[0][14].ToString();

                Img_stud.ImageUrl = "../images/" + uid + ".jpg";
                Img_stud.AlternateText = uid + "'s Image";
            }
        }
    }

    void Update_Stud()
    {
        if (txt_Stut_nm.Text != "" && txt_sem.Text != "" && txt_parent_mobile.Text != "" && txt_motherwork.Text != "" && txt_mother_pro.Text != "" && txt_mother_nm.Text != "" &&
                   txt_mobile.Text != "" && txt_grp.Text != "" && txt_fatherwork.Text != "" && txt_father_pro.Text != "" && txt_father_nm.Text != "" && txt_address.Text != "" && Lbl_dob.Text != "" && !rb_female.Checked || !rb_male.Checked)
        {
            string gen;
            if (rb_male.Checked) gen = "Male"; else gen = "Female";

            string upd = "update tbl_Students set Full_Name = '" + txt_Stut_nm.Text + "',FullName_Father = '" + txt_father_nm.Text + "',FullName_Mother = '" + txt_mother_nm.Text + "',DateOfBirth='" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "'";
            upd += ",Gender='" + gen + "',MobileNo='" + txt_mobile.Text + "',Address='" + txt_address.Text + "',Parent_Mobile='" + txt_parent_mobile.Text + "',Father_Profession='" + txt_father_pro.Text + "', Mother_Profession='" + txt_mother_pro.Text + "'";
            upd += ",FatherWork_Place='" + txt_fatherwork.Text + "',MotherWork_Place='" + txt_motherwork.Text + "',Current_Sem='" + txt_sem.Text + "',Grp='" + txt_grp.Text + "' where ID='" + cid + "'";



            new SqlCommand(upd, con).ExecuteNonQuery();

            if (FU_Stud_Img.HasFile)
            {
                FU_Stud_Img.PostedFile.SaveAs(Server.MapPath("~/images/") + uid + ".jpg");
            }
            Response.Redirect("~/Student/index.aspx");
        }

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

    //==================== End of User Define Methods ====================

    protected void Page_Load(object sender, EventArgs e)
    {
        string se = Session["role"] as string;

        if (string.IsNullOrEmpty(se) || Session["role"].ToString() != "student")
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        string cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);
        con.Open();

        uid = Session["uid"].ToString();
        cid = Session["cid"].ToString();
        
        getinfo();

        if (!IsPostBack)
        {
            Load_Cal();
            Loadmonths();
        }
    }

    protected void Btn_Edit_Click(object sender, EventArgs e)
    {
        if (Btn_Edit.Text == "Update Details")
        {
            Btn_Edit.Text = "Save Detalis";
            Show_Hide(true);
            txt_Stut_nm.Focus();
        }
        else
        {
            Update_Stud();
            Btn_Edit.Text = "Update Details";
            Show_Hide(false);
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
        Lbl_dob.Text = Calendar1.SelectedDate.ToShortDateString();
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