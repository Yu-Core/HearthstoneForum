using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class Notice : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id"] != null)
                {
                    string sql = "select * from tb_Notice where Id = '" + Request["id"] + "'";
                    DataSet ds = db.GetDataSet(sql);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Label1.Text = ds.Tables[0].Rows[0][1].ToString();
                        Label2.Text = ds.Tables[0].Rows[0][2].ToString().Replace("\r\n", "<br>");
                    }
                    else
                    {
                        ap.Visible = false;
                        ((HtmlGenericControl)Messagetext.FindControl("messagetext")).Style.Add("display", "block");
                        box.Style.Add("height", "200px");

                    }

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        
    }
}