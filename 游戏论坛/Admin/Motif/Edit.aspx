<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="游戏论坛.Admin.Motif.Edit" %>

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
                <td style="width:10%" class="tableleft">帖子编号</td>
                <td>
                    <asp:TextBox ID="m_Id" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">标题</td>
                <td>
                    <asp:TextBox ID="mName" runat="server"  MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">发帖人</td>
                <td>
                    <asp:TextBox ID="uUserName" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">所属分区</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="tableleft">内容</td>
                <td>
                    <asp:TextBox ID="mContent" runat="server" TextMode="MultiLine" style="width:99.5%;height:400px; overflow-y:visible;resize:none;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">评论</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="查看评论" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="tableleft">图片</td>
                <td style="overflow:hidden;white-space: nowrap;text-overflow:ellipsis;">
                    <asp:Image ID="m_Image" runat="server" style="max-height:300px" />
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
                var uUserName = document.getElementById("<%=uUserName.ClientID%>"); 
                var mContent = document.getElementById("<%=mContent.ClientID%>");
                if (uUserName.value == "" || uUserName.value == null || mContent.value == "" || mContent.value == null) {
                    return false;
                }
            }
            var SelectImg = document.getElementById("SelectImg");
            var fu = document.getElementById("<%=FileUpload1.ClientID%>");
            var ImgPath = document.getElementById("<%=ImgPath.ClientID%>");
            var m_Image = document.getElementById("<%=m_Image.ClientID%>");
            var selectimgtxt = '添加图片'

            if (m_Image.src != '') {
                selectimgtxt = '修改图片';
            }
            SelectImg.value = selectimgtxt;

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
                    m_Image.src = objURL;
                    m_Image.style.display = '';
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
                    SelectImg.value = selectimgtxt;

                    m_Image.src = '';
                    m_Image.style.display = 'none';
                    return (false);
                }
            }
        </script>
    </form>
</body>
</html>
