using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛.Admin.Notice
{
    public partial class Edit : System.Web.UI.Page
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
                
                if (Request["id"] != null)
                {
                    string sql = "select Id, Title, Content from tb_Notice where Id = '" + Request["id"] + "'";
                    DataSet ds = db.GetDataSet(sql);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        N_Id.Text = ds.Tables[0].Rows[0][0].ToString();
                        N_Title.Text = ds.Tables[0].Rows[0][1].ToString();
                        N_Content.Text = ds.Tables[0].Rows[0][2].ToString();
                    }
                    else
                    {
                        Response.Redirect("Index.aspx");
                    }

                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
                
            }



        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (N_Title.Text == "" || N_Content.Text == "" || N_Title.Text.Length > 50)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '修改失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");
            }
            else
            {
                string sql = "update tb_Notice set Title = '" + N_Title.Text + "',Content = '" + N_Content.Text + "'where Id = '" + Request["id"] + "'";
                bool flag = db.Execsql(sql);
                if (flag)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'success',text: '修改成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '修改失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");
                }
            }
            
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}