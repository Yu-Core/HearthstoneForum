using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        readonly DBconnection db = new DBconnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["uId"] == null)
            {
                Session["url"] = Request.Url;

            }
            else
            {
                Session["url"] = null;

                HtmlLink CssControl = new HtmlLink
                {
                    Href = "/Css/StyleSheet3.css"
                };
                CssControl.Attributes.Add("rel", "stylesheet");
                CssControl.Attributes.Add("type", "text/css");
                Page.Header.Controls.Add(CssControl);

                string sql = "select a.uId, b.Imagefile from tb_User a, tb_Head b where a.uHeadId = b.Id and a.uId = " + (string)Session["uId"];
                Login.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Register.Visible = false;
                string headimg = db.GetDataSet(sql).Tables[0].Rows[0][1].ToString();
                Image3.ImageUrl = "/HeadImage/" + headimg;
                Image3.Style.Add("border-radius", "50%");
                Image3.Style.Add("margin-right", "45px");
            }
           
        }

        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewPlayerGuide.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("RankingList.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Download.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (Session["uId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>if(confirm('您已登录，确定要重新登录吗？')){location='Login.aspx'}else{location=location;}</script>");

            }
        }


        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.Remove("uId");
            Session.Remove("uUsername");
            this.Response.Redirect("Default.aspx");
        }

        protected void PersonalCenter_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonalCenter.aspx");
        }

        protected void LotteryDraw_Click(object sender, EventArgs e)
        {
            Response.Redirect("LotteryDraw.aspx");
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllNotice.aspx");
        }

        
    }
}