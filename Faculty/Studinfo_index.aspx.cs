using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faculty_index : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        String cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);
        con.Open();
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        tbl_stud.Visible = true;

        string getstud = "select cid from Login_Master where uid='" + dd_list_stud.Text + "'";

        dap = new SqlDataAdapter(getstud, con);
        dt = new DataTable();
        dap.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            string getinfo = "select Full_Name,Grp,Current_Sem,DateOfBirth,Gender,MobileNo from tbl_Students where ID='" + dt.Rows[0][0].ToString() + "'";
            dap = new SqlDataAdapter(getinfo, con);
            dt = new DataTable();
            dap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                lbl_nm.Text = dt.Rows[0][0].ToString();
                lbl_grp.Text = dt.Rows[0][1].ToString();
                lbl_Sem.Text = dt.Rows[0][2].ToString();
                lbl_db.Text = DateTime.Parse(dt.Rows[0][3].ToString()).ToShortDateString();
                lbl_gen.Text = dt.Rows[0][4].ToString();
                lbl_mobile.Text = dt.Rows[0][5].ToString();
                img_stud.ImageUrl = "../images/" + dd_list_stud.Text + ".jpg";
            }
        }
    }
}