using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


/// <summary>
/// DBconnection 的摘要说明
/// </summary>
public class DBconnection
{
    readonly string sql = System.Configuration.ConfigurationManager.ConnectionStrings["oo"].ConnectionString;

    private readonly SqlConnection conn = null;

    public DBconnection()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
        conn = new SqlConnection(sql);
    }

    public SqlConnection GetConnection()
    {
        return conn;
    }

    public bool Execsql(string sql)
    {
        conn.Open();

        SqlCommand cmd = new SqlCommand(sql, conn);

        int i = cmd.ExecuteNonQuery();

        conn.Close();

        if (i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public DataSet GetDataSet(string sql)
    {
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter(sql, conn);

        DataSet ds = new DataSet();

        da.Fill(ds);

        conn.Close();

        return ds;
    }
    public SqlDataReader GetDatareader(string sql) //返回DataReader对象
    {

        conn.Open();

        SqlCommand cmd = new SqlCommand(sql, conn);

        SqlDataReader dr = cmd.ExecuteReader();

        conn.Close();

        return dr;
    }
    //public string SubStr(string sString, int nLeng)//sString 字符串 nLeng要显示个字
    //{
    //    if (sString.Length <= nLeng)
    //    {
    //        return sString;
    //    }

    //    string sNewStr = sString.Substring(0, nLeng);

    //    sNewStr += "...";

    //    return sNewStr;
    //}
}
