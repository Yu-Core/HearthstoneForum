using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class RankingList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt1 = Convert.ToDateTime("2013-10-1");
            DateTime dt2 = System.DateTime.Now;
            int Month = (dt2.Year - dt1.Year) * 12 + (dt2.Month - dt1.Month);

            string s2 = CurrentTimeMillis().ToString();
            string s3 = "seasonId=" + Month + "&type=STD&t=" + s2;
            string jsonText = POST(s3);

            RootObject rb = JsonConvert.DeserializeObject<RootObject>(jsonText);
            DataSet ds = ConvertToDataSet(rb.Data.Ranks);
            DataList1.DataSource = ds.Tables[0].DefaultView;
            DataList1.DataBind();
            Updatatime.Text = "最后更新:" + DateTime.Now.ToString("yyyy-MM-dd") ;
        }

        public static long CurrentTimeMillis()
        {
            return (System.DateTime.UtcNow.Ticks - Jan1st1970Ms) / 10000;
        }
        private static readonly long Jan1st1970Ms = new System.DateTime(1970, 1, 1, 0, 0, 0, System.DateTimeKind.Utc).Ticks;

        public class Ranks
        {
            public string Rating { get; set; }
            public string BattleTag { get; set; }
            public string Rank { get; set; }
        }

        public class Data
        {
            public string Type { get; set; }
            public string SeasonId { get; set; }
            public string DateKey { get; set; }
            public string Status { get; set; }
            public string UpdateTime { get; set; }
            public List<Ranks> Ranks { get; set; }
        }

        public class RootObject
        {
            public Data Data { get; set; }
            public string Msg { get; set; }
            public string Status { get; set; }
        }
        public static DataSet ConvertToDataSet<T>(IList<T> list)
        {
            if (list == null || list.Count <= 0)
            {
                return null;
            }

            DataSet ds = new DataSet();
            DataTable dt = new DataTable("FileRequest");
            DataColumn column;
            DataRow row;

            System.Reflection.PropertyInfo[] myPropertyInfo = typeof(T).GetProperties(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);

            foreach (T t in list)
            {
                if (t == null)
                {
                    continue;
                }

                row = dt.NewRow();

                for (int i = 0, j = myPropertyInfo.Length; i < j; i++)
                {
                    System.Reflection.PropertyInfo pi = myPropertyInfo[i];

                    string name = pi.Name;

                    if (dt.Columns[name] == null)
                    {
                        column = new DataColumn(name, pi.PropertyType);
                        dt.Columns.Add(column);
                    }

                    row[name] = pi.GetValue(t, null);
                }

                dt.Rows.Add(row);
            }

            ds.Tables.Add(dt);

            return ds;
        }
        public static string POST(string postDataStr)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://hs.blizzard.cn/action/hs/leaderboards/season/rank");
            request.CookieContainer = new CookieContainer();
            CookieContainer cookie = request.CookieContainer;//如果用不到Cookie，删去即可
                                                             //以下是发送的http头，随便加，其中referer挺重要的，有些网站会根据这个来反盗链
            //request.Referer = "https://hs.blizzard.cn/community/leaderboards?leaderboardId=STD&seasonId=90";
            //request.Accept = "*/*";
            //request.Host = "hs.blizzard.cn";

            //request.Headers["Accept-Encoding"] = "gzip, deflate, br";
            //request.Headers["Accept-Language"] = "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6";
            //request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36 Edg/89.0.774.77";
            //request.KeepAlive = true;
            //request.Headers["Origin"] = "https://hs.blizzard.cn";
            ////request.Headers["Content-Length"] = 36;
            //request.Headers["Sec-Fetch-Dest"] = "empty";
            //request.Headers["Sec-Fetch-Mode"] = "cors";
            //request.Headers["Sec-Fetch-Site"] = "same-origin";
            //request.Headers["X-Requested-With"] = "XMLHttpRequest";
            //上面的http头看情况而定，但是下面俩必须加
            request.ContentType = "application/x-www-form-urlencoded; charset=UTF-8";
            request.Method = "POST";

            Encoding encoding = Encoding.UTF8;//根据网站的编码自定义
            byte[] postData = encoding.GetBytes(postDataStr);//postDataStr即为发送的数据，格式还是和上次说的一样
            request.ContentLength = postData.Length;
            Stream requestStream = request.GetRequestStream();
            requestStream.Write(postData, 0, postData.Length);

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream responseStream = response.GetResponseStream();
            //如果http头中接受gzip的话，这里就要判断是否为有压缩，有的话，直接解压缩即可
            if (response.Headers["Content-Encoding"] != null && response.Headers["Content-Encoding"].ToLower().Contains("gzip"))
            {
                responseStream = new GZipStream(responseStream, CompressionMode.Decompress);
            }

            StreamReader streamReader = new StreamReader(responseStream, encoding);
            string retString = streamReader.ReadToEnd();

            streamReader.Close();
            responseStream.Close();

            return retString;
        }
    }
}