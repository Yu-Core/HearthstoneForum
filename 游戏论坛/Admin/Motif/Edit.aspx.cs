using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ToolGood.Words;

namespace 游戏论坛.Admin.Motif
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
                    DataSet ds2 = db.GetDataSet("select areaName from tb_Area");
                    for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
                    {
                        DropDownList1.Items.Add(ds2.Tables[0].Rows[i][0].ToString());
                    }

                    FileUpload1.Attributes.Add("onchange", "CheckFile(this.value)");

                    string sql = "select m.Id,mName,uUsername,areaName,mContent,Imagefile from tb_Motif m,tb_User u,tb_Area a where m.Appearuser = u.uId and m.Areaid = a.Id  and m.Id = '" + Request["id"] + "'";
                    DataSet ds = db.GetDataSet(sql);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        m_Id.Text = ds.Tables[0].Rows[0][0].ToString();
                        mName.Text = ds.Tables[0].Rows[0][1].ToString();
                        uUserName.Text = ds.Tables[0].Rows[0][2].ToString();
                        DropDownList1.SelectedValue = ds.Tables[0].Rows[0][3].ToString();
                        mContent.Text = ds.Tables[0].Rows[0][4].ToString();
                        
                        if (ds.Tables[0].Rows[0][5].ToString() == "")
                        {
                            m_Image.Style.Add("display", "none");
                        }
                        else
                        {
                            m_Image.ImageUrl = "/PlayerImages/" + ds.Tables[0].Rows[0][5].ToString();
                        }
                    }
                    else
                    {
                        Response.Redirect("Index.aspx");
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
            string Imagefile = db.GetDataSet("select Imagefile from tb_Motif where Id = '" + Request["id"] + "'").Tables[0].Rows[0][0].ToString();
            if (FileUpload1.HasFile)
            {


                if (IsValidImage(FileUpload1.PostedFile))
                {
                    string filename = FileUpload1.PostedFile.FileName;
                    string fileext = System.IO.Path.GetExtension(filename);
                    string newfilename = DateTime.Now.ToString("yyyyMMddhhmmss") + Convert.ToString(Session["aName"]) + fileext;

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

            if (mName.Text == "" || mContent.Text == "" || mName.Text.Length > 50 || mContent.Text.Length > 1000)
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

                
                

                int Areaid = int.Parse( db.GetDataSet("select Id from tb_Area where areaName = '" + DropDownList1.SelectedValue + "'").Tables[0].Rows[0][0].ToString());
                string sql = "update tb_Motif set Areaid = '" + Areaid + "',mName = '" + iws.Replace(this.mName.Text, '*') + "',mContent = '" + iws.Replace(this.mContent.Text, '*') + "',Imagefile = '" + Imagefile + "'where Id = '" + Request["id"] + "'";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comment.aspx?Id=" + Request["id"] + "");
        }
    }
}