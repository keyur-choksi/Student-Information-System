using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Faculty_Master_Page : System.Web.UI.MasterPage
{
    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;

    string uid, cid;

    protected void Page_Load(object sender, EventArgs e)
    {
        string se = Session["role"] as string;

        if (string.IsNullOrEmpty(se) || Session["role"].ToString() != "faculty")
        {
            Response.Redirect("~/Login/Login.aspx");
        }

        lbl_nm.Text = "Welcome " + Session["user"].ToString();

        uid = Session["uid"].ToString();
        cid = Session["cid"].ToString();

    }
    protected void btn_info_Click(object sender, EventArgs e)
    {
        if (about.Visible == true) about.Visible = false; else about.Visible = true;
        string inf = "Select name,addr,mob,email,photoid from Faculty_Master where cid=" + Session["cid"].ToString();
        dap = new SqlDataAdapter(inf, new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString()));
        dt = new DataTable();
        dap.Fill(dt);

        nm.Text = dt.Rows[0][0].ToString();
        city.Text = dt.Rows[0][1].ToString();
        contect.Text = dt.Rows[0][2].ToString();
        email.Text = dt.Rows[0][3].ToString();

        Image1.ImageUrl = "../images/" + dt.Rows[0][4].ToString() + ".jpg";
        Image1.AlternateText = "No Image Found";
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
