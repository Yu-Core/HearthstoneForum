<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="游戏论坛.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <style>
       
         .listbox li{
             float: left;
            margin-right: 1px;
            width: 20px;
            height: 20px;
            line-height: 20px;
            text-align: center;
            font-size: 12px;
            cursor: pointer;
            background-color:rgba(0,0,0,0.3);
            color:white;
         }
         .listbox .on{
             background-color:rgba(255,255,255,0.5);
             color:black;
         }
    </style>
    <div id ="ap" style="width:1200px;height:auto;margin:50px auto 0;">
        <div id="tp" style="width:1200px;height:290px;position:relative;margin:20px,0;">
            <div id="Carouselmap" runat="server" style="width:545px;height:273px;position:absolute;float: left;border-radius:5px 0 0 5px;" >
                <div class="listbox"  style="position:absolute;left:5px;top:5px;text-align:left;font-family: 'Arial','Microsoft YaHei','Microsoft YaHei','Microsoft YaHei',sans-serif;font-weight: 700;">
                    <ul id="list" runat="server" style="list-style-type:none;float:left;padding:0;margin:0;">
                         
                     </ul>
                </div>
                
                <div id="Cm_title" class =" textstroke" runat="server" style="width:545px;height:45px;position:absolute;bottom:0px;overflow:hidden;white-space: nowrap;">
                    
                </div>
            </div>
            <div id="Notice" style="width:350px;height:274px;position:absolute;left:545px;background-color:white;box-sizing:border-box;padding-left:25px;padding-right:25px;border-radius:0 5px 5px 0;border:2px solid #b5b4b4;border-left:none;" >
                
                    <div style="width:300px;height:30px;line-height:30px;font-size:18px;font-family:'Microsoft YaHei';color:#e02000;text-align:center;margin-top:15px;">最新公告</div>
                    <div style="width:300px;height:200px;margin:10px 0 20px 0">
                        
                        <table style="width:300px;font-size:14px;font-family:Arial, 'Microsoft YaHei', 黑体, 宋体, sans-serif;margin:0;border:0;color:black">
                            <tbody>
                                <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" OnItemCommand="DataList1_ItemCommand" RepeatLayout = "Flow" RepeatDirection="Horizontal" >                   
                                    <ItemTemplate>
                                        <tr>
                                            <td style="width:200px;height:30px;overflow:hidden;white-space: nowrap;display: inline-block;border-top:1px solid #CCCCCC;height:47px;">
                                                <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="select"   Font-Underline="False"  Text='<%# Eval("Title") %>' style="height:47px;line-height:47px;display: inline-block;"  CssClass="blackcolor"></asp:LinkButton>
                                            </td>
                                            <td style="width:90px;height:30px;text-align:right;overflow:hidden;white-space: nowrap;display: inline-block;border-top:1px solid #CCCCCC;height:47px;">
                                                <asp:Label ID="Label1" runat="server"   Text='<%# Eval("Datatime") %>' ForeColor="#777777" style="height:47px;line-height:47px;display: inline-block;"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:DataList>
                            </tbody>
                        </table>
                            
                        
                    </div>
                </div>
            
            
            <div style="width:285px;height:273px;position:absolute;right:0;background-color:white;border-radius:5px;border:2px solid #b5b4b4;box-sizing:border-box;">
                
                <div class="Sign" style="height:80px;position:relative;font-family:arial,'Hiragino Sans GB','Microsoft Yahei',sans-serif;top:-1px;left:-1px;">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
                        <ContentTemplate>
                            <asp:Button ID="Button3" CssClass="signbtn" runat="server" Height="80px" Width="283px" OnClick="Button3_Click" style="border-radius:5px 5px 0 0;border:none;" ></asp:Button>
                            <div style="width:50px;height:50px;background:url(/images/signin.png) no-repeat;z-index:2;position:absolute;top:20px;left:25px;pointer-events:none;"></div>
                   
                            <div id="Sign" runat="server" style="z-index:2;position:absolute;top:20px;left:100px;pointer-events:none;color:white;font-size:21px;">签到</div>
                            <div id="SignDays" runat="server" style="z-index:2;position:absolute;top:25px;left:180px;pointer-events:none;color:white;font-size:14px;">已签到--天</div>
                            <div id="SignNumber" runat="server" style="width:100px;height:20px;z-index:2;position:absolute;top:55px;left:120px;pointer-events:none;color:white;font-size:12px;">今日已签到--人</div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div style="height:80px;width:285px;position:relative;border-bottom:2px solid #CCCCCC">
                    <div style="width:50px;height:50px;background:url(/images/books.png) no-repeat;z-index:2;position:absolute;top:15px;left:17px;pointer-events:none;"></div>
                    <div style="z-index:2;position:absolute;top:20px;left:100px;color:black;font-size:18px;">
                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="false" CssClass="blackcolor" OnClick="LinkButton3_Click">炉石历史</asp:LinkButton>
                    </div>
                    <div style="z-index:2;position:absolute;top:55px;left:100px;color:#777777;font-size:12px;">
                        了解更多炉石传说历史版本
                    </div>
                </div>
                <div style="height:80px;width:285px;position:relative;margin-top:10px">
                    <div style="width:285px;height:30px;text-align:center;margin-top:20px;">
                    <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="20px" ForeColor="Red"></asp:Label>
                    </div>
                    <div style="width:285px;height:30px;text-align:center;margin-top:10px;font-family:KaiTi">
                    <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="19px" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div id="bp" style="width:1200px;position:relative;height:580px;">
            <div id="Forum_Section" runat="server" style="width:890px;position:relative;float: left;left:-5px;">
                <table style="width:890px;border-collapse:collapse;font-family:'Microsoft Yahei','SimSun',sans-serif;empty-cells:hide;border-radius:5px;">
                    <tr>
                        <td style ="width:297px;margin:0;border:0;padding:0;">
                            <asp:DataList ID="DataList2" runat="server" DataKeyField="Id" OnItemCommand="DataList2_ItemCommand">
                                <ItemTemplate>
                                    <div class="partition">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("areaName") %>' style="color:red;font-size:16px;font-weight:700;"></asp:Label>
                                        <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="select" BorderStyle="None" style="position:absolute;width:100%;height:100%;top:0;left:0;"></asp:LinkButton>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("introduction") %>' Font-Size="13px"></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td style ="width:297px;margin:0;border:0;padding:0;vertical-align:top;">
                            <asp:DataList ID="DataList3" runat="server" DataKeyField="Id" OnItemCommand="DataList3_ItemCommand">
                                <ItemTemplate>
                                    <div class="partition">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("areaName") %>' style="color:red;font-size:16px;font-weight:700;"></asp:Label>
                                        <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="select" BorderStyle="None" style="position:absolute;width:100%;height:100%;top:0;left:0;"></asp:LinkButton>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("introduction") %>' Font-Size="13px"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td style ="width:297px;margin:0;border:0;padding:0;vertical-align:top;">
                            <asp:DataList ID="DataList4" runat="server" DataKeyField="Id" OnItemCommand="DataList4_ItemCommand">
                                <ItemTemplate>
                                    <div class="partition">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("areaName") %>' style="color:red;font-size:16px;font-weight:700;"></asp:Label>
                                        <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="select" BorderStyle="None" style="position:absolute;width:100%;height:100%;top:0;left:0;"></asp:LinkButton>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("introduction") %>' Font-Size="13px"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Popcommendation" runat="server" style="width:285px;height:570px;position:absolute;right:0;top:6px;padding:0px 20px 0 20px;box-sizing:border-box;background-color:white;border-radius:5px;border:2px solid #b5b4b4;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                        <div style="width:245px;height:40px;font-size:14px;position:relative;margin:10px 0 10px 0">
                            <div style="width:66px;height:20px;margin:15px 0 15px 0;position:absolute;border-right:1px solid #777777;float:left;top:0;left:8px;">
                                <asp:Button ID="Button1" runat="server" Text="热门推荐" BackColor="Transparent" BorderStyle="None" Width="66px" CssClass="btnoutline" OnClick="Button1_Click"  />
                            </div>
                            <div style="width:66px;height:20px;margin:15px 0 15px 0;position:absolute;top:0;left:74px;">
                                <asp:Button ID="Button2" runat="server" Text="最新发布" BackColor="Transparent" BorderStyle="None" Width="66px" CssClass="btnoutline" OnClick="Button2_Click" ForeColor="#777777" />
                            </div>
                        </div>
                        <div id="recommend" style="position:absolute;"  runat="server">
                            <asp:DataList ID="DataList5" runat="server" DataKeyField="Id" OnItemCommand="DataList5_ItemCommand">
                                        <ItemTemplate>
                                            <div style="height:41px;width:245px;border-bottom:1px solid #CCCCCC;padding:10px;box-sizing:border-box;overflow:hidden;white-space: nowrap;">
                                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="select" Font-Underline="False" Text='<%# Eval("mName") %>'  CssClass="blackcolor" Font-Size="14px" Width="200px">LinkButton</asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                            </asp:DataList>
                        </div>
                        <div id="newest" style="position:absolute;"  runat="server" visible="false">
                            <asp:DataList ID="DataList6" runat="server" DataKeyField="Id" OnItemCommand="DataList6_ItemCommand">
                                        <ItemTemplate>
                                            <div style="height:41px;width:245px;border-bottom:1px solid #CCCCCC;padding:10px;box-sizing:border-box;overflow:hidden;white-space: nowrap;">
                                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="select" Font-Underline="False" Text='<%# Eval("mName") %>' CssClass="blackcolor" Font-Size="14px" Width="200px">LinkButton</asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                            </asp:DataList>
                        </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </div>    
        </div>
    </div>
    <style>
        .img {
        
        margin: 0 auto;
        display: none;
    }
        .sp{
            margin: 0 auto;
            display: none;
        }
       
                        
        
    </style>
    
    <script type="text/javascript" >
        window.onload = function () {
            var wrap = document.getElementById('<%=Carouselmap.ClientID%>'),
                img = document.getElementsByClassName("img-slide"),
                span = document.getElementsByClassName("span-slide"),
                list = document.getElementById('<%=list.ClientID%>').getElementsByTagName('li'),
                index = 0,
                timer = null;

            img[index].style.display = "block";
            span[index].style.display = "block";
            // 定义并调用自动播放函数
            timer = setInterval(autoPlay, 2000);

            // 鼠标划过整个容器时停止自动播放
            wrap.onmouseover = function () {
                clearInterval(timer);
            }

            // 鼠标离开整个容器时继续播放至下一张
            wrap.onmouseout = function () {
                timer = setInterval(autoPlay, 3000);
            }
            // 遍历所有数字导航实现划过切换至对应的图片
            for (var i = 0; i < list.length; i++) {
                list[i].innerText = i + 1;
                list[i].onmouseover = function () {
                    clearInterval(timer);
                    index = this.innerText - 1;
                    change(index);
                };
            };

            function autoPlay() {
                if (++index >= img.length)
                    index = 0;
                change(index);
            }

            // 定义图片切换函数
            function change(curIndex) {
                for (var i = 0; i < img.length; ++i) {
                    img[i].style.display = "none";
                    span[i].style.display = "none";
                    list[i].className = "";
                }
                img[curIndex].style.display = "block";
                span[curIndex].style.display = "block";
                list[curIndex].className = "on";
            }
            var lbtn = "<%=Button3.ClientID%>";
            var strSession = '<%=Session["uId"]%>';
            function tips() {
                if (strSession == "") {
                    Swal.fire({
                        title: '提示',
                        text: '请先登录',
                        confirmButtonText: '确定'
                    }).then(function(isConfirm)  {
                        try {
                            //判断 是否 点击的 确定按钮
                            if (isConfirm.value) {
                                location = 'Login.aspx';
                            }
                            else {

                            }
                        } catch (e) {
                            alert(e);
                        }
                    });
                }
                else {
                    Swal.fire({
                        icon: 'success',
                        title: '提示',
                        text: '签到成功',
                        showConfirmButton: false,
                        timer: 2000
                    });
                    
                    //setTimeout(location = 'Default.aspx', 2000);
                }
            }
            $("#" + lbtn).click(tips);
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                // re-bind your jquery events here
                $(document).ready(function () {
                    $("#" + lbtn).click(tips);
                });
            }
            );
        };

    </script> 
</asp:Content>
