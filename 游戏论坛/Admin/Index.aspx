<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="游戏论坛.Admin.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理系统</title>
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
    <link href="../Css/sweetalert2.css" rel="stylesheet" />
    <script src="../scripts/sweetalert2.min.js"></script>
</head>
<body>
    <form runat="server">
        <div class="header">   
            <div class="dl-title">
               <img src="assets/img/top.png" />
            </div>

            <div class="dl-log">欢迎您，
                <asp:Label ID="aName" runat="server" Text="Admin" CssClass="dl-log-user"></asp:Label>
                <asp:LinkButton ID="Exit" runat="server" CssClass="dl-log-quit" OnClick="LinkButton1_Click">[退出]</asp:LinkButton>
            </div>
        </div>
        <div class="content">
            <div class="dl-main-nav">
                <div class="dl-inform">
                    <div class="dl-inform-title">
                        <s class="dl-inform-icon dl-up"></s>
                    </div>
                </div>
                <ul id="J_Nav"  class="nav-list ks-clear">
        		    <li class="nav-item dl-selected">
                        <div class="nav-item-inner nav-home">基础管理</div>

        		    </li>		
                    <li class="nav-item dl-selected">
                        <div class="nav-item-inner nav-order">更多管理</div>
                    </li>       
                </ul>
            </div>
            <ul id="J_NavContent" class="dl-tab-conten"></ul>
        </div>
        <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
        <script type="text/javascript" src="assets/js/bui-min.js"></script>
        <script type="text/javascript" src="assets/js/common/main-min.js"></script>
        <script type="text/javascript" src="assets/js/config-min.js"></script>
        <script>
        BUI.use('common/main',function(){
            var config = [{ id: '1', menu: [{ text: '基础管理', items: [{ id: '2', text: '公告管理', href: 'Notice/Index.aspx' }, { id: '3', text: '分区管理', href: 'Area/index.aspx' }, { id: '4', text: '用户管理', href: 'User/index.aspx' }, { id: '6', text: '帖子管理', href: 'Motif/index.aspx' }, { id: '14', text: '管理员管理', href: 'Admin/index.aspx' }] }] }, { id: '7', homePage: '9', menu: [{ text: '更多管理', items: [{ id: '9', text: '轮播图管理', href: 'Carousel/Index.aspx' }, { id: '10', text: '下载管理', href: 'Download/Index.aspx' }, { id: '11', text: '新手指南管理', href: 'Newstu/Index.aspx' }, { id: '12', text: '头像管理', href: 'Head/Index.aspx' }, { id: '13', text: '举报管理', href: 'Report/Index.aspx' }]}]}];
            new PageUtil.MainPage({
            modulesConfig : config
            });
        });
        </script>
    </form>
</body>
</html>
