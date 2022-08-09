<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="游戏论坛.Admin.Notice.Edit" %>

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
    <form id="form1"  runat="server">
        <table class="table table-bordered table-hover ">
            <tr>
                <td style="width:10%" class="tableleft">公告编号</td>
                <td>
                    <asp:TextBox ID="N_Id" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableleft">公告标题</td>
                <td >
                    <asp:TextBox ID="N_Title" runat="server"   Width="300px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>  
            <tr>
                <td class="tableleft">公告内容</td>
                <td >
                    <asp:TextBox ID="N_Content" runat="server" TextMode="MultiLine" style="width:99.5%;height:400px; overflow-y:visible;resize:none;"></asp:TextBox>

                </td>
            </tr> 
    
            <tr>
                <td class="tableleft"></td>
                <td>
                    <asp:Button ID="Save" CssClass="btn btn-primary" runat="server" Text="保存" OnClick="Save_Click" /> &nbsp;&nbsp;
                    <asp:Button ID="Back" CssClass="btn btn-success" runat="server" Text="返回列表" OnClick="Back_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
