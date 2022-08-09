using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ToolGood.Words;
using static 游戏论坛.NoHTMLBase;

namespace 游戏论坛
{
    public partial class Module_info : System.Web.UI.Page
    {
        readonly DBconnection db = new DBconnection();
        readonly string shuaxin = "document.getElementsByTagName('meta')[0].httpEquiv = 'refresh';document.getElementsByTagName('meta')[0].content = '0';";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id"] != null)
                {
                    string sql = "select * from tb_Motif where Id = '" + Request["id"] + "'";
                    DataSet ds = db.GetDataSet(sql);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string sql2 = "select a.*, b.Imagefile from tb_User a, tb_Head b where a.uHeadId = b.Id and a.uId = '" + ds.Tables[0].Rows[0][1].ToString() + "'";
                        DataSet ds_2 = db.GetDataSet(sql2);
                        HeadImage.ImageUrl = "/HeadImage/" + ds_2.Tables[0].Rows[0][9].ToString() + "";
                        m_username.Text = ds_2.Tables[0].Rows[0][1].ToString();
                        m_Name.Text = ds.Tables[0].Rows[0][3].ToString();
                        m_Content.Text = ds.Tables[0].Rows[0][4].ToString();
                        if (ds.Tables[0].Rows[0][7].ToString() == "")
                        {
                            m_Image.Visible = false;
                        }
                        m_Image.ImageUrl = "/PlayerImages/" + ds.Tables[0].Rows[0][7].ToString();
                        datetime.Text = TimeDifference((DateTime)ds.Tables[0].Rows[0][5]);
                        string sql_l = "select * from likes_num where mId = '" + Request["id"] + "'";
                        if (db.GetDataSet(sql_l).Tables[0].Rows.Count > 0)
                        {
                            Likes.Text = db.GetDataSet(sql_l).Tables[0].Rows[0][1].ToString();
                        }
                        string sql_c1 = "select * from comment_num where mId = '" + Request["id"] + "'";
                        if (db.GetDataSet(sql_c1).Tables[0].Rows.Count > 0)
                        {
                            Comment.Text = db.GetDataSet(sql_c1).Tables[0].Rows[0][1].ToString();
                            DataSet ds_3 = db.GetDataSet("select c.Id,u.uId,h.Imagefile,u.uUsername,c.Matter,c.Datatime from tb_Comment c, tb_User u, tb_Head h where c.uId = u.uId and u.uHeadId = h.Id and c.mId = '" + Request["id"] + "'order by Datatime desc");
                            DataList1.DataSource = ds_3.Tables[0].DefaultView;
                            DataList1.DataBind();
                        }
                        else
                        {
                            c_ap.Visible = false;
                        }
                        string sql_c2 = "select * from collection_num where mId = '" + Request["id"] + "'";
                        if (db.GetDataSet(sql_c2).Tables[0].Rows.Count > 0)
                        {
                            Collection.Text = db.GetDataSet(sql_c2).Tables[0].Rows[0][1].ToString();
                        }
                        
                        

                        if (Session["uId"] != null)
                        {
                            c_content.Attributes.Add("placeholder", "写评论......");
                            string sql3 = "select * from tb_Likes where uId = '" + Session["uId"] + "'and mId = '" + Request["id"] + "'";
                            if (db.GetDataSet(sql3).Tables[0].Rows.Count > 0)
                            {
                                ImageButton1.ImageUrl = "~/images/liked.png";
                            }

                            string sql4 = "select * from tb_Collection where uId = '" + Session["uId"] + "'and mId = '" + Request["id"] + "'";
                            if (db.GetDataSet(sql4).Tables[0].Rows.Count > 0)
                            {
                                ImageButton3.ImageUrl = "~/images/collected.png";
                            }
                            string sql5 = "select * from tb_Report where uId = '" + Session["uId"] + "'and mId = '" + Request["id"] + "'";
                            if (db.GetDataSet(sql5).Tables[0].Rows.Count > 0)
                            {
                                Report.Enabled = false;
                            }
                            
                            
                            string sql6 = "select * from tb_History where uId ='" + Session["uId"] + "'and mId ='" + Request["id"] + "'";
                            string sql7 = "update tb_motif set Views=Views+1 where id='" + Request["id"] + "'";
                            if (db.GetDataSet(sql6).Tables[0].Rows.Count > 0)
                            {
                                
                                TimeSpan ts = DateTime.Now - (DateTime)db.GetDataSet(sql6).Tables[0].Rows[0][3];
                                if(ts.TotalHours > 1)
                                {
                                    db.Execsql(sql7);
                                }
                                string sql8 = "update tb_History set Datatime = '" + DateTime.Now.ToString("G") + "'where uId ='" + Session["uId"] + "'and mId ='" + Request["id"] + "'";
                                db.Execsql(sql8);
                            }
                            else
                            {
                                
                                db.Execsql(sql7);
                                string sql9 = "insert into tb_History values('" + Session["uId"] + "','" + Request["id"] + "','" + DateTime.Now.ToString("G") + "')";
                                db.Execsql(sql9);
                            }
                            
                            if(Session["uId"].ToString() == ds.Tables[0].Rows[0][1].ToString())
                            {
                                M_Delete.Visible = true;
                            }

                        }
                    }
                    else
                    {
                        ap.Visible = false;
                        ((HtmlGenericControl)Messagetext.FindControl("messagetext")).Style.Add("display","block");
                        box.Style.Add("height", "200px");
                        
                    }

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }

            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["uId"] == null)
            {
                
            }
            else
            {
                if (ImageButton1.ImageUrl == "~/images/likes.png")
                {
                    //点赞
                    string sql = "insert into tb_Likes values('" + Session["uId"] + "','" + Request["id"] + "','" + DateTime.Now.ToString() + "')";
                    db.Execsql(sql);
                    ImageButton1.ImageUrl = "~/images/liked.png";
                    
                    Likes.Text = (int.Parse(Likes.Text) + 1).ToString();
                    
                }
                else
                {
                    //取消点赞
                    string sql2 = "delete from tb_Likes where uId = '" + Session["uId"] + "'and mId  = '" + Request["id"] + "'";
                    db.Execsql(sql2);
                    ImageButton1.ImageUrl = "~/images/likes.png";
                    
                    Likes.Text = (int.Parse(Likes.Text) - 1).ToString();
                    
                }

            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["uId"] == null)
            {
                
            }
            else
            {
                if (ImageButton3.ImageUrl == "~/images/collection.png")
                {
                    //收藏
                    string sql = "insert into tb_Collection values('" + Session["uId"] + "','" + Request["id"] + "','" + DateTime.Now.ToString() + "')";
                    db.Execsql(sql);
                    ImageButton3.ImageUrl = "~/images/collected.png";
                    
                    Collection.Text = (int.Parse(Collection.Text) + 1).ToString();
                    
                }
                else
                {
                    //取消收藏
                    string sql2 = "delete from tb_Collection where uId = '" + Session["uId"] + "'and mId = '" + Request["id"] + "'";
                    db.Execsql(sql2);
                    ImageButton3.ImageUrl = "~/images/collection.png";
                    
                    Collection.Text = (int.Parse(Collection.Text) - 1).ToString();
                    
                }

            }
        }

        [Obsolete]
        protected void Publish_Click(object sender, EventArgs e)
        {
            //发表评论
            if(c_content.Text != "" && c_content.Text.Length <= 500 && Session["uId"] != null )
            {
                string sql = "select top 1* from tb_Quiet where uId = '" + Session["uId"] + "' order by Datatime desc";
                DataSet ds = db.GetDataSet(sql);
                if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][4].ToString().Equals("1"))
                {
                    TimeSpan ts = DateTime.Now - (DateTime)ds.Tables[0].Rows[0][3];
                    if (ts.TotalDays < (int)ds.Tables[0].Rows[0][2])
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '您已被禁言',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = location;}else{location = location;}}catch (e){alert(e);}});</script>");
                        return;
                    }
                }

                //敏感词过滤
                string DictionaryPath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "BadWord.txt";
                string[] s = System.IO.File.ReadAllLines(DictionaryPath, System.Text.Encoding.UTF8);
                IllegalWordsSearch iws = new IllegalWordsSearch();
                iws.SetKeywords(s);

                this.c_content.Text = iws.Replace(this.c_content.Text, '*');
                this.c_content.Text = NoHTML(this.c_content.Text);

                string sql2 = "insert into tb_Comment values('" + Session["uId"] + "','" + Request["id"] + "','" + this.c_content.Text + "','" + DateTime.Now.ToString() + "')";
                db.Execsql(sql2);

                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'success',text: '评论成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){ " + shuaxin +"}else{ " +shuaxin + " }}catch (e){alert(e);}});</script>");


            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'error',text: '评论失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){ " + shuaxin + "}else{ " + shuaxin + " }}catch (e){alert(e);}});</script>");
            }
        }

        //举报
        protected void Report_Click(object sender, EventArgs e)
        {
            if (Session["uId"] == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                       "this", "<script>Swal.fire({title: '提示',text: '请先登录',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = 'Login.aspx';}}catch (e){alert(e);}});</script>");
            
            }
            else
            {
                string sql = "select * from tb_Report where uId = '" + Session["uId"] + "' and mId = '" + Request["id"] + "'";
                
                if(db.GetDataSet(sql).Tables[0].Rows.Count > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                       "this", "<script>Swal.fire({title: '提示',icon:'error',text: '举报失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){ " + shuaxin + "}else{ " + shuaxin + " }}catch (e){alert(e);}});</script>");
                }
                
                string sql2 = "insert into tb_Report values('" + Session["uId"] + "','" + Request["id"] + "','" + DateTime.Now.ToString() + "')";
                db.Execsql(sql2);
                Report.Enabled = false;
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                         "this", "<script>Swal.fire({title: '提示',icon:'success',text: '举报成功',confirmButtonText: '确定'});</script>");


            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //删除评论
            int id = int.Parse(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            string sql = "delete from tb_Comment where Id = '" + id + "'";
            bool flog = db.Execsql(sql);
           
            if (flog)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'success',text: '删除成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){" + shuaxin + "}else{" + shuaxin + "}}catch (e){alert(e);}});</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'error',text: '删除失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){" + shuaxin + "}else{" + shuaxin + "}}catch (e){alert(e);}});</script>");
            }

        }

        //发表时间与当前时间的距离
        protected string TimeDifference(DateTime dt)
        {
            TimeSpan ts = DateTime.Now - dt;
            string timedifference = "";
            if (ts.TotalMinutes < 1)
            {
                timedifference = "刚刚";
            }
            else if (ts.TotalMinutes < 60)
            {
                timedifference = ts.Minutes + "分钟前";
            }
            else if (ts.TotalHours < 24)
            {
                timedifference = ts.Hours + "小时前";
            }
            else if(ts.TotalDays < 30)
            {
                timedifference = ts.Days + "天前";
            }
            else if(DateTime.Now.ToString("yyyy").Equals(dt.ToString("yyyy")))
            {
                dt.ToString("MM-dd");
            }
            else
            {
                timedifference = dt.ToString("yyyy-MM-dd");
            }
            return timedifference;
        }

        protected void BackList_Click(object sender, EventArgs e)
        {
            string sql = "select Areaid from tb_Motif where Id = '" + Request["id"] + "'";
            int id = Convert.ToInt32(db.GetDataSet(sql).Tables[0].Rows[0][0]);
            Response.Redirect("~//Module.aspx?Id=" + id + "");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            //删除帖子
            string sql = "delete from tb_Motif where Id = '" + Request["id"] + "'";
            string sql2 = "select Areaid,Imagefile from tb_Motif where Id = '" + Request["id"] + "'";

            int id = Convert.ToInt32(db.GetDataSet(sql2).Tables[0].Rows[0][0]);
            string FilePath = "~/PlayerImages/" + db.GetDataSet(sql2).Tables[0].Rows[0][1].ToString();
            FilePath = Server.MapPath(FilePath);
            bool flog = db.Execsql(sql);
            if (flog)
            {
                if (System.IO.File.Exists(FilePath))
                {
                    System.IO.File.Delete(FilePath);
                }
                
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'success',text: '删除成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = 'Module.aspx?Id= " + id + "';}else{location ='Module.aspx?Id= " + id + "';}}catch (e){alert(e);}});</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'error',text: '删除失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = location;}else{location = location;}}catch (e){alert(e);}});</script>");
            }
        }
    }
}