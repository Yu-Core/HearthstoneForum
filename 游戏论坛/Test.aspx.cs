using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ToolGood.Words;

namespace 游戏论坛
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select Id,Title,Datatime from tb_Notice order by Datatime desc";
                DataList1.DataSource = db.GetDataSet(sql);
                DataList1.DataBind();
            }
           


        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32( (e.Item.ItemIndex.ToString()));
        }
    }
}