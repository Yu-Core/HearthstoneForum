<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="游戏论坛.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="/images/favicon.ico" />
    <title>游戏论坛</title>
    <link href="Css/StyleSheet1.css" rel="stylesheet" />
    <link href="Css/StyleSheet2.css" rel="stylesheet" />
    <link href="Css/StyleSheet3.css" rel="stylesheet" />
    <link href="Css/sweetalert2.css" rel="stylesheet" />
    <link href="Css/sweetalert2.min.css" rel="stylesheet" />
    <script src="scripts/jquery-1.7.2.js"></script>
    <script src="scripts/sweetalert2.min.js"></script>
    <style>
        @keyframes backindex {
            from {
                top: -40px;
            }

            to {
                top: -5px;
            }
        }

        @keyframes backindex2 {
            from {
                top: -90px;
            }

            to {
                top: -75px;
            }
        }

        @keyframes state {
            from {
                border-width: 25px;
            }

            to {
                border-width: 45px;
            }
        }

        .highlight:focus {
            /*-webkit-transition: border linear .2s,-webkit-box-shadow linear .5s;*/
            border-color: rgba(141,39,142,.75);
            -webkit-box-shadow: 0 0 18px #DC143C;
        }
    </style>
</head>
<body style="margin: 0px 0px 0px 0px;">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <div style="font-family: 微软雅黑,Microsoft YaHei,Helvetica,Tahoma,StSun,宋体,SimSun,sans-serif!important; font-weight: 700; user-select: none;">
            <div class="lg_lbtn">
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="14px" OnClick="LinkButton1_Click" Font-Underline="False" ForeColor="#FFCC66">返回首页</asp:LinkButton>
            </div>
            <div class="lg_img">
                <asp:Image ID="Image2" runat="server" Height="200px" ImageUrl="~/images/more.png" Width="200px" />
            </div>
            <video autoplay="autoplay" loop="loop" muted="muted" style="pointer-events: none;">
                <source src="Video/LichKing.mp4" type="video/mp4" />
            </video>
            <audio controls='controls' loop="loop" hidden="hidden" src='Music/invincible.mp3'></audio>
        </div>
        <div style="position: absolute; right: 180px; bottom: 130px; width: 350px; text-align: center; box-sizing: border-box; padding: 20px 0 50px; background-color: rgba(255,255,255,0.3); z-index: 1; box-shadow: 2px 2px 10px #909090; border-radius: 5px;">
            <div id="login-switch" style="border-radius: 0 5px 0 0">
                <div id="login-state-box">
                    <input id="login-state" type="button" />
                </div>
                <asp:HiddenField ID="HiddenField2" runat="server" Value="User" />
            </div>

            <div style="margin: 0 auto; width: 300px;">
                <table border="0" style="font-family: Tahoma; text-align: left; margin: 0 auto; font-size: 15px; width: auto; text-overflow: ellipsis; white-space: nowrap; word-break: keep-all; border-collapse: collapse;">

                    <tr>
                        <td style="text-align: center; box-sizing: border-box; padding-bottom: 30px;">
                            <asp:Image ID="Image1" runat="server" Height="123px" ImageUrl="~/images/lushichuanshuo.png" Width="250px" Style="user-select: none;" />
                        </td>

                    </tr>
                    <tr>
                        <td class="Login">
                            <asp:TextBox ID="username" runat="server" CssClass="highlight" Height="37px" Width="300px" BorderColor="#996633" Style="outline: none; font-size: 15px; padding-left: 5px; box-sizing: border-box; border-radius: 2px; border: 1px solid #cecaca"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 16px; font-size: 12px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入你的用户名" ControlToValidate="username" ForeColor="White" ValidationGroup="login" BorderStyle="None" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td class="Login">
                            <asp:TextBox ID="password" CssClass="highlight" runat="server" Height="37px" Width="300px" BorderColor="#996633" TextMode="Password" Style="outline: none; font-size: 15px; padding-left: 5px; box-sizing: border-box; border-radius: 2px; border: 1px solid #cecaca"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 16px; font-size: 12px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="喵，你忘了输入密码了吗？" ControlToValidate="password" Display="Dynamic" ForeColor="White" ValidationGroup="login" BorderStyle="None"></asp:RequiredFieldValidator>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="Label8" runat="server" ForeColor="White"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="login" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>

                    </tr>
                    <tr>
                        <td class="Login">
                            <div>
                                <div class="drag" style="border-radius: 2px;">
                                    <div class="bg" style="border-radius: 2px;"></div>
                                    <div id="text" class="text" style="border-radius: 2px;">请拖动滑块解锁</div>
                                    <div id="btn" class="btn" style="border-radius: 2px;">&gt;&gt;</div>
                                </div>

                            </div>

                        </td>

                    </tr>
                    <tr>
                        <td class="Login">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="position: relative">
                            <div style="position: absolute; top: -25px; width: 100%; box-sizing: border-box; padding: 0 3px;">
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Font-Underline="False" Style="float: left; color: white; font-size: 12px">注册账号</asp:LinkButton>
                                <input id="forget" type="button" value="找回密码" style="float: right; color: white; font-size: 12px; background-color: transparent; outline: none; border: none; cursor: pointer;" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; height: 40px;">
                            <asp:Button ID="login" runat="server" Text="登录" Height="40px" Width="300px" BorderWidth="1px" ForeColor="White" OnClick="Button1_Click" ValidationGroup="login" Style="border-radius: 2px;" />
                        </td>
                    </tr>
                </table>
            </div>

        </div>
        <script>
            var audio = document.getElementsByTagName("audio")[0];
            var body = document.getElementsByTagName("body")[0];
            body.click();
            audio.play();
            (function () {
                //一、定义一个获取DOM元素的方法
                var $ = function (selector) {
                    return document.querySelector(selector);
                },
                    box = $(".drag"),//容器
                    bg = $(".bg"),//背景
                    text = $(".text"),//文字
                    btn = $(".btn"),//滑块
                    hf = $("#<%=HiddenField1.ClientID%>"),//隐藏域
                    lb8 = $("#<%=Label8.ClientID%>"),//验证失败的显示
                    username = $("#<%=username.ClientID%>"),//用户名
                    password = $("#<%=password.ClientID%>"),//密码
                    success = false,//是否通过验证的标志
                    distance = box.offsetWidth - btn.offsetWidth;//滑动成功的宽度（距离）
                hf.value = "失败";
                //二、给滑块注册鼠标按下事件
                btn.onmousedown = function (e) {
                    //1.鼠标按下之前必须清除掉后面设置的过渡属性
                    btn.style.transition = "";
                    bg.style.transition = "";
                    //说明：clientX 事件属性会返回当事件被触发时，鼠标指针向对于浏览器页面(或客户区)的水平坐标。
                    //2.当滑块位于初始位置时，得到鼠标按下时的水平位置
                    var e = e || window.event;
                    var downX = e.clientX;
                    //三、给文档注册鼠标移动事件
                    document.onmousemove = function (e) {
                        var e = e || window.event;
                        //1.获取鼠标移动后的水平位置
                        var moveX = e.clientX;
                        //2.得到鼠标水平位置的偏移量（鼠标移动时的位置 - 鼠标按下时的位置）
                        var offsetX = moveX - downX;
                        //3.在这里判断一下：鼠标水平移动的距离 与 滑动成功的距离 之间的关系
                        if (offsetX > distance) {
                            offsetX = distance;//如果滑过了终点，就将它停留在终点位置
                        } else if (offsetX < 0) {
                            offsetX = 0;//如果滑到了起点的左侧，就将它重置为起点位置
                        }
                        //4.根据鼠标移动的距离来动态设置滑块的偏移量和背景颜色的宽度
                        btn.style.left = offsetX + "px";
                        bg.style.width = offsetX + "px";
                        //如果鼠标的水平移动距离 = 滑动成功的宽度
                        if (offsetX == distance && username.value != '' && password.value != '') {
                            //1.设置滑动成功后的样式
                            text.innerHTML = "验证通过";
                            text.style.color = "#fff";
                            hf.value = "成功";
                            $("#<%=Label8.ClientID%>").innerHTML = "";
                            btn.innerHTML = "&radic;";
                            btn.style.color = "green";
                            bg.style.backgroundColor = "lightgreen";
                            //2.设置滑动成功后的状态
                            success = true;
                            //成功后，清除掉鼠标按下事件和移动事件（因为移动时并不会涉及到鼠标松开事件）
                            btn.onmousedown = null;
                            document.onmousemove = null;
                            //3.成功解锁后的回调函数

                        }
                    }

                    //四、给文档注册鼠标松开事件
                    document.onmouseup = function (e) {
                        //如果鼠标松开时，滑到了终点，则验证通过
                        if (success) {
                            return;
                        } else {
                            //反之，则将滑块复位（设置了1s的属性过渡效果）
                            btn.style.left = 0;
                            bg.style.width = 0;
                            btn.style.transition = "left 1s ease";
                            bg.style.transition = "width 1s ease";
                        }
                        //只要鼠标松开了，说明此时不需要拖动滑块了，那么就清除鼠标移动和松开事件。
                        document.onmousemove = null;
                        document.onmouseup = null;
                    }
                }
            })()

        </script>
        <script>
            window.onload = function () {
                var tab = document.getElementById("login-state");
                var h2 = document.getElementById("<%=HiddenField2.ClientID%>");
                var username = document.getElementById("<%=username.ClientID%>");
                var password = document.getElementById("<%=password.ClientID%>");
                var login = document.getElementById("<%=login.ClientID%>");
                tab.onclick = function () {
                    if (h2.value == 'User') {
                        h2.value = 'Admin';
                        tab.style.background = "url(/images/User.png) no-repeat";
                        tab.style.backgroundSize = "75px";
                        tab.style.backgroundPosition = "-15px -13.5px";
                        username.placeholder = "请输入管理员账号";
                        password.placeholder = "请输入管理员密码";
                        username.value = "";
                        password.value = "";
                        login.value = "管理员登录";
                    }
                    else {
                        h2.value = 'User';
                        tab.style.background = "url(/images/Admin.png) no-repeat";
                        tab.style.backgroundSize = "75px";
                        tab.style.backgroundPosition = "-15px -10px";
                        username.placeholder = "请输入用户名";
                        password.placeholder = "请输入密码";
                        username.value = "";
                        password.value = "";
                        login.value = "登录";
                    }
                }


            }


            var forget = document.getElementById("forget");
            forget.onclick = function () {

                Swal.fire({
                    title: '请输入如下信息',
                    html: '<input  id="Fusername" autocapitalize="off" class="swal2-input" placeholder="用户名" type="text" style="display: flex;" />' +
                        '<input  id="Fname" autocapitalize="off" class="swal2-input" placeholder="姓名" type="text" style="display: flex;" />' +
                        '<input id="Fphone" autocapitalize="off" class="swal2-input" placeholder="手机号" type="text" style="display: flex;" />',
                    confirmButtonText: '确定',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: '取消',
                    focusConfirm: false
                }).then((result) => {
                    var username = $("#Fusername").attr("value");
                    var name = $("#Fname").attr("value");
                    var phone = $("#Fphone").attr("value");
                    if (result.value && username != '' && name != '' && phone != '') {
                        Swal.fire({
                            title: '提示',
                            text: '正在加载中',
                            allowOutsideClick: false,
                            showConfirmButton: false,
                            timer: 8000,
                            onBeforeOpen: () => {
                                Swal.showLoading()
                            },
                            onClose: () => {
                                Swal.fire({
                                    title: '提示',
                                    text: "发送超时，请检查你的网络连接",
                                    type: 'error',
                                    confirmButtonText: '确定'
                                })
                            }
                        })
                        $.ajax({
                            type: "post", //提交方式
                            url: "/SendMail.ashx", //一般处理程序的路径
                            data: { Fusername: username, Fname: name, Fphone: phone }, //向后台传入的值
                            dataType: "text", //返回值格式 
                            success: function (data) {
                                if (data == 'success') {
                                    Swal.fire({
                                        title: '发送成功',
                                        text: "密码已发送至您的邮箱，请注意查收",
                                        type: 'success',
                                        confirmButtonText: '确定'
                                    })
                                }
                                else if (data == 'fail') {
                                    Swal.fire({
                                        title: '发送失败',
                                        text: "可能是您输入的信息有误",
                                        type: 'error',
                                        confirmButtonText: '确定'

                                    })
                                }
                                else {
                                    Swal.fire({
                                        title: '发送失败',
                                        text: data,
                                        type: 'error',
                                        confirmButtonText: '确定'
                                    })
                                }
                            }
                        });


                    }

                })
            }
        </script>
    </form>
</body>
</html>
