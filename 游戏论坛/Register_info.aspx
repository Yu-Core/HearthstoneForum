<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_info.aspx.cs" Inherits="游戏论坛.Register_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="/images/favicon.ico" />
    <title>游戏论坛</title>
    <link href="Css/StyleSheet1.css" rel="stylesheet" />
    <link href="Css/StyleSheet2.css" rel="stylesheet" />
    <link href="Css/StyleSheet3.css" rel="stylesheet" />
    <link href="Css/sweetalert2.css" rel="stylesheet" />
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
    </style>
</head>
<body style="margin:0px;border:0px;">
   <form id="form1" runat="server" > 
       <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <div style="font-family:微软雅黑,Microsoft YaHei,Helvetica,Tahoma,StSun,宋体,SimSun,sans-serif!important;font-weight: 700;user-select:none;" >
            <div class="lg_lbtn" style="right:695px" >
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Size="14px" Font-Underline="False" ForeColor="#FFCC66">返回首页</asp:LinkButton>
                </div>
            <div class="lg_img" style="right:671px;" >                           
                    <asp:Image ID="Image3" runat="server" Height="200px" ImageUrl="~/images/more.png" Width="200px" />               
            </div>
            <video autoplay="autoplay" loop="loop" muted="muted" style="pointer-events:none;" >
                <source src="Video/Illidan.mp4" type="video/mp4" />
            </video>
            <audio controls='controls'   loop="loop" hidden="hidden"  src='Music/Armada.mp3'></audio>
        </div>
        <div style="width:100%;text-align:center;z-index:-1;pointer-events:none;position:absolute;">
            <asp:Image ID="Image2" runat="server" Height="150px" ImageUrl="~/images/lushichuanshuo.png" Width="300px" style="user-select:none;margin-right:10px;" />
        </div>
        <div style="position:absolute;left:160px;bottom:90px;width:365px;text-align:center;box-sizing:border-box;padding:10px 0 30px;background-color:rgba(255,255,255,0.3);z-index:1;box-shadow:2px 2px 10px rgba(0,0,0,0.7);border-radius:5px; " >
            <div style="margin:0 auto;width:300px;">
                <div style="width:100%;margin-top:20px;">
                    <div style="position:relative;width:150px;height:150px;box-sizing:border-box;margin:0 auto;box-sizing:border-box;padding:7.5px 0;background-color:rgba(0,0,0,0.3);border-radius:50%;">
                        
                        <div style="position:relative;width:135px;height:135px;margin:auto auto;">
                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                    <asp:Image ID="Image1" runat="server"  BorderColor="Black" CssClass="round_icon" style="box-shadow: 0 0 10px 2px rgba(0,0,0,0.06);" />                
                               <%-- </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>--%>
                        </div>
                    </div>
                </div>
                <div style="width:100%;margin-top:25px;position:relative;">
                    <div style="margin:0 auto;width:259px;">
                        <table border="0"  style="font-family:Tahoma;font-size:15px;width:auto;border-collapse:collapse;text-align:center;">
                            <tr>
                                <td class="register_info">
                                    <asp:TextBox ID="username" runat="server" CssClass="register_info_TB" MaxLength="8"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info">                    
                                    <asp:TextBox ID="password" runat="server" CssClass="register_info_TB" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Height="29px" Width="259px" CssClass="register_info_TB" style="text-align:center;">
                                        <asp:ListItem>男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info">
                                    <asp:TextBox ID="email" runat="server" CssClass="register_info_TB"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info">
                                    <asp:DropDownList ID="DropDownList2" runat="server" Height="29px" Width="259px"  CssClass="register_info_TB"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info">
                                    <asp:TextBox ID="uname" runat="server" CssClass="register_info_TB"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info">
                                    <asp:TextBox ID="phone" runat="server" CssClass="register_info_TB" MaxLength="11"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="textstroke" style="width:auto;position:absolute;top:0;right:-100%;text-align:left;">
                        <table style="border-collapse:collapse;border:0;">
                            <tr>
                                <td class="register_info2">                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="username" ForeColor="White" ValidationGroup="register" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="username" Display="Dynamic" ErrorMessage="请输入正确的格式" ForeColor="White" ValidationExpression="^[\u4E00-\u9FA5A-Za-z0-9_]+$" ValidationGroup="register" Font-Bold="True"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码不能为空" ControlToValidate="password" ForeColor="White" ValidationGroup="register" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="请输入正确的格式" ForeColor="White" ValidationExpression="^[A-Za-z0-9]{5,17}$" ValidationGroup="register" Font-Bold="True"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info2">

                                </td>
                            </tr>
                            <tr>
                                <td class="register_info2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email不能为空" ControlToValidate="email" ForeColor="White" ValidationGroup="register" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="请输入正确的格式" ForeColor="White" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register" Font-Bold="True"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info2">

                                </td>
                            </tr>
                            <tr>
                                <td class="register_info2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="姓名不能为空" ControlToValidate="uname" ForeColor="White" ValidationGroup="register" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="uname" Display="Dynamic" ErrorMessage="请输入正确的姓名" ForeColor="White" ValidationExpression="^[\u4e00-\u9fa5]{2,}$" ValidationGroup="register" Font-Bold="True"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="register_info2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="手机号不能为空" ControlToValidate="phone" ForeColor="White" ValidationGroup="register" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="phone" ErrorMessage="请输入正确的手机号" ForeColor="White" ValidationExpression="^1[0-9]{10}$" ValidationGroup="register" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="width:100%;margin-top:20px;">
                        <div style="margin:0 auto;width:259px;">
                             <asp:Button ID="login" runat="server" Text="注册" Height="30px" Width="262px" BorderWidth="1px" ForeColor="White" OnClick="Button1_Click" ValidationGroup="register" style="border-radius:3px;"  />
                        </div>
                    </div>
            </div>
        </div>  
       <script>
           var audio = document.getElementsByTagName("audio")[0];
           var body = document.getElementsByTagName("body")[0];
           body.click();
           audio.play();

           var img = document.getElementById("<%=Image1.ClientID%>");
           var ddl = document.getElementById("<%=DropDownList2.ClientID%>");
           ddl.onchange = function () {
               img.src = "/HeadImage/" + ddl.value;
           }
       </script>
   </form>
</body>
</html>
