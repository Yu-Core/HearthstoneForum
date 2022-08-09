using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ToolGood.Words;

namespace 游戏论坛.Admin.Head
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
                FileUpload1.Attributes.Add("onchange", "CheckFile(this.value)");
            }
        }

        [Obsolete]
        protected void Save_Click(object sender, EventArgs e)
        {
            

            if (H_Name.Text == ""|| !FileUpload1.HasFile)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '添加失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");
            }
            else
            {
                string Imagefile;
                if (IsValidImage(FileUpload1.PostedFile))
                {
                    string filename = FileUpload1.PostedFile.FileName;
                    string fileext = System.IO.Path.GetExtension(filename);
                    string newfilename = (Convert.ToInt32(db.GetDataSet("select top 1 Id from tb_Head order by Id desc").Tables[0].Rows[0][0]) + 1).ToString() + fileext;

                    this.FileUpload1.SaveAs(Server.MapPath("~/HeadImage/" + newfilename));
                    Imagefile = newfilename;
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '文件类型错误，请重新选择图片',confirmButtonText: '确定'});</script>");
                    return;
                }
                

                //敏感词过滤
                string DictionaryPath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "BadWord.txt";
                string[] s = System.IO.File.ReadAllLines(DictionaryPath, System.Text.Encoding.UTF8);
                IllegalWordsSearch iws = new IllegalWordsSearch();
                iws.SetKeywords(s);





                string sql = "insert into tb_Head values ('" + Imagefile + "','" + iws.Replace(this.H_Name.Text, '*') + "')";
                bool flag = db.Execsql(sql);
                if (flag)
                {

                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'success',text: '添加成功',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '添加失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");
                }
            }

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
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