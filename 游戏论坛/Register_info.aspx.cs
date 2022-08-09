using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class Register_info : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                DataSet ds = db.GetDataSet("select Imagefile from tb_Head");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
                Image1.ImageUrl = "~/HeadImage/" + DropDownList2.SelectedValue;
                //this.Label1.Visible = false;
                
                username.Attributes.Add("placeholder", "用户名");
                password.Attributes.Add("placeholder", "密码");
                email.Attributes.Add("placeholder", "邮箱");
                uname.Attributes.Add("placeholder", "姓名");
                phone.Attributes.Add("placeholder", "手机号");

            }
            
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            string str = this.username.Text;
            if (str.Replace("or", "").Length < str.Length || str.Replace("'", "").Length < str.Length || str.Replace("-", "").Length < str.Length)
            {
                Response.Write("<script>alert('您输入的用户名包含非法字符。');location='register_info.aspx'</script>");
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

                        Session["uId"] = db.GetDataSet(ss).Tables[0].Rows[0][0].ToString();
                        Session["uUsername"] = db.GetDataSet(ss).Tables[0].Rows[0][1].ToString(); ;

                        ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '恭喜您',icon:'success',text: '注册成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Default.aspx';}else{location='Default.aspx';}}catch (e){alert(e);}});</script>");

                    }
                    else
                    {
                        Response.Write("<script>alert('对不起，数据正在维护中。~！');Default.aspx'</script>");
                    }
                }
            }
        }

        //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Image1.ImageUrl = "~/HeadImage/" + DropDownList2.SelectedValue;
        //}

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        
    }
}