<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HearthStoneHistory.aspx.cs" Inherits="游戏论坛.HearthStoneHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        li{
            font-size:20px;
        }
    </style>
    <div style="margin-top:30px;width:100%;box-sizing:border-box;text-align:center" >
            <div  style="width:1000px;position:relative;margin:0 auto;box-sizing:border-box;text-align:center;background-color:white;border-radius:5px;border:3px solid #b5b4b4;">
                <div style="position:relative;margin:0 auto;width:725px;height:100%;box-sizing:border-box;padding-top:70px;padding-bottom:90px;font-family: '微软雅黑',Arial,Tahoma,Sans-Serif;">
                    <div style="height:30px;width:100%;text-align:center;color:#614326;">
                            <asp:Label ID="Label1" runat="server"   Font-Size="35px" Font-Bold="true">炉石历史</asp:Label>
                     </div>
                    <div style="width:100%;word-break:break-all;word-wrap:break-word;margin-top:50px;box-sizing:border-box;padding-left:70px;text-align:left">
                        <ul >
                            <li>2013年10月24日，中国服发放《炉石传说》BETA版测试激活码。</li>  
                            <li>2014年1月24日，全球同步公开Beta测试。</li>
                            <li>2014年3月13日，全球同步正式运营。</li>
                            <li>2014年7月10日，登录iPad版平台。</li>
                            <li>2014年7月23日，冒险模式“纳克萨玛斯的诅咒”开启。</li>
                            <li>2014年11月8日，首个扩展包“地精大战侏儒”宣布。</li>
                            <li>2014年12月17日，登录安卓与平板电脑。</li>
                            <li>2014年4月17日，iPad版正式在中国区App Store上架。</li> 
                            <li>2015年4月3日，第二个冒险模式“黑石山的火焰”开启。</li>
                            <li>2015年4月15日，登陆手机移动平台。</li>
                            <li>2015年6月16日，“乱斗模式”上线。</li>
                            <li>2015年8月25日，扩展包“冠军的试炼”上线。</li>
                            <li>2015年11月13日，冒险模式“探险者协会”开启。</li>
                            <li>2016年4月27日，扩展包“上古之神的低语”上线。</li>
                            <li>2016年8月12日，冒险模式“卡拉赞之夜”开启。  </li>
                            <li>2016年12月2日，扩展包“龙争虎斗加基森”上线。</li>
                            <li>2017年4月7日，扩展包“勇闯安戈洛”上线。</li>
                            <li>2017年8月11日，扩展包“冰封王座的骑士”上线。  </li>
                            <li>2017年12月8日，扩展包“狗头人与地下世界”上线。</li>  
                            <li>2018年4月13日，扩展包“女巫森林”上线。</li>
                            <li>2018年7月11日，扩展包“砰砰计划“预购开启。 </li>
                            <li>2018年12月5日，扩展包“拉斯塔哈的大乱斗”上线。</li>
                            <li>2019年4月10日，扩展包“暗影崛起”上线。 </li>
                            <li>2019年8月7日，扩展包“奥丹姆奇兵”上线。</li>
                            <li>2019年11月6日，新游戏模式“酒馆战棋”抢先体验上线，Beta测试于7天后正式开启。</li>  
                            <li>2019年12月11日，扩展包“巨龙降临”上线。</li>  
                            <li>2020年4月8日，扩展包“外域的灰烬”上线。 </li>
                            <li>2020年8月7日，扩展包“通灵学园”上线。 </li>
                            <li>2020年11月18日，扩展包“疯狂的暗月马戏团”上线。 </li> 
                            <li>2021年3月26日，“经典模式”上线。</li>
                            <li>2021年3月31日，扩展包“贫瘠之地的锤炼”上线。</li>
                            
                             
                        </ul>
                        <div style="font-style: italic;font-size:15px;box-sizing:border-box;padding-left:25px;">
                            注：以上因为国服（中国）和外服（美服、欧服、亚服）地区不同可能存在时间上的偏差，请以实际日期为准。
                        </div>
                        
                    </div>
                </div>
                
            </div>
    </div>
   <script defer="defer">
       window.onload = function () {
           var height = document.body.clientHeight;
           var wh = window.innerHeight + 20;
           var time = setInterval(function () {
               if (document.documentElement.scrollTop +  wh >= height ) {
                   clearInterval(time);
               } else {
                   document.documentElement.scrollTop++;
               }
           }, 10); 

           document.onmousedown = function () {
               clearInterval(time);
           }
       }
       
   </script>
</asp:Content>
