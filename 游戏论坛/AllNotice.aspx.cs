using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class AllNotice : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds_1 = db.GetDataSet("select Id,Title,Datatime from tb_Notice  order by Datatime desc");
                DataList1.DataSource = ds_1.Tables[0];
                DataList1.DataBind();
            }
               
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Notice.aspx?Id=" + id + "");
        }
    }
}