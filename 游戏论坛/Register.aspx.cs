using System;

namespace 游戏论坛
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "this", "<script type = 'text/javascript'>window.onload = function(){document.querySelector('#fp').scrollIntoView(true);}</script>");
            }


        }

        

       

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                Response.Redirect("Register_info.aspx");
            }
            
        }
    }
}