using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 游戏论坛
{
    public partial class AppleStore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (CheckNetwork.IsNetworkConnected)
            {
                Response.Redirect("https://apps.apple.com/cn/app/lu-shi-chuan-shuo-mo-shou/id841140063?ign-mpt=uo%3D4");

            }
            
        }
        public class CheckNetwork
        {
            [DllImport("wininet.dll", EntryPoint = "InternetGetConnectedState")]
            public extern static bool InternetGetConnectedState(out int conState, int reader);

            public static bool IsNetworkConnected
            {
                get
                {
                    return InternetGetConnectedState(out int n, 0);
                }
            }
        }
    }
}