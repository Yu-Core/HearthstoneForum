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
    public partial class Default : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = db.GetDataSet("select * from tb_Carousel");
            if (!IsPostBack)
            {
                HtmlGenericControl div = new HtmlGenericControl("div");
                HtmlGenericControl li;
                HtmlGenericControl img;
                Label label;
                div.Attributes.Add("class", "imgBox");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    img = new HtmlGenericControl("img");
                    
                    img.Attributes.Add("class", "img-slide img");
                    
                    img.Attributes.Add("width", "545px");
                    img.Attributes.Add("height", "273px");
                    img.Style.Add("border-radius", "5px 0 0 5px");
                    img.Attributes.Add("src", "/images/Carouselmap/"+ ds.Tables[0].Rows[i][2].ToString());
                    div.Controls.Add(img);

                    label = new Label();
                    label.Attributes.Add("class", "span-slide sp");
                    label.Text = ds.Tables[0].Rows[i][1].ToString();
                    label.Style["font-size"] = "30px";
                    label.Style["color"] = "white";
                    Cm_title.Controls.Add(label);

                    li = new HtmlGenericControl("li");
                    if(i == 0)
                    {
                        li.Attributes.Add("class", "on");
                    }
                    list.Controls.Add(li);
                }
                Carouselmap.Controls.Add(div);
            }

            DataSet ds_1 = db.GetDataSet("select top 4 Id,Title,Content,CONVERT(varchar,Datatime,111) as 'Datatime' from tb_Notice  order by Datatime desc");
            DataList1.DataSource = ds_1.Tables[0].DefaultView;
            DataList1.DataBind();
            //公历
            Label2.Text = System.DateTime.Now.ToString("yyyy-MM-dd dddd");
            //农历
            CountryDate cd = new CountryDate();
            Label3.Text = cd.GetChineseDate(DateTime.Now);

            DataSet ds_2 = db.GetDataSet("SELECT t.* FROM(    SELECT top 30*, Row_Number() OVER(order by Datatime) AS RowNumber  FROM tb_Area) t WHERE t.RowNumber % 3 = 1");
            DataList2.DataSource = ds_2.Tables[0].DefaultView;
            DataList2.DataBind();


            DataSet ds_3 = db.GetDataSet("SELECT t.* FROM(    SELECT top 30*, Row_Number() OVER(order by Datatime) AS RowNumber  FROM tb_Area) t WHERE t.RowNumber % 3 = 2");
            DataList3.DataSource = ds_3.Tables[0].DefaultView;
            DataList3.DataBind();

            DataSet ds_4 = db.GetDataSet("SELECT t.* FROM(    SELECT top 30*, Row_Number() OVER(order by Datatime) AS RowNumber  FROM tb_Area) t WHERE t.RowNumber % 3 = 0");
            DataList4.DataSource = ds_4.Tables[0].DefaultView;
            DataList4.DataBind();

            //使首页右下角与左下角高度一致，并查询相应数量的数据 左下角最右侧分区不足三个时，按三个算
            int right_num = 3;
            if(ds_4.Tables[0].Rows.Count > 3)
            {
                right_num = ds_4.Tables[0].Rows.Count;
            }
            string h = (ds_2.Tables[0].Rows.Count * 195).ToString() + "px";
            string h2 = (right_num * 190 - 5).ToString() + "px";
            Popcommendation.Style.Add("height", h2);
            Forum_Section.Style.Add("height", h);
            string r = ((right_num * 190  - 85)/41 ).ToString();
            string sql_h = "select top " + r + "m.Id,m.mName,ISNULL(l.lNum,0) + ISNULL(c1.c1Num,0) + ISNULL(c2.c2Num,0) + ISNULL(m.Views,0) as Popularity from tb_Motif m left join likes_num l on m.Id = l.mId left join comment_num c1 on m.Id = c1.mId left join collection_num c2 on m.Id = c2.mId order by Popularity desc";

            DataSet ds_5 = db.GetDataSet(sql_h);
            DataList5.DataSource = ds_5.Tables[0].DefaultView;
            DataList5.DataBind();

            string sql_h2 = "select top "+ r +"* from tb_motif  order by Datatime desc";
            DataSet ds_6 = db.GetDataSet(sql_h2);
            DataList6.DataSource = ds_6.Tables[0].DefaultView;
            DataList6.DataBind();
            
            if (Session["uId"] != null)
            {
                
                string sql2 = "select * from tb_Sign where uId = '" + Session["uId"] + "'";
                if (db.GetDataSet(sql2).Tables[0].Rows.Count > 0)
                {
                    string data = DateTime.Now.ToShortDateString() + " 0:00:00";
                    if (db.GetDataSet(sql2).Tables[0].Rows[0][3].ToString().Equals(data))
                    {
                        Sign.InnerText = "已签到";
                        Button3.Enabled = false;
                        Button3.CssClass = "";
                    }
                    
                    SignDays.InnerText = "累计签到" + db.GetDataSet(sql2).Tables[0].Rows[0][2].ToString() + "天";
                }

            }
           
            string sql3 = "select * from tb_Sign where last_sign = '" + DateTime.Now.ToShortDateString() + "'";
            if (db.GetDataSet(sql3).Tables[0].Rows.Count > 0)
            {
                SignNumber.InnerText = "今日已签到" + db.GetDataSet(sql3).Tables[0].Rows.Count + "人";
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Notice.aspx?Id=" + id + "");
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            int id = Convert.ToInt32(DataList2.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module.aspx?Id=" + id + "");
        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {

            int id = Convert.ToInt32(DataList3.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module.aspx?Id=" + id + "");
        }
        protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
        {

            int id = Convert.ToInt32(DataList4.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module.aspx?Id=" + id + "");
        }

        protected void DataList5_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            int id = Convert.ToInt32(DataList5.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        }
        
        protected void DataList6_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            int id = Convert.ToInt32(DataList6.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Style.Add("color", "black");
            Button2.Style.Add("color", "#777777");
            recommend.Visible = true;
            newest.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button2.Style.Add("color", "black");
            Button1.Style.Add("color", "#777777");
            recommend.Visible = false;
            newest.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["uId"] == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',text: '请先登录',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){ocation = 'Login.aspx';}else{}}catch (e){alert(e);}});</script>");
            }
            else
            {
                string sql = "select * from tb_Sign where uId = '" + Session["uId"] + "'";
                if (db.GetDataSet(sql).Tables[0].Rows.Count > 0)
                {
                    string sql2 = "update tb_Sign set days = days + 1 , last_sign = '" + DateTime.Now.ToShortDateString() + "'where uId = '" + Session["uId"] + "'";
                    db.Execsql(sql2);
                    
                }
                else
                {
                    string sql4 = "insert into tb_Sign values('"+ Session["uId"] + "',1,'" + DateTime.Now.ToShortDateString() + "')";
                    db.Execsql(sql4);
                    
                }
                Sign.InnerText = "已签到";
                Button3.Enabled = false;
                SignDays.InnerText = "累计签到" + db.GetDataSet(sql).Tables[0].Rows[0][2].ToString() + "天";
                string sql3 = "select * from tb_Sign where last_sign = '" + DateTime.Now.ToShortDateString() + "'";
                if (db.GetDataSet(sql3).Tables[0].Rows.Count > 0)
                {
                    SignNumber.InnerText = "今日已签到" + db.GetDataSet(sql3).Tables[0].Rows.Count + "人";
                }
                Button3.CssClass = "";
            }
        }

        

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("HearthStoneHistory.aspx");
        }

        
    }

}