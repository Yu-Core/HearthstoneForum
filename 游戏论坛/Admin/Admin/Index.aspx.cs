using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛.Admin.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["aName"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
                if (!IsPostBack)
                {
                    DataSet ds_1 = db.GetDataSet("select aId,aName,aUsername,aData from tb_Admin  order by aId desc");
                    DataList1.DataSource = ds_1.Tables[0].DefaultView;
                    DataList1.DataBind();
                }
                
                
            }

        }
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            string sql = "delete from tb_Admin where aId = '" + id + "'";
            bool flog = false;
            if(id != 1)
            {
                flog = db.Execsql(sql);
            }
            
            if (flog)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({icon:'success',title: '删除成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = 'Index.aspx';}else{location ='Index.aspx';}}catch (e){alert(e);}});</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({icon:'error',title: '删除失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = 'Index.aspx';}else{location = 'Index.aspx';}}catch (e){alert(e);}});</script>");
            }
        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("Edit.aspx?Id=" + id + "");
        }
        

        protected void AddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add.aspx");
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            if (Rolename.Text != "")
            {
                string sql = "select aId,aName,aUsername,aData from tb_Admin where CHARINDEX('" + Rolename.Text + "',aName) > 0 order by aId desc";
                DataSet ds = db.GetDataSet(sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                       "this", "<script>Swal.fire({icon: 'error',title: '未搜索到有关结果~~',showConfirmButton: false,timer: 3000});</script>");

                }

            }

        }

        
    }
}