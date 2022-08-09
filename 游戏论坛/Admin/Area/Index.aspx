<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="游戏论坛.Admin.Area.Index" %>

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
    <form class="form-inline definewidth m20" runat="server">
        分区名称：
        <asp:TextBox ID="Rolename" CssClass="abc input-default" runat="server"></asp:TextBox>&nbsp;&nbsp;
        <asp:Button ID="Query" CssClass="btn btn-primary" runat="server" Text="查询" OnClientClick="return query();" OnClick="Query_Click" style="outline:none;" />&nbsp;&nbsp; 
        <asp:Button ID="AddNew" CssClass="btn btn-success" runat="server" Text="新增分区" OnClick="AddNew_Click" />   
        <table class="table table-bordered table-hover m10" >
            <thead>
                <tr>
                    <th>分区编号</th>
                    <th>分区名称</th>
                    <th>创建时间</th>
                    <th>管理操作</th>
                </tr>
            </thead>
            <tbody>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="Id"  OnEditCommand="DataList1_EditCommand" OnDeleteCommand="DataList1_DeleteCommand" RepeatLayout = "Flow" RepeatDirection="Horizontal" >                   
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("areaName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Datatime") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edit">编辑</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" >删除</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
            </tbody>
        </table>
        <script>

            function query() {
                var Rolename = document.getElementById("<%=Rolename.ClientID%>");
                if (Rolename.value == "" || Rolename.value == null) {
                    return false;
                }
            }

        </script>
    </form>
</body>
</html>
