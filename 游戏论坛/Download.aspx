<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="游戏论坛.Download" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <style>
        audio{
            display:none;
        }
        a:active + audio{
            display:block;
        }
        #box table tr td:first-child{
            width:50%;text-align:right;
            padding-right:80px
        }
        #box table tr td:last-child{
            text-align:left;
            padding-left:8px
        }
        a img {
            width:185px;
            height:54px;
        }
    </style>
    <div style="text-align:center;font-size:30px;font-family:'Microsoft YaHei';color:#623E20;">
        
        <div id="box"  style="margin:0 auto;width:800px;margin-top:50px;box-sizing:border-box;padding:30px 0;">
            <table id="download" style="width:100%" runat="server">
                
            </table>
        </div>
        <audio controls='controls' hidden="hidden"  src='Music/download-complete.wav'></audio>
        
    </div>
    <script>
        function sound() {
            var abc = document.getElementsByTagName("audio")[0];
            abc.play();
        }


    </script>
</asp:Content>
