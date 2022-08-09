using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛.Admin.Area
{
    public partial class Add : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aName"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int NameMaxLength = 10;

            if (A_Name.Text == "" || A_Introduction.Text == "" || A_Name.Text.Length > NameMaxLength)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '添加失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location=location;}else{location=location;}}catch (e){alert(e);}});</script>");
            }
            else
            {
                string sql = "insert into tb_Area values('" + A_Name.Text + "','" + A_Introduction.Text + "', '" + DateTime.Now.ToString() + "')";
                bool flag = db.Execsql(sql);
                if (flag)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'success',text: '添加成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '添加失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location=location;}else{location=location;}}catch (e){alert(e);}});</script>");
                }
            }

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}