using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ToolGood.Words;

namespace 游戏论坛
{
    public partial class Module : System.Web.UI.Page
    {
        private int PageSize = 20;

        readonly DBconnection db = new DBconnection();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    string sql = "select areaName from tb_Area where Id = '" + Request["id"] + "'";
                    if(db.GetDataSet(sql).Tables[0].Rows.Count > 0)
                    {
                        BindData();
                        Label1.Text = db.GetDataSet(sql).Tables[0].Rows[0][0].ToString();
                        m_Name.Attributes.Add("placeholder", "请填写标题");
                        FileUpload1.Attributes.Add("onchange","CheckFile(this.value)");
                    }
                    else
                    {
                        ap.Visible = false;
                        ((HtmlGenericControl)Messagetext.FindControl("messagetext")).Style.Add("display", "block");
                        box.Style.Add("height", "200px");
                    }
                    
                }
            }
            
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {

            PageSize = AspNetPager1.PageSize;//单页面帖子显示数目
            int start = AspNetPager1.StartRecordIndex - 1;
            string sql = "SELECT m.*,u.uUsername,isnull(final.uUsername,u.uUsername) finaluser,isnull(final.Datatime,m.Datatime) finaltime,final.CommentNum" +
                            " FROM tb_User u,"+
                            " ("+
                                " SELECT m.Id,max(u.uUsername) uUsername,Max(c.Datatime) Datatime,COUNT(c.Id) CommentNum" +
                                " FROM  tb_Motif m" +
                                " left join tb_Comment c on c.mId = m.Id" +
                                " left join  tb_User u on c.uId = u.uId" +
                                " group by m.Id" +
                            " ) final," +
                            " (" +
                                " SELECT t1.Id,t1.Appearuser,t1.Areaid,t1.mName,t1.Datatime,t1.Views FROM tb_Motif t1, " +
                                " (" +
                                    " SELECT TOP " + PageSize.ToString() +" Id FROM" +
                                    " (" +
                                        " SELECT TOP "+ (start + PageSize).ToString() + " Id, Datatime FROM tb_Motif WHERE Areaid ='" + Request["id"] + "' ORDER BY Datatime DESC, Id DESC" +
                                    " ) t ORDER BY t.Datatime ASC, t.Id ASC" +
                                " ) t2" +
                                " WHERE t1.Id = t2.Id" +
                            " ) m" +
                            " where m.Appearuser = u.uId and m.Id = final.Id " +
                            " ORDER BY isnull(final.Datatime, m.Datatime) desc";

            this.DataList1.DataSource = db.GetDataSet(sql);
            this.DataList1.DataBind();

        }
        public void BindData()
        {

            /*统计订单数量*/
            string sql = "select count(*) from tb_Motif where Areaid ='" + Request["id"] + "'";
            DataSet ds1 = db.GetDataSet(sql);
            AspNetPager1.RecordCount = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());

            /*取前n条数据*/
            string sql2 = "SELECT m.*,u.uUsername,isnull(final.uUsername,u.uUsername) finaluser,isnull(final.Datatime,m.Datatime) finaltime,final.CommentNum" +
                           " FROM tb_User u," +
                            " (" +
                            " SELECT m.Id,max(u.uUsername) uUsername,Max(c.Datatime) Datatime,COUNT(c.Id) CommentNum" +
                            " FROM tb_Motif m" +
                            " left join tb_Comment c on c.mId = m.Id" +
                            " left join tb_User u on c.uId = u.uId" +
                            " group by m.Id		" +
                            " ) final," +
                            " (" +
                            " select top " + PageSize.ToString() + " * from tb_Motif" +
                            " where Areaid ='" + Request["id"] + "'" +
                            " order by Datatime desc" +
                            " ) m" +
                            " where m.Appearuser = u.uId and m.Id = final.Id " +
                            " ORDER BY isnull(final.Datatime,m.Datatime) desc";
            this.DataList1.DataSource = db.GetDataSet(sql2);
            this.DataList1.DataBind();//DataList绑定数据源

        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            int id = Convert.ToInt32(DataList1.DataKeys[(int)e.Item.ItemIndex].ToString());
            Response.Redirect("~//Module_info.aspx?Id=" + id + "");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        [Obsolete]
        protected void Publish_Click(object sender, EventArgs e)
        {
            if(Session["uId"] == null)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'error',text: '发表失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = location;}else{location = location;}}catch (e){alert(e);}});</script>");
                return;
            }
            string Imagefile = null;
            if (FileUpload1.HasFile)
            {

                
                if (IsValidImage(FileUpload1.PostedFile))
                {
                    string filename = FileUpload1.PostedFile.FileName;
                    string fileext = System.IO.Path.GetExtension(filename);
                    string newfilename = DateTime.Now.ToString("yyyyMMddhhmmss") + Convert.ToString(Session["uId"]) + fileext;

                    this.FileUpload1.SaveAs(Server.MapPath("~/PlayerImages/" + newfilename));
                    Imagefile = newfilename;
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '文件类型错误，请重新选择图片',confirmButtonText: '确定'});</script>");
                    return;
                }
            }
            else
            {

            }

            if (m_Name.Text != "" && m_Name.Text.Length <= 50 && m_Content.Text != "" && m_Content.Text.Length <= 1000 && Session["uId"] != null)
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


                string sql2 = "insert into tb_Motif values('" + Session["uId"] + "','" + Request["id"] + "','" + iws.Replace(this.m_Name.Text, '*')  + "','" + iws.Replace(this.m_Content.Text, '*') + "','" + DateTime.Now.ToString() + "', '0' , '" + Imagefile + "')";
                db.Execsql(sql2);

                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'success',text: '发表成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = location;}else{location = location;}}catch (e){alert(e);}});</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'error',text: '发表失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location = location;}else{location = location;}}catch (e){alert(e);}});</script>");
            }
        }

        protected bool IsValidImage(System.Web.HttpPostedFile postedFile)
        {
            string sMimeType = postedFile.ContentType.ToLower();

            if (sMimeType.IndexOf("image/") < 0)
                return false;
            if (postedFile.ContentLength < 50)
                return false;
            try
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(postedFile.InputStream);
                if (img.Width * img.Height < 1)
                    return false;
                img.Dispose();
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}