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
    public partial class Download : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = db.GetDataSet("select * from tb_Download");
                HtmlTableRow tr;
                HtmlTableCell td1,td2;
                HyperLink HL;
                Label lb;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    tr = new HtmlTableRow();
                    td1 = new HtmlTableCell();
                    td2 = new HtmlTableCell();
                    lb = new Label();
                    HL = new HyperLink();

                    lb.Text = ds.Tables[0].Rows[i][1].ToString();
                    td1.Controls.Add(lb);

                    HL.NavigateUrl = "/Download/" + ds.Tables[0].Rows[i][2];
                    HL.ImageUrl = "/Download/" + ds.Tables[0].Rows[i][3];
                    HL.Attributes.Add("onclick", "sound()");
                    td2.Controls.Add(HL);

                    tr.Controls.Add(td1);
                    tr.Controls.Add(td2);

                    download.Controls.Add(tr);
                }
               
            }
            
        }

        
    }
}