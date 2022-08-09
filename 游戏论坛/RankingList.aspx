<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RankingList.aspx.cs" Inherits="游戏论坛.RankingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .col-rank{
            text-align: center;
            color: #f8f2e6;
            font-size: 18px;
            max-width: 150px;
            min-width: 100px;
            height:39px;
            background:url(/images/col-rank.png) 50% no-repeat;
            font-weight: 700;
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            padding:8px 0;
            text-shadow: #000 2px 0 0, #000 1.75517px 0.95885px 0, #000 1.0806px 1.68294px 0, #000 0.14147px 1.99499px 0, #000 -0.83229px 1.81859px 0, #000 -1.60229px 1.19694px 0, #000 -1.97998px 0.28224px 0, #000 -1.87291px -0.70157px 0, #000 -1.30729px -1.5136px 0, #000 -0.42159px -1.95506px 0, #000 0.56732px -1.91785px 0, #000 1.41734px -1.41108px 0, #000 1.92034px -0.55883px 0;
         }
        .col-battletag{
            flex: 2;
            font-size: 18px;
            min-width: 120px;
            max-width: 200px;
            color: #614326;
            padding:8px 0;
        }
        .row{
            border-bottom: 1px solid #caae85;
        }
        .row:nth-child(2) {
            border-top: 1px solid #caae85;
        }
        .row:nth-child(2n) {
            background: rgba(97,67,38,.1);
        }
        .row:nth-child(odd) {
            background-color: transparent;
        }
    </style>
    <div style="text-align:center" >
        <div style="margin:0 auto;width:1024px;" >
            <div class="metadata" style="padding: 50px 0 37px;" >
                <h2 style="color:#614326;font-size:39px;padding: 0 40px;margin-top: .15em; margin-bottom: .15em;">200强 - <span class="rank-type-txt">标准模式</span></h2>
                <p style="font-size:16px;font-weight:600;margin: 20px 0;padding: 0 40px;">以下是在<span class="rank-type-txt">标准模式</span>中排名前200名的玩家。</p>
                <asp:Label ID="Updatatime" runat="server" Text="Label" style="font-weight: 600;font-size: 16px;color: #624427;opacity: .6;width: 100%;text-align: center;}" ></asp:Label>
            </div>
            <table style="border:0;border-collapse:collapse;" >
                <thead>
                    <tr >
                        <th style="min-width: 100px;text-align: center;max-width: 150px;font-weight: 600;color: #614326;height: 43px;font-size: 15.5px;padding-bottom: 20px;" >
                            排名
                        </th>
                        <th style="min-width: 150px;text-align: center;max-width: 200px;font-weight: 600;color: #614326;height: 43px;font-size: 15.5px;padding-bottom: 20px;">
                            战网昵称
                        </th>
                        <th style="width:100%" >

                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <tr class="row">
                                <td class="col-rank" >
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Rank") %>'></asp:Label>
                                </td>
                                <td class="col-battletag" >
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("BattleTag") %>'></asp:Label>
                                </td>
                                <td>

                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </tbody>
            </table>

        </div>
    </div>
</asp:Content>
