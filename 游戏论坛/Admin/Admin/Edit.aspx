<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="游戏论坛.Admin.Admin.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <link href="../../Css/sweetalert2.css" rel="stylesheet" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
    <script src="../../scripts/sweetalert2.min.js"></script>

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
    <form class="definewidth m20" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table class="table table-bordered table-hover definewidth m10">
            
            <tr>
                <td style="width:10%;" class="tableleft">管理员编号</td>
                <td>
                    <asp:TextBox ID="id" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">管理员名称</td>
                <td>
                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">管理员密码</td>
                <td>
                    <asp:TextBox ID="password" runat="server"></asp:TextBox>
                </td>
            </tr>
            
            
            <tr>
                <td class="tableleft">真实姓名</td>
                <td>
                    <asp:TextBox ID="uname" runat="server"></asp:TextBox>
                </td>
            </tr>
           
            <tr>
                <td class="tableleft"></td>
                <td>
                    <asp:Button ID="Save" CssClass="btn btn-primary" runat="server" Text="保存" OnClientClick="return checking();" OnClick="Save_Click" style="outline:none;" /> &nbsp;&nbsp;
                    <asp:Button ID="Back" CssClass="btn btn-success" runat="server" Text="返回列表" OnClick="Back_Click" />
                </td>
            </tr>
        </table>
        <script>

            var username = document.getElementById("<%=username.ClientID%>");
            var password = document.getElementById("<%=password.ClientID%>");
            var uname = document.getElementById("<%=uname.ClientID%>");
            var usernamereg = /^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
            var passwordreg = /^[A-Za-z0-9]{5,17}$/;
            var unamereg = /^[\u4e00-\u9fa5]{2,}$/;


            username.onblur = function () {
                if (!usernamereg.exec(username.value)) {
                    Swal.fire({
                        icon: 'warning',
                        title: '提示',
                        text: '请输入正确的管理员名格式',
                        showConfirmButton: false,
                        timer: 1500
                    });
                }

            }
            password.onblur = function () {
                if (!passwordreg.exec(password.value)) {
                    Swal.fire({
                        icon: 'warning',
                        title: '提示',
                        text: '请输入正确的密码格式',
                        showConfirmButton: false,
                        timer: 1500
                    });
                }
            }
            
            uname.onblur = function () {
                if (!unamereg.exec(uname.value)) {
                    Swal.fire({
                        icon: 'warning',
                        title: '提示',
                        text: '请输入正确的姓名',
                        showConfirmButton: false,
                        timer: 1500
                    });
                }

            }
            

            function checking() {
                if (!usernamereg.exec(username.value)) {
                    Swal.fire({
                        icon: 'warning',
                        title: '提示',
                        text: '请输入正确的管理员名格式',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }
                if (!passwordreg.exec(password.value)) {
                    Swal.fire({
                        icon: 'warning',
                        title: '提示',
                        text: '请输入正确的密码格式',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }
                
                if (!unamereg.exec(uname.value)) {
                    Swal.fire({
                        icon: 'warning',
                        title: '提示',
                        text: '请输入正确的姓名',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }
                
            }

        </script>
    </form>
</body>
</html>
