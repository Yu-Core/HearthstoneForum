using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛.Admin.User
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
                    DataSet ds_1 = db.GetDataSet("select uId,uUsername,uName,last_login from tb_User  order by uId desc");
                    DataList1.DataSource = ds_1.Tables[0].DefaultView;
                    DataList1.DataBind();
                }
                
                
            }

        }
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            string sql = "delete from tb_User where uId = '" + id + "'";
            bool flog = db.Execsql(sql);
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
        protected void DataList1_QuietCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            DropDownList ddl = e.Item.FindControl("DropDownList1") as DropDownList;

            string sql = "insert into tb_Quiet values('" + id + "'," + ddl.SelectedValue + ",'" + DateTime.Now.ToString() + "',1)";
            bool flog =  db.Execsql(sql);

            if (flog)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                       "this", "<script>Swal.fire({icon: 'success',title: '提示',text: '已成功禁言该用户" + ddl.SelectedValue + "天',showConfirmButton: false,timer: 2000});</script>");

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({icon:'error',title: '禁言失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = 'Index.aspx';}else{location = 'Index.aspx';}}catch (e){alert(e);}});</script>");

            }
            ddl.SelectedValue = ddl.Items[0].Value;

        }

        protected void AddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add.aspx");
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            if (Rolename.Text != "")
            {
                string sql = "select uId,uUsername,uName,last_login from tb_User where CHARINDEX('" + Rolename.Text + "',uUsername) > 0 order by uId desc";
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

        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            string sql = "update tb_Quiet set state = 0 where Id = (select top 1 Id from tb_Quiet where uId = '" + id + "' order by Datatime desc)";
            bool flog = db.Execsql(sql);
            if (flog)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({icon:'success',title: '解除禁言成功',showConfirmButton: false,timer: 2000});</script>");

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({icon:'error',title: '解除禁言失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = 'Index.aspx';}else{location = 'Index.aspx';}}catch (e){alert(e);}});</script>");

            }
        }
    }
}