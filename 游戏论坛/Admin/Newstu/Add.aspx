﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="游戏论坛.Admin.Newstu.Add" %>

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
        <input type="hidden" name="id" value="{$menu.id}" />
        <table class="table table-bordered table-hover m10">
            
            
            <tr>
                <td style="width:10%" class="tableleft">标题</td>
                <td>
                    <asp:TextBox ID="N_Title" runat="server"  MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">指南内容</td>
                <td >
                    <asp:TextBox ID="N_Content" runat="server" TextMode="MultiLine" style="width:99.5%;height:400px; overflow-y:visible;resize:none;"></asp:TextBox>

                </td>
            </tr> 
            
            
            <tr>
                <td class="tableleft">图片</td>
                <td style="overflow:hidden;white-space: nowrap;text-overflow:ellipsis;">
                    <asp:Image ID="c_Image" runat="server" style="max-height:300px" />
                    <div style="display:none;" >
                        <asp:FileUpload ID="FileUpload1"  runat="server" />            
                    </div>
                    <input type="button" id="SelectImg" value="添加图片" />
                    <asp:Label ID="ImgPath" runat="server" Text="" style=""></asp:Label>
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
            function checking() {
                var N_Title = document.getElementById("<%=N_Title.ClientID%>");
                var N_Content = document.getElementById("<%=N_Content.ClientID%>");
                if (N_Title.value == "" || N_Title.value == null || N_Content.value == "" || N_Content.value == null) {
                    return false;
                }
            }
            var SelectImg = document.getElementById("SelectImg");
            var fu = document.getElementById("<%=FileUpload1.ClientID%>");
            var ImgPath = document.getElementById("<%=ImgPath.ClientID%>");
            var c_Image = document.getElementById("<%=c_Image.ClientID%>");
            

            SelectImg.onclick = function () {
                fu.click();
            }
            
            function CheckFile(str) {
                var strRegex = "(.jpg|.JPG|.jpeg|.JPEG|.gif|.GIF|.png|.PNG)$"; //用于验证图片扩展名的正则表达式
                var re = new RegExp(strRegex);
                if (re.test(str)) {

                    ImgPath.innerText = fu.files[0].name;
                    SelectImg.value = '已选择';

                    function getObjectURL(file) {
                        var url = null;
                        if (window.createObjcectURL != undefined) {
                            url = window.createOjcectURL(file);
                        } else if (window.URL != undefined) {
                            url = window.URL.createObjectURL(file);
                        } else if (window.webkitURL != undefined) {
                            url = window.webkitURL.createObjectURL(file);
                        }
                        return url;
                    }
                    var objURL = getObjectURL(fu.files[0]);//这里的objURL就是input file的真实路径
                    c_Image.src = objURL;
                    c_Image.style.display = '';
                    return (true);

                }
                else {
                    if (str != '' && str != null) {
                        Swal.fire({
                            title: '提示',
                            icon: 'warning',
                            text: '请选择正确的图片',
                            confirmButtonText: '确定'
                        });
                    }

                    ImgPath.innerText = '';
                    SelectImg.value = '添加图片';

                    c_Image.src = '';
                    c_Image.style.display = 'none';
                    return (false);
                }
            }
        </script>
    </form>
</body>
</html>