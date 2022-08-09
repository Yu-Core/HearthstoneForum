<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AllNotice.aspx.cs" Inherits="游戏论坛.AllNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="box" style="text-align: center; padding: 30px 0; position: relative; box-sizing: border-box;">
        <div id="ap" runat="server" style="width: 1000px; margin: 0 auto; position: relative;">
            <div id="name" style="text-align: left; width: 100%; font-size: 30px; box-sizing: border-box; padding: 20px 0 20px 50px; background-color: white; border: 3px solid #b5b4b4;">
                <asp:Label ID="Label1" runat="server" Text="论坛公告"></asp:Label>
            </div>
            <div id="content" style="width: 1000px; border: 3px solid #b5b4b4; box-sizing: border-box; background-color: white; padding: 0 10px 0 10px; font-size: 13px;">
                <table style="border: 0; width: 100%; border-collapse: collapse; border-spacing: 0;">
                    <tbody>
                        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="Id" OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>
                                <tr style="vertical-align: middle; height: 50px; border-bottom: 1px solid #b5b4b4; position: relative;">
                                    <td class="md_td" style="width: 70%; text-align: left;">
                                        <asp:Label ID="Title" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                    </td>
                                    <td class="md_td" style="width: 30%; text-align: right;">
                                        <asp:Label ID="Time" runat="server" Text='<%# ((DateTime)Eval("Datatime")).ToString("yyyy/MM/dd") %>'></asp:Label>
                                    </td>
                                    <td style="position: absolute; width: 100%; height: 50px; display: block; left: 0;">
                                        <asp:LinkButton ID="LinkButton1" runat="server" Width="1000px" Height="50px" CommandName="select"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:DataList>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</asp:Content>
