using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class sobre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Convert.ToInt32(Session["logado"]) != 0)
        {
            linkBanner.HRef = "doacao.aspx";
            linkBanner2.HRef = "receptora.aspx";
        }
    }
    }