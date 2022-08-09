using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace 游戏论坛
{
    /// <summary>
    /// SendMail 的摘要说明
    /// </summary>
    public class SendMail : IHttpHandler
    {
        readonly DBconnection db = new DBconnection();
        public void ProcessRequest(HttpContext context)
        {
            string jsonText = Get("https://v1.jinrishici.com/all.json");
            Root rt = JsonConvert.DeserializeObject<Root>(jsonText);

            context.Response.ContentType = "text/plain";
            string username = context.Request["Fusername"].Trim().ToString();
            string name = context.Request["Fname"].Trim().ToString();
            string phone = context.Request["Fphone"].Trim().ToString();

            string sql = "select * from tb_User where uUsername = '" + username + "'and uName ='" + name + "'and uPhone = '" + phone + "'";
            DataSet ds = db.GetDataSet(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string mailTo = ds.Tables[0].Rows[0][4].ToString();
                string mailSubject = rt.Content;
                string mailContent =
                "<center style=\"margin: 0; padding: 0; background-color: #ebedf0;\">" +
                    "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"800px\" height=\"1130px\" align=\"center\" style=\"background:url(https://mqmmw.oss-cn-beijing.aliyuncs.com/parchment2.png);background-size:cover; \">" +
                         "<tbody>" +
                            "<tr>" +
                                "<td style=\"vertical-align: top; padding:200px;font-weight: 900; font-family: STKaiti;color: #000000; font-size: 27px; \" height=\"150px\">" +
                                    "<h1 style=\"color: #000000;text-align:center;font-size:40px;margin:50px 0 30px;padding-right:30px\">亲爱的" + ds.Tables[0].Rows[0][1].ToString() + ",你好</h1>" +
                                    "<p>你选择了忘记密码服务<br />" +
                                        "你的旧密码为" + ds.Tables[0].Rows[0][2].ToString() + "</p>" +
                                    "<p style=\"text-align:right\">谨致<br />" + DateTime.Now.ToString("D") + "<br />LSCS论坛</p>" +
                                "</td>" +
                            "</tr>" +
                        "</tbody>" +
                    "</table>" +
                "</center>";
                context.Response.Write((SendEmail(mailTo, mailSubject, mailContent)));
            }
            else
            {
                context.Response.Write("fail");
            }
            //string resStr = success.ToString();
            
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="mailTo">收件地址</param>
        /// <param name="mailSubject">邮件主题</param>
        /// <param name="mailContent">邮件内容</param>
        /// <returns>邮件是否发送成功</returns>
        public static string SendEmail(string mailTo, string mailSubject, string mailContent)
        {
            //设置发送方的邮件信息,使用最常见的qq邮箱
            string smtpServer = "smtp.163.com";         //SMTP服务器
            string mailFrom = "邮箱地址";      //登陆用户名
            string userPassword = "邮箱授权码";  //SMTP授权码，这里会有人误解为邮箱的密码，其实是授权码，具体看下面获取授权码操作

            //邮件服务设置
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;  //邮件发送方式
            smtpClient.Host = smtpServer;                            //SMTP服务器
            smtpClient.Port = 25;                                   //邮箱SMTP发送端口，可以不填          
            smtpClient.EnableSsl = true;                             //邮箱SMTP SSL加密，可以不填
            smtpClient.Credentials = new System.Net.NetworkCredential(mailFrom, userPassword); //用户名和密码

            //发送邮件设置      
            MailMessage mailMessage = new MailMessage(mailFrom, mailTo);    //发送人和收件人
            mailMessage.CC.Add(mailFrom);
            mailMessage.Subject = mailSubject;                              //邮件主题
            mailMessage.Body = mailContent;                                 //邮件内容
            mailMessage.BodyEncoding = Encoding.UTF8;                       //邮件正文编码
            mailMessage.IsBodyHtml = true;                                  //设置为HTML格式
            mailMessage.Priority = MailPriority.Low;                        //优先级，可不填

            try
            {
                smtpClient.Send(mailMessage);         //发送邮件
                //return true;
                return "success";
            }
            catch (SmtpException e)
            {
                //return false;
                return e.Message;
            }
        }

        public class Root
        {
            /// <summary>
            /// 金樽清酒斗十千，玉盘珍羞直万钱。
            /// </summary>
            public string Content { get; set; }
            /// <summary>
            /// 行路难·其一
            /// </summary>
            public string Origin { get; set; }
            /// <summary>
            /// 李白
            /// </summary>
            public string Author { get; set; }
            /// <summary>
            /// 古诗文-食物-写酒
            /// </summary>
            public string Category { get; set; }
        }


        public static string Get(string serviceUrl)
        {
            //创建Web访问对象
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(new Uri(serviceUrl));
            //通过Web访问对象获取响应内容
            HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
            //通过响应内容流创建StreamReader对象，因为StreamReader更高级更快
            StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            //string returnXml = HttpUtility.UrlDecode(reader.ReadToEnd());//如果有编码问题就用这个方法
            string returnXml = reader.ReadToEnd();//利用StreamReader就可以从响应内容从头读到尾
            reader.Close();
            if (myResponse != null)
                myResponse.Close();
            if (myRequest != null)
                myRequest.Abort();
            return returnXml;
        }
    }
}