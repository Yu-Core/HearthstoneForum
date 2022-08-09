<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Messagetext.ascx.cs" Inherits="游戏论坛.Messagetext" %>
<div id="messagetext" runat="server" style="position:absolute;width:586px;height:120px;margin:0 auto;top:80px;left:0;right:0;background-color:rgba(0,0,0,0.5);display:none;border-radius:15px;z-index:999;">            
    <div style="margin:0 auto;width:400px;position:relative;top:35px;font-size:18px;color:white;">
        抱歉，指定的主题不存在或已被删除或正在被审核
    </div>
    <div style="margin:0 auto;width:400px;position:relative;top:45px;font-size:18px;text-align:center;">
        <asp:LinkButton ID="LinkButton1" runat="server" Text="【点击这里返回上一页】" Font-Underline="False" ForeColor="#6699FF"  PostBackUrl="javascript:history.back()"></asp:LinkButton>
    </div>
</div>