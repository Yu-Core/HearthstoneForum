using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class PersonalCenter : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["uId"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    string sql = "select a.*, b.Imagefile from tb_User a, tb_Head b where a.uHeadId = b.Id and a.uId = '" + Session["uId"] + "'";
                    DataSet ds = db.GetDataSet(sql);
                    DataSet ds_2 = db.GetDataSet("select Imagefile from tb_Head");
                    for (int i = 0; i < ds_2.Tables[0].Rows.Count; i++)
                    {
                        DropDownList2.Items.Add(ds_2.Tables[0].Rows[i][0].ToString());
                    }

                    Image1.ImageUrl = "/HeadImage/" + ds.Tables[0].Rows[0][9].ToString() + "";
                    id.Text = ds.Tables[0].Rows[0][0].ToString();
                    username.Text = ds.Tables[0].Rows[0][1].ToString();
                    Label1.Text = ds.Tables[0].Rows[0][1].ToString();
                    password.Text = ds.Tables[0].Rows[0][2].ToString();
                    DropDownList1.SelectedValue = ds.Tables[0].Rows[0][3].ToString();
                    email.Text = ds.Tables[0].Rows[0][4].ToString();
                    DropDownList2.SelectedValue = ds.Tables[0].Rows[0][9].ToString();
                    uname.Text = ds.Tables[0].Rows[0][6].ToString();
                    phone.Text = ds.Tables[0].Rows[0][7].ToString();

                    DataSet ds_3 = db.GetDataSet("select top 100 h.*,m.mName from tb_History h,tb_Motif m where h.mId = m.Id and h.uId = '" + Session["uId"] + "' order by h.Datatime desc");
                    DataList1.DataSource = ds_3.Tables[0].DefaultView;
                    DataList1.DataBind();

                    
                }
            }
             
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataList1.Caption = "History";
            DataList1.DataKeyField = "mId";
            DataSet ds_3 = db.GetDataSet("select top 100 h.*,m.mName from tb_History h,tb_Motif m where h.mId = m.Id and h.uId = '" + Session["uId"] + "' order by h.Datatime desc");
            DataList1.DataSource = ds_3.Tables[0].DefaultView;
            DataList1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DataList1.Caption = "Likes";
            DataList1.DataKeyField = "mId";
            DataSet ds_4 = db.GetDataSet("select l.*,m.mName from tb_Likes l,tb_Motif m where l.mId = m.Id and l.uId = '" + Session["uId"] + "' order by l.Datatime desc");
            DataList1.DataSource = ds_4.Tables[0].DefaultView;
            DataList1.DataBind();

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DataList1.Caption = "Motif";
            DataList1.DataKeyField = "Id";
            DataSet ds_5 = db.GetDataSet("select Id,Appearuser,mName,Datatime from tb_Motif where Appearuser = '" + Session["uId"] + "' order by Datatime desc");
            DataList1.DataSource = ds_5.Tables[0].DefaultView;
            DataList1.DataBind();
        }
        
        protected void Button6_Click(object sender, EventArgs e)
        {
            
            //Button3.Style.Add("border-bottom-color", "#c8c5c5");
            //Button4.Style.Add("border-bottom-color", "#c8c5c5");
            //Button5.Style.Add("border-bottom-color", "#c8c5c5");
            //Button thisClickedButton = sender as Button;
            //thisClickedButton.Style.Add("border-bottom-color", "red");

            DataList1.DataKeyField = "mId";
            DataList1.Caption = "Collection";
            DataSet ds_6 = db.GetDataSet("select c.*,m.mName from tb_Collection c,tb_Motif m where c.mId = m.Id and c.uId = '" + Session["uId"] + "' order by c.Datatime desc");
            DataList1.DataSource = ds_6.Tables[0].DefaultView;
            DataList1.DataBind();
        }

        //修改资料
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!IsUserName(username.Text) || !IsPassWord(password.Text) || !IsEmail(email.Text) || !IsName(uname.Text) || !IsPhone(phone.Text))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '请勿注入非法数据',showConfirmButton: false,timer: 2000});</script>");
                return;
            }
            string ss = "select * from tb_User where uUsername ='" + this.username.Text + "'";
            DataSet ds_2 = db.GetDataSet(ss);
            if (ds_2.Tables[0].Rows.Count > 0 && !ds_2.Tables[0].Rows[0][0].ToString().Equals(Session["uId"].ToString()))
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
                string sql = "update tb_User set uUsername = '" + username.Text + "',uPassword = '" + password.Text + "',uSex = '" + DropDownList1.SelectedValue + "',uEmail = '" + email.Text + "',uHeadId = '" + id + "',uName = '" + uname.Text + "',uPhone = '" + phone.Text + "'where uId = '" + Session["uId"] + "'";
                bool flag = db.Execsql(sql);
                if (flag)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'success',text: '修改资料成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location=location;}else{location=location;}}catch (e){alert(e);}});</script>");

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'success',text: '修改资料失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location=location;}else{location=location;}}catch (e){alert(e);}});</script>");

                }
            }
            
        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {

            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        }
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            
            string sql = "delete from tb_" + DataList1.Caption + " where mId = '" + id + "' and uId = '" + Session["uId"] + "'";
            if(DataList1.Caption == "Motif")
            {
                sql = "delete from tb_" + DataList1.Caption + " where Id = '" + id + "'";
            }
            
            db.Execsql(sql);
            
        }
        
        
        //protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        //{

        //    int id = Convert.ToInt32(DataList2.DataKeys[(int)e.Item.ItemIndex].ToString());
        //    Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        //}
        //protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        //{

        //    int id = Convert.ToInt32(DataList3.DataKeys[(int)e.Item.ItemIndex].ToString());
        //    Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        //}
        //protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
        //{

        //    int id = Convert.ToInt32(DataList4.DataKeys[(int)e.Item.ItemIndex].ToString());
        //    Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        //}

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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string sql = "select h.*,m.mName from tb_" + DataList1.Caption + " h,tb_Motif m where h.mId = m.Id and h.uId = '" + Session["uId"] + "'and CHARINDEX('" + Sou.Text.Trim() + "',m.mName) > 0 order by h.Datatime desc";
            if (DataList1.Caption == "Motif")
            {
                sql = "select * from tb_Motif where Appearuser = '" + Session["uId"]  + "'and CHARINDEX('" + Sou.Text.Trim() + "',mName) > 0 order by Datatime desc";
            }
            DataList1.DataSource = db.GetDataSet(sql).Tables[0].DefaultView;
            DataList1.DataBind();
        }
    }
}