<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="游戏论坛.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Css/StyleSheet1.css" rel="stylesheet" />
    <link href="Css/StyleSheet2.css" rel="stylesheet" />
    <link href="Css/StyleSheet3.css" rel="stylesheet" />
    <link href="Css/sweetalert2.css" rel="stylesheet" />
    <script src="scripts/sweetalert2.min.js"></script>
    <style>
       
    </style>
</head>
<body style="margin: 0px 0px 0px 0px;">
    <form runat="server">
        <table>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>
                    <tr>
                        <td style="width:70%;height:20px;">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title").ToString() %>'></asp:Label>
                        </td>
                        <td style="width:30%;height:20px;">
                            <asp:Label ID="Label2" runat="server" Text='<%# ((DateTime)Eval("Datatime")).ToString("yyyy/MM/dd") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </table>


    </form>


</body>

</html>
