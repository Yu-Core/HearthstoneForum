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
    public partial class NewPlayerGuide : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            //根据数据库动态添加div
            DataSet ds = db.GetDataSet("select top 10 * from tb_Newstu");
            Label lable1;
            Label lable2;
            HtmlGenericControl br1,br2,br3;
            HtmlGenericControl div,div2;
            //div2 = new HtmlGenericControl("div");
            //div2.Attributes.Add("class", "new2");
            //sdiv.Controls.Add(div2);

            //生成相应数量的div
            for (int i = 0;i < ds.Tables[0].Rows.Count; i++)
            {
                br1 = new HtmlGenericControl("br");//换行
                br2 = new HtmlGenericControl("br");
                br3 = new HtmlGenericControl("br");
                div = new HtmlGenericControl("div");
                div2 = new HtmlGenericControl("div");

                lable1 = new Label();//Lable控件
                lable2 = new Label();
                lable1.ID = "Lable" + (2 * i - 1);
                lable2.ID = "Lable" + (2 * i);
                lable1.Text = ds.Tables[0].Rows[i][1].ToString();
                lable2.Text = ds.Tables[0].Rows[i][2].ToString();
                lable1.Visible = true;
                lable2.Visible = true;
                lable1.Font.Size = 35;
                lable2.Font.Size = 18;
                lable1.Width = 900;
                lable2.Width = 900;
                div.Controls.Add(lable1);
                div.Controls.Add(br1);
                div.Controls.Add(br2);
                div.Controls.Add(br3);
                div.Controls.Add(lable2);

                div.Attributes.Add("class", "new");
                div.Style.Add("height","560px");
                //为每一个div配置不同的背景图
                div.Style.Add("background", "url(/images/NewPlayerGuide/" + ds.Tables[0].Rows[i][3].ToString()+ ") no-repeat");
                div.Style.Add("background-size", "cover");
                div.Style.Add("padding-top", "300px");

                div2.Attributes.Add("class", "new2");
                sdiv.Controls.Add(div2);
                sdiv.Controls.Add(div);
                
            }
            ((HtmlGenericControl)Master.FindControl("bottom")).Style.Add("height", "473px");
            ((HtmlGenericControl)Master.FindControl("bottom")).Style.Add("background-position", "center bottom");
        }
    }
}