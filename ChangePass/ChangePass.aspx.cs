using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ChangePass_ChangePass : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter dap;
    DataTable dt;

    string uid;
    string cid;

    protected void Page_Load(object sender, EventArgs e)
    {
        string se = Session["role"] as string;

        if (string.IsNullOrEmpty(se) || Session["role"].ToString() != "admin")
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        string cstr = ConfigurationManager.ConnectionStrings["conString"].ToString();
        con = new SqlConnection(cstr);

        uid = Session["uid"].ToString();
        cid = Session["cid"].ToString();
    }

    protected void cmd_update_Click(object sender, EventArgs e)
    {
        con.Open();

        string chk = "select ups from Login_Master where role='admin' and ups=@pas";
        cmd = new SqlCommand(chk, con);
        cmd.Parameters.AddWithValue("@pas", txtadminpas.Text);

        dap = new SqlDataAdapter(cmd);
        dt = new DataTable();
        dap.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            string upd = "update Login_Master set ups='" + txtnewpas.Text + "' where uid='" + dd_id.Text + "'";
            dap = new SqlDataAdapter(upd, con);
            dt = new DataTable();
            dap.Fill(dt);
            dap.Update(dt);


            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("window.onload=function() {");
            sb.Append("alert('");
            sb.Append("Password Updated:");
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        else
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("window.onload=function() {");
            sb.Append("alert('");
            sb.Append("Unauthorized User");
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        con.Close();

    }
}