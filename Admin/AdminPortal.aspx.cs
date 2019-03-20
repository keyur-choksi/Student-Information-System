using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class Admin_AdminPortal : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter dap;
    DataTable dt;
    SqlCommand cmd;

    int cid;

    //=================== User Define Methods ===================

    public static class MessageBox
    {
        public static void ShowMessage(string MessageText, Page MyPage)
        {
            ScriptManager.RegisterClientScriptBlock(MyPage, typeof(Page), "MSG Box", "alert('" + MessageText.Replace("'", "\'") + "');", true);
        }
    }

    public void getlast_id_cid()
    {
        string sel_cid = "select cid from Login_master";
        dap = new SqlDataAdapter(sel_cid, con);
        dt = new DataTable();
        dap.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            cid = dt.Rows.Count;
        }
        else
            cid = 0;
    }

    public void Bind_Grid()
    {
        dap = new SqlDataAdapter("SELECT cid,uid,ups,role,grp,isActive FROM Login_Master order by cid", con);
        dt = new DataTable();
        dap.Fill(dt);
            
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    //=================== End Of User Define Methods ===================

    protected void Page_Load(object sender, EventArgs e)
    {
        string se = Session["role"] as string;

        if (string.IsNullOrEmpty(se) || Session["role"].ToString() != "admin")
        {
            Response.Redirect("~/Login/Login.aspx");
        }
       
        String cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);
        con.Open();
        Bind_Grid();
        lbl_admin.Text = " - " + Session["uid"].ToString();
    }
    protected void btn_Singleuser(object sender, EventArgs e)
    {

        string uid = txt_id.Text;
        string ups = txt_stemppass.Text;
        string role = dd_role.Text;
        string grp = Grp.Text;

        // check is uid exist or not

        string chk = "select uid from Login_Master where uid='" + uid + "'";
        dap = new SqlDataAdapter(chk, con);
        dt = new DataTable();
        dap.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            MessageBox.ShowMessage("ID Already Exists !", this.Page);
            txt_stemppass.Text = "";
        }
        else
        {
            string query = "INSERT INTO [dbo].[Login_Master]([cid],[uid],[ups],[role],[grp],[isActive]) ";
            query += "SELECT MAX(cid)+1,uid='" + uid + "',ups='" + ups + "',role='" + role + "',grp='" + grp + "',isActive=null from Login_Master";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            lbl_user.Text = "User ("+uid+") Created Successfully";
            txt_id.Text = "";
            txt_stemppass.Text = "";
        }
        Bind_Grid();
    }

    protected void btn_multiuser_Click(object sender, EventArgs e)
    {
        try
        {
            String query = "MultipleEntry";
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;

            getlast_id_cid();

            int start = int.Parse(txt_startid.Text);
            int end = int.Parse(txt_Endid.Text);
            string password = txt_temppass.Text;
            string prefix = txt_prefix.Text;
            string grp = dd_grp.Text;

            cmd.Parameters.AddWithValue("@CID", cid);
            cmd.Parameters.AddWithValue("@PREFIX", prefix);
            cmd.Parameters.AddWithValue("@START", start);
            cmd.Parameters.AddWithValue("@END", end);
            cmd.Parameters.AddWithValue("@UPS", password);
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@GRP", grp);

            cmd.ExecuteNonQuery();
            lbl_multi.Text = (int.Parse(txt_Endid.Text) - int.Parse(txt_startid.Text) + 1) + " User Created";
            txt_startid.Text = txt_prefix.Text = txt_Endid.Text = txt_temppass.Text = "";
        }
        catch (Exception ee)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("window.onload=function() {");
            sb.Append("alert('");
            sb.Append(ee.ToString());
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        Bind_Grid();
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= Session.Count - 1; i++)
        {
            Session.Abandon(); Session.Clear();
        }
        Response.Redirect("~/Login/Login.aspx");
    }
    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string qry;
        if (GridView1.SelectedRow.Cells[3].Text == "student")
        {
            qry = "DELETE FROM tbl_Students WHERE ID=" + GridView1.SelectedRow.Cells[0].Text + "";
            cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
        }
        else if (GridView1.SelectedRow.Cells[3].Text == "faculty" || GridView1.SelectedRow.Cells[3].Text == "admin")
        {
            qry = "DELETE FROM Faculty_Master WHERE cid=" + GridView1.SelectedRow.Cells[0].Text + "";
            cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
        }

        FileInfo file = new FileInfo(Server.MapPath("~/images/" + GridView1.SelectedRow.Cells[1].Text + ".jpg"));
        if (file.Exists)
        {
            file.Delete();
        }

        qry = "DELETE FROM Login_Master WHERE cid=" + GridView1.SelectedRow.Cells[0].Text + "";
        cmd = new SqlCommand(qry, con);
        cmd.ExecuteNonQuery();
        Bind_Grid();
    }
    protected void btn_info_Click(object sender, EventArgs e)
    {
        if (about.Visible == true) about.Visible = false; else about.Visible = true;
        string inf = "Select name,addr,mob,email,photoid from Faculty_Master where cid="+Session["cid"].ToString();
        dap = new SqlDataAdapter(inf, con);
        dt = new DataTable();
        dap.Fill(dt);

        nm.Text = dt.Rows[0][0].ToString();
        city.Text = dt.Rows[0][1].ToString();
        contect.Text = dt.Rows[0][2].ToString();
        email.Text = dt.Rows[0][3].ToString();

        Image1.ImageUrl = "../images/" + dt.Rows[0][4].ToString() + ".jpg";
        Image1.AlternateText = "No Image Found";
    }
}