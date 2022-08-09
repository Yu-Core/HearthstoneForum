using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Text;

namespace 游戏论坛
{
    public partial class Login : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            username.Attributes.Add("placeholder", "请输入用户名");
            password.Attributes.Add("placeholder", "请输入密码");


            //另一种添加默认文字的方法，不过效果不太好;

            //username.Attributes.Add("Value", "请输入用户名");
            //username.Attributes.Add("OnFocus", "if(this.value=='请输入用户名') {this.value=''}");
            //username.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入用户名'}");


            //password.Attributes.Add("Value", "请输入密码");
            //password.Attributes.Add("OnFocus", "if(this.value=='请输入密码'){this.value=''}");
            //password.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入密码'}");

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = HiddenField1.Value;
            string s2 = HiddenField2.Value;
            //验证是否通过滑块验证
            if ("成功".Equals(s))
            {
                //验证登录身份，默认是用户登录
                if ("User".Equals(s2))
                {
                    
                    string sql = "select uId,uUsername from tb_User where uUsername='" + this.username.Text.Replace("'", "") + "' and uPassword='" + this.password.Text.Replace("'", "") + "'";
                    DataSet ds = db.GetDataSet(sql);
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        Session["uId"] = ds.Tables[0].Rows[0][0].ToString();
                        Session["uUsername"] = ds.Tables[0].Rows[0][1].ToString();

                        string sql2 = "update tb_User set last_login = '" + DateTime.Now.ToString() + "'where uId = '" + Session["uId"] + "'";
                        db.Execsql(sql2);


                        if (Session["url"] == null)
                        {
                            Response.Redirect("~/Default.aspx");
                        }
                        else
                        {
                            Response.Redirect(Session["url"].ToString());
                        }

                    }
                    else
                    {
                        Label8.Text = "用户名或密码错误";

                    }
                }
                else if ("Admin".Equals(s2))
                {
                    string sql = "select aName,aPassword from tb_Admin where aName='" + this.username.Text + "' and aPassword='" + this.password.Text + "'";
                    if (db.GetDataSet(sql).Tables[0].Rows.Count > 0)
                    {
                        Session["aName"] = db.GetDataSet(sql).Tables[0].Rows[0][0].ToString();

                       // ClientScript.RegisterClientScriptBlock(this.GetType(),
                       //"this", "<script>alert('管理员登录成功');</script>");

                        Response.Redirect("~/Admin/Index.aspx");


                    }
                    else
                    {
                        Label8.Text = "用户名或密码错误";

                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }

            }
            else if ("失败".Equals(s))
            {
                Label8.Text = "请进行安全验证";
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }


    }
}