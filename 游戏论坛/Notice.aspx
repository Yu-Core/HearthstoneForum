<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="游戏论坛.Notice" %>

<%@ Register Src="~/Messagetext.ascx" TagPrefix="uc1" TagName="Messagetext" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="box" runat="server" style="width:100%;text-align:center;position:relative;padding:30px 0;" >
        <div id="ap" runat="server"  style="width:1000px;position:relative;margin:0 auto;padding-bottom:60px;background-color:white;border-radius:5px;border:3px solid #b5b4b4;">
            <div style="position:relative;margin:0 auto;width:725px;height:100%;box-sizing:border-box;padding-top:70px;font-family: '微软雅黑',Arial,Tahoma,Sans-Serif;">
                <div style="height:30px;width:100%;text-align:center;">
                        <asp:Label ID="Label1" runat="server"  Font-Bold="True" Font-Size="33px"></asp:Label>
                </div>
                <div style="width:100%;word-break:break-all;word-wrap:break-word;margin-top:90px;text-align:left;">
                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="18px"></asp:Label>
                </div>
            </div>
                
        </div>
        <uc1:Messagetext runat="server" ID="Messagetext" />
    </div>
</asp:Content>
