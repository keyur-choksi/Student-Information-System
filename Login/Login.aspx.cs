using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Login_Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter DA;
    DataTable dt;

    string role = null;
    string cid = null;
    string user = null;
    string uid = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        String cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);
        if (Session["role"] != null)
        {
            Session.Abandon();
        }
    }

    public static class MessageBox
    {
        public static void ShowMessage(string MessageText, Page MyPage)
        {
            MyPage.ClientScript.RegisterStartupScript(MyPage.GetType(),
                "MessageBox", "alert('" + MessageText.Replace("'", "\'") + "');", true);
        }
    }


    protected void cmd_login_Click(object sender, EventArgs e)
    {

        con.Open();
        string Storege_pro= "login";   //stored procedure Name

        cmd = new SqlCommand(Storege_pro, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UID",txt_Username.Text.ToString());   //for username 
        cmd.Parameters.AddWithValue("@UPS", txt_Pass.Text.ToString());  //for password


        int count = (Int32)cmd.ExecuteScalar();// for chek the result

        if (count == 1)  // comparing users from table 
        {
            txt_Pass.Text = "";
            count = 0;
            
            // start find role
            string getrole = "select role,cid,uid from Login_Master where uid='" + txt_Username.Text + "'";
            DA = new SqlDataAdapter(getrole, con);
            dt = new DataTable();
            DA.Fill(dt);
            DA.Update(dt);
            if (dt.Rows.Count > 0)
            {
                role = dt.Rows[0][0].ToString();
                cid = dt.Rows[0][1].ToString();
                uid = dt.Rows[0][2].ToString();
                Session["role"] = role;  //set the global session
                Session["cid"] = cid;   // set the global candidate id
                Session["uid"] = uid;  // set the global candidate id
                isActivated();        // check the profile activated or not

            }
            // end find role

            if (role == "student")
            {
                
                getinfo_stud();
                Response.Redirect("~/Student/index.aspx");
                con.Close();

            }
            else if (role == "faculty" || role == "admin")
            {
                getinfo_faculty();
            }

        }

        else
        {
            con.Close();

            string msg = "Invalid Username Or Password!";

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("window.onload=function() {");
            sb.Append("alert('");
            sb.Append(msg);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            txt_Pass.Text = "";
        }
    }
    public void getinfo_stud()
    {
        //string get = "select name from Student_Master where cid='" + cid + "'";
        string get = "select Full_Name from tbl_Students where ID='" + cid + "'";
        DA = new SqlDataAdapter(get, con);
        dt = new DataTable();
        DA.Fill(dt);
        DA.Update(dt);

        if (dt.Rows.Count > 0)
        {
            user = dt.Rows[0][0].ToString();
            Session["user"] = user;
        }
    }

    public void getinfo_faculty()
    {
        string get = "select name from Faculty_Master where cid='" + cid + "'";
        DA = new SqlDataAdapter(get, con);
        dt = new DataTable();
        DA.Fill(dt);
        DA.Update(dt);

        if (dt.Rows.Count > 0)
        {
            user = dt.Rows[0][0].ToString();
            Session["user"] = user;
            if (role == "admin")
            {
                Response.Redirect("~/Admin/AdminPortal.aspx");
            }
            Response.Redirect("~/Faculty/Studinfo_index.aspx");
        }
    }
    public void isActivated()
    {
        string chk = "select uid from Login_Master where uid='" + txt_Username.Text + "' and isActive IS NULL";
        DA = new SqlDataAdapter(chk, con);
        dt = new DataTable();
        DA.Fill(dt);
        DA.Update(dt);

        if (dt.Rows.Count > 0)
        {
            Response.Redirect("~/ProfileActivator/Activator.aspx");
        }

    }

}