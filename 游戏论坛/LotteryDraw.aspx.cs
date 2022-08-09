using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class LotteryDraw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uId"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}