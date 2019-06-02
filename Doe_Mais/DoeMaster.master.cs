using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class DoeMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(Session["logado"]) != 1)
            {
                panLogado.Visible = false;
                panDeslogado.Visible = true;
                doadorLogado.Text = "";
                return;
            }
            else
            {
                panDeslogado.Visible = false;
                panLogado.Visible = true;
                doadorLogado.Text = "Olá " + Session["NomeDoador"] + " ;D ";
            }
        }
        catch (Exception)
        {
            //label nova
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("index.aspx");
    }
}
