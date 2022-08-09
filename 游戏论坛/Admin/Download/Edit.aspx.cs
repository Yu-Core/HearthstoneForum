using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ToolGood.Words;

namespace 游戏论坛.Admin.Download 
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
                    FileUpload1.Attributes.Add("onchange", "CheckFile(this.value)");
                    FileUpload2.Attributes.Add("onchange", "CheckFile2(this.value)");

                    string sql = "select * from tb_Download where Id = '" + Request["id"] + "'";
                    DataSet ds = db.GetDataSet(sql);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        d_Id.Text = ds.Tables[0].Rows[0][0].ToString();
                        d_System.Text = ds.Tables[0].Rows[0][1].ToString();
                        d_Download.Text = ds.Tables[0].Rows[0][2].ToString();
                        c_Image.ImageUrl = "~/Download/" + ds.Tables[0].Rows[0][3].ToString();
                    }
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
                
            }
        }

        [Obsolete]
        protected void Save_Click(object sender, EventArgs e)
        {
            string Imagefile = db.GetDataSet("select Imagefile from tb_Download where Id = '" + Request["id"] + "'").Tables[0].Rows[0][0].ToString();
            string Packagefile = db.GetDataSet("select Download from tb_Download where Id = '" + Request["id"] + "'").Tables[0].Rows[0][0].ToString();
            if (FileUpload1.HasFile)
            {


                if (IsValidImage(FileUpload1.PostedFile))
                {
                    string filename = FileUpload1.PostedFile.FileName;
                    string filename2 = FileUpload2.PostedFile.FileName;
                    string fileext = System.IO.Path.GetExtension(filename);
                    string fileext2 = System.IO.Path.GetExtension(filename2);
                    string newfilename = DateTime.Now.ToString("yyyyMMddhhmmss") + Convert.ToString(Session["aName"]) + fileext;
                    string newfilename2 = DateTime.Now.ToString("yyyyMMddhhmmss") + fileext2;

                    this.FileUpload1.SaveAs(Server.MapPath("~/Download/" + newfilename));
                    this.FileUpload2.SaveAs(Server.MapPath("~/Download/" + newfilename2));
                    Imagefile = newfilename;
                    Packagefile = newfilename2;
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),
                        "this", "<script>Swal.fire({title: '提示',icon:'warning',text: '文件类型错误，请重新选择图片',confirmButtonText: '确定'});</script>");
                    return;
                }
            }

            if (d_System.Text == "" )
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                            "this", "<script>Swal.fire({title: '提示',icon:'error',text: '修改失败',confirmButtonText: '确定'}).then((isConfirm) => {try{if (isConfirm.value){location='Index.aspx';}else{location='Index.aspx';}}catch (e){alert(e);}});</script>");
            }
            else
            {
                //敏感词过滤
                string DictionaryPath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "BadWord.txt";
                string[] s = System.IO.File.ReadAllLines(DictionaryPath, System.Text.Encoding.UTF8);
                IllegalWordsSearch iws = new IllegalWordsSearch();
                iws.SetKeywords(s);

                
                

                
                string sql = "update tb_Download set System = '" + iws.Replace(this.d_System.Text, '*') + "',Download = '" + Packagefile + "',Imagefile = '" + Imagefile + "'where Id = '" + Request["id"] + "'";
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