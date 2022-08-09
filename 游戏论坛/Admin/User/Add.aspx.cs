using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛.Admin.User
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
                DataSet ds = db.GetDataSet("select Imagefile from tb_Head");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
                Image1.ImageUrl = "~/HeadImage/" + DropDownList2.SelectedValue;


            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            if (!IsUserName(username.Text)||!IsPassWord(password.Text)||!IsEmail(email.Text)||!IsName(uname.Text)||!IsPhone(phone.Text))
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
                string ss = "select * from tb_User where uUsername ='" + this.username.Text + "'";
                DataSet ds_2 = db.GetDataSet(ss);
                if (ds_2.Tables[0].Rows.Count > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '用户名已存在',showConfirmButton: false,timer: 2000});</script>");


                    this.username.Text = null;
                }
                else
                {
                    string str1 = "select Id from tb_Head where Imagefile='" + DropDownList2.SelectedValue + "'";
                    DataSet ds = db.GetDataSet(str1);
                    int id = int.Parse(ds.Tables[0].Rows[0][0].ToString());
                    string sql = "insert into tb_User(uUsername,uPassword,uSex,uEmail,uHeadId,uName,uPhone,last_login) values('" + username.Text + "','" + password.Text + "','" + DropDownList1.SelectedValue + "','" + email.Text + "','" + id + "','" + uname.Text + "','" + phone.Text + "','" + DateTime.Now + "')";
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

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = "~/HeadImage/" + DropDownList2.SelectedValue;
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
        //判断是否符合邮箱规范
        public static bool IsEmail(string str)
        {
            return Regex.IsMatch(str, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        }
        //判断是否符合姓名规范
        public static bool IsName(string str)
        {
            return Regex.IsMatch(str, @"^[\u4e00-\u9fa5]{2,}$");
        }
        //判断是否符合手机号规范
        public static bool IsPhone(string str)
        {
            return Regex.IsMatch(str, @"^1[0-9]{10}$");
        }
    }
}