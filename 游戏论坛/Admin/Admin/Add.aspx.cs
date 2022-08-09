using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛.Admin.Admin
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

            if (!IsPostBack)
            {
                


            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            if (!IsUserName(username.Text)||!IsPassWord(password.Text)||!IsName(uname.Text))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '请勿注入非法数据',showConfirmButton: false,timer: 2000});</script>");
                return;
            }
            string str = this.username.Text;
            if (str.Replace("or", "").Length < str.Length || str.Replace("'", "").Length < str.Length || str.Replace("-", "").Length < str.Length)
            {
                Response.Write("<script>alert('您输入的用户名包含非法字符。');location=location</script>");
                Response.AddHeader("refresh", "0");
            }
            else
            {
                string ss = "select * from tb_Admin where aName ='" + this.username.Text + "'";
                DataSet ds_2 = db.GetDataSet(ss);
                if (ds_2.Tables[0].Rows.Count > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '用户名已存在',showConfirmButton: false,timer: 2000});</script>");


                    this.username.Text = null;
                }
                else
                {
                    
                    string sql = "insert into tb_Admin(aName,aPassword,aUsername,aData) values('" + username.Text + "','" + password.Text + "','"  + uname.Text + "','" + DateTime.Now + "')";
                    bool flag = db.Execsql(sql);
                    if (flag)
                    {


                        ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({icon:'success',text: '添加成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");

                    }
                    else
                    {
                        Response.Write("<script>alert('对不起，数据正在维护中。~！');Default.aspx'</script>");
                    }
                }
            }

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }


        //判断是否符合用户名规范
        public static bool IsUserName(string str)
        {
            return Regex.IsMatch(str, @"^[\u4E00-\u9FA5A-Za-z0-9_]+$");
        }
        //判断是否符合密码规范
        public static bool IsPassWord(string str)
        {
            return Regex.IsMatch(str, @"^[A-Za-z0-9]{5,17}$");
        }
        
        //判断是否符合姓名规范
        public static bool IsName(string str)
        {
            return Regex.IsMatch(str, @"^[\u4e00-\u9fa5]{2,}$");
        }
        
    }
}