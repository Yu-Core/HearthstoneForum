<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="游戏论坛.Module" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Src="~/Messagetext.ascx" TagPrefix="uc1" TagName="Messagetext" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <div id="box" runat="server" style="text-align:center;padding:30px 0;position:relative;box-sizing:border-box;">        
        <uc1:Messagetext runat="server" ID="Messagetext" />
        <div id="ap" runat="server"  style="width:1000px;margin:0 auto;position:relative;" >
            <div id="name" style="text-align:left;width:100%;font-size:30px;box-sizing:border-box;padding:20px 0 20px 50px;background-color:white;border:3px solid #b5b4b4;">
                <asp:Label ID="Label1" runat="server" Text="分区名称"></asp:Label>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="page_number" style="width:1000px;height:50px;padding:10px 0;position:relative;box-sizing:border-box;font-size:13px;margin-top:0px;">
                        <div style="width:100px;position:absolute;left:0;bottom:8px">
                            <input type="button" class="newpost" value="发新帖" onclick="newpostclick()" style="width:100px;height:30px;"/>
                        </div>
                        <div style="width:auto;position:absolute;right:120px;bottom:8px;text-align:right;font-size:15px;box-sizing:border-box;padding-right:10px;" >
                            <webdiyer:aspnetpager ID="AspNetPager1" runat="server" CssClass="anpager" CurrentPageButtonClass="cpb" PagingButtonSpacing="0"
                                    Width="570px" ShowPageIndexBox="Always" PageSize="20"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="上一页" NextPageText="下一页"
                                    OnPageChanged="AspNetPager1_PageChanged"
                                    NumericButtonCount="6" Font-Bold="False" 
                                    Font-Names="微软雅黑" ShowDisabledButtons="true">
                            </webdiyer:aspnetpager>
                        </div>
                        <div style="width:100px;position:absolute;bottom:8px;right:0;">
                            <asp:Button ID="Button1" runat="server" Text="返回首页" style="width:100px;height:30px;" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <div id="th" style="width:1000px;border:3px solid #b5b4b4;box-sizing:border-box;font-size:13px;background-color:rgba(255,255,255,0.5);border-bottom:none;">
                        <table style="border:0;border-collapse:collapse;border-spacing:0;">
                            <tr>
                                <td class="md_th" style="width:520px;text-align:left;padding-left:10px;">
                                    <asp:Label ID="Label2" runat="server" Text="标题"></asp:Label>
                                </td>
                                <td class="md_th" style="width:120px;text-align:left;">
                                    <asp:Label ID="Label3" runat="server" Text="作者"></asp:Label>
                                </td>
                                <td class="md_th" style="width:60px;text-align:center;">
                                    <asp:Label ID="Label4" runat="server" Text="回复"></asp:Label>
                                </td>
                                <td class="md_th" style="width:60px;text-align:center;">
                                    <asp:Label ID="Label5" runat="server" Text="浏览"></asp:Label>
                                </td>
                                <td class="md_th" style="width:240px;text-align:right;padding-right:10px;">
                                    <asp:Label ID="Label6" runat="server" Text="最后发表"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="content" style="width:1000px;border:3px solid #b5b4b4;box-sizing:border-box;background-color:white;padding:0 10px 0 10px;font-size:13px;">
                        <table style="border:0;border-collapse:collapse;border-spacing:0;">
                            <tbody>                    
                                <asp:DataList ID = "DataList1" runat = "server" RepeatLayout = "Flow" RepeatDirection="Horizontal" DataKeyField="Id" OnItemCommand="DataList1_ItemCommand" >
                                    <ItemTemplate>
                                        <tr  style="vertical-align: middle;height:50px;border-bottom: 1px solid #b5b4b4;position:relative;" >
                                            <td class="md_td" style="width:514px;text-align:left;">
                                                <asp:Label ID="Title" runat="server" Text='<%# Eval("mName")%>'></asp:Label>
                                            </td>
                                            <td class="md_td" style="width:120px;text-align:left;">
                                                <asp:Label ID="Author" runat="server" Text='<%# Eval("uUsername") %>'></asp:Label>
                                            </td>
                                            <td class="md_td" style="width:60px;text-align:center;">
                                                <asp:Label ID="Reply" runat="server" Text='<%# Eval("CommentNum")%>'></asp:Label>
                                            </td>
                                            <td class="md_td" style="width:60px;text-align:center;">
                                                <asp:Label ID="Browse" runat="server" Text='<%# Eval("Views")%>'></asp:Label>
                                            </td>
                                            <td class="md_td" style="width:110px;text-align:left;box-sizing:border-box;overflow:hidden;white-space: nowrap;">
                                                <asp:Label ID="LastPublishedUser" runat="server" Text='<%# Eval("finaluser")%>' ></asp:Label>
                                            </td>
                                            <td class="md_td" style="width:120px;text-align:right;">
                                                <asp:Label ID="LastPublicationTime" runat="server" Text='<%# ((DateTime)Eval("finaltime")).ToString("yyyy-MM-dd HH:mm")%>'></asp:Label>
                                            </td>
                                            <td style="position:absolute;width:100%;height:50px;display:block;left:0;">
                                                <asp:LinkButton ID="LinkButton1" runat="server" Width="1000px" Height="50px" CommandName="select"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate> 
                                </asp:DataList>
                            </tbody>
                        </table>
                    </div>
                    <div id="page_number2" style="width:1000px;height:50px;padding:10px 0;position:relative;box-sizing:border-box;font-size:13px;">
                        <div style="width:100px;position:absolute;left:0;bottom:8px"">
                            <input type="button" class="newpost" value="发新帖" onclick="newpostclick()" style="width:100px;height:30px;"/>
                        </div>
                        <div style="width:auto;position:absolute;right:120px;bottom:8px;text-align:right;font-size:15px;box-sizing:border-box;padding-right:10px;" >
                            <webdiyer:AspNetPager ID="AspNetPager2" runat="server" CloneFrom="AspNetPager1"></webdiyer:AspNetPager>
                        </div>
                        <div style="width:100px;position:absolute;bottom:8px;right:0;">
                            <asp:Button ID="Button2" runat="server" Text="返回首页" style="width:100px;height:30px;" OnClick="Button1_Click" />
                        </div>
                    </div>
                 </ContentTemplate>
            </asp:UpdatePanel>
            <div id="postbox" style="position:relative;box-sizing:border-box;width:1000px;height:340px;border:3px solid #b5b4b4;text-align:left;box-sizing:border-box;background-color:white;font-size:13px;display:none;">
                <div style="width:997px;height:337px;background-color:rgba(0,0,0,0.05);padding:30px 30px 20px;box-sizing:border-box;">
                    <asp:TextBox ID="m_Name" runat="server" style="width:700px;height:30px;margin-bottom:20px;outline:none;padding-left:5px;" MaxLength="50"></asp:TextBox>
                    <div style="display:none;" >
                        <asp:FileUpload ID="FileUpload1"  runat="server" />            
                    </div>
                    <input type="button" id="SelectImg" value="添加图片" style="margin-left:30px;margin-right:10px" />
                    <div style="position:absolute;right:25px;top:40px;width:110px;overflow:hidden;white-space: nowrap;text-overflow:ellipsis;">
                        <asp:Label ID="ImgPath" runat="server" Text="" style=""></asp:Label>
                    </div>
                    <asp:TextBox ID="m_Content" runat="server" Height="176px" Width="100%"  TextMode="MultiLine"  Font-Names="Microsoft YaHei UI" Font-Size="15px" MaxLength="1000" style="overflow-y:visible;resize:none;outline:none;background-color:rgba(255,255,255,0.9);border-radius:5px;padding:10px;box-sizing:border-box;"  ></asp:TextBox>
                    <div style="position:absolute;bottom:90px;right:40px;">
                        <asp:Label ID="wordnumber" runat="server" Text="1000" Font-Size="15px"></asp:Label>
                    </div>
                    <div style="position:relative;height:30px;margin-top:20px;">
                        <div style="position:absolute;height:30px;bottom:0;left:0;">
                            <asp:Button ID="Publish" runat="server" Text="发表" style="width:80px;height:30px;" Enabled="False" OnClick="Publish_Click" />
                        </div>
                        <div style="position:absolute;height:30px;bottom:0;right:0;">
                             <input id="cancel" type="button" value="取消" onclick="cancelclick()" style="width:80px;height:30px;" />
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <script defer="defer">
        var postbox = document.getElementById("postbox");
        var m_Content = document.getElementById("<%=m_Content.ClientID%>");
        var m_Name = document.getElementById("<%=m_Name.ClientID%>");
        var wordnumber = document.getElementById("<%=wordnumber.ClientID%>");
        var Publish = document.getElementById("<%=Publish.ClientID%>");
        var strSession = '<%=Session["uId"]%>';
        function cancelclick() {
            SelectImg.innerHTML = '添加图片';
            m_Name.value = '';
            m_Content.value = '';
            postbox.style.display = "none";
            wordnumber.innerHTML = 1000;
            Publish.disabled = 'disabled';
        }
        
        function newpostclick() {
            if (strSession == "") {
                Swal.fire({
                    title: '提示',
                    text: '请先登录',
                    confirmButtonText: '确定'
                }).then(function (isConfirm) {
                    try {
                        //判断 是否 点击的 确定按钮
                        if (isConfirm.value) {
                            location = 'Login.aspx';
                        }
                        else {

                        }
                    } catch (e) {
                        alert(e);
                    }
                });
            }
            else {
                if (postbox.style.display == "none") {
                    postbox.style.display = "block";
                    document.querySelector('#postbox').scrollIntoView(false);
                }
            }
        }
        m_Content.onkeyup = function () {
            if (m_Content.value == '' || m_Name.value == '') {
                Publish.disabled = 'disabled';
            }
            else {
                Publish.disabled = '';
            }
            maxlength = 1000;
            if (m_Content.value.length > maxlength) {
                m_Content.value = m_Content.value.substring(0, maxlength);
            }
            wordnumber.innerHTML = 1000 - m_Content.value.length;
        };
        m_Name.onkeyup = function () {
            if (m_Content.value == '' || m_Name.value == '') {
                Publish.disabled = 'disabled';
            }
            else {
                Publish.disabled = '';
            }
        };
        m_Content.onblur = function () {
            m_Content.value = replaceStr(m_Content.value);
        };
        m_Name.onblur = function () {
            m_Name.value = replaceStr(m_Name.value);
        };

        var SelectImg = document.getElementById("SelectImg");
        var fu = document.getElementById("<%=FileUpload1.ClientID%>");
        var ImgPath = document.getElementById("<%=ImgPath.ClientID%>");
        SelectImg.onclick = function () {
            fu.click();
        }

        function CheckFile(str) {
            var strRegex = "(.jpg|.JPG|.jpeg|.JPEG|.gif|.GIF|.png|.PNG)$"; //用于验证图片扩展名的正则表达式
            var re = new RegExp(strRegex);
            if (re.test(str)) {
                
                ImgPath.innerText = fu.files[0].name;
                SelectImg.value = '已选择';
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
                SelectImg.value = '添加图片';
                return (false);
            }
        }
        function replaceStr(a) {
            a = a.replace(/\</g, "")
                .replace(/\>/g, "")
                .replace(/\&/g, "")
                .replace(/\"/g, "")
                .replace(/\'/g, "");
            return a;
        }
        
    </script>
</asp:Content>
