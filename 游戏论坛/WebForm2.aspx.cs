using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

namespace 游戏论坛
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private int Orders_limit = 16;

        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (!IsPostBack)
            {
                Refresh();
            }
        }

        protected void AspNetPagerNotice_PageChanged(object sender, EventArgs e)
        {
            
                Orders_limit = AspNetPagerNotice.PageSize;//单页面订单显示数目
                int start = AspNetPagerNotice.StartRecordIndex - 1;
                string sql = "select top " + Orders_limit.ToString() + " * From tb_Motif where Id Not in ( select top "+ start.ToString() + " Id From tb_Motif Order By Datatime desc) Order By Datatime desc";

                this.Orders_list.DataSource = db.GetDataSet(sql);
                this.Orders_list.DataBind();
            
        }
        public void Refresh()
        {
            
                /*统计订单数量*/
                string sql = "select count(*) from tb_Motif";
                DataSet ds1 = db.GetDataSet(sql);
                AspNetPagerNotice.RecordCount = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());

                /*取前n条数据*/
                string sql2 = "select top " + Orders_limit.ToString() + " * from tb_Motif order by Datatime desc";
                this.Orders_list.DataSource = db.GetDataSet(sql2);
                this.Orders_list.DataBind();//DataList绑定数据源
            
        }
        
        

    }
}