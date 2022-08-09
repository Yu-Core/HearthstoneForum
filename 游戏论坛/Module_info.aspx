<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Module_info.aspx.cs" Inherits="游戏论坛.Module_info" %>

<%@ Register Src="~/Messagetext.ascx" TagPrefix="uc1" TagName="Messagetext" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
   
    
    <div id="commentbox" runat="server" style="position:fixed;width:1000px;background-color:rgba(0,0,0,0.5);left:260.5px;bottom:100px;z-index:1000;box-sizing:border-box;padding:20px;border-radius:10px;display:none;">
        <div style="position:relative;height:180px;border-radius:5px;">
            <asp:TextBox ID="c_content" runat="server" Height="176px" Width="100%"  TextMode="MultiLine" BorderStyle="None" BorderWidth="0px" Font-Names="Microsoft YaHei UI" Font-Size="15px" MaxLength="500" style="overflow-y:visible;resize:none;outline:none;background-color:rgba(255,255,255,0.9);border-radius:5px;padding:10px;box-sizing:border-box;"  ></asp:TextBox>
            <div style="position:absolute;bottom:5px;right:10px;">
                <asp:Label ID="Label3" runat="server" Text="500" Font-Size="15px"></asp:Label>
            </div>
        </div>
        <div style="position:relative;height:30px;">
            <div style="position:absolute;height:20px;bottom:0;left:0;">
                <asp:Button ID="Publish" runat="server" Text="发表" Width="70px" style="border-radius:3px;" BorderStyle="None" OnClick="Publish_Click" Enabled="False" />
            </div>
            <div style="position:absolute;height:20px;bottom:0;right:0;">
                 <input id="cancel" type="button" value="取消" onclick="cancelclick()" style="width:70px;border-radius:3px;border:none;" />
            </div>
        </div>
     </div>
    <div id="box" runat="server" style="text-align:center;padding:30px 0;position:relative;">        
        <uc1:Messagetext runat="server" ID="Messagetext" />
        
        <div id="ap" runat="server"  style="width:1000px;margin:0 auto;position:relative;z-index:1;" >
            <div id="backtop" style="position:fixed;bottom:100px;width:1000px;text-align:right;padding-right:50px;box-sizing:border-box;z-index:1050;display:none;">
                <input type="button" value="回到顶部" onclick="backtoponclick()" style ="width:90px;height:40px;font-size:15px;border-radius:5px;cursor:pointer;outline:none;border:1px solid black;"/>
            </div>
            <div id="fixComment" style="position:fixed;bottom:50px;width:1000px;text-align:right;padding-right:50px;box-sizing:border-box;z-index:1050;display:none;">
                <input type="button" value="我要评论" onclick="showhide()" style ="width:90px;height:40px;font-size:15px;border-radius:5px;cursor:pointer;outline:none;border:1px solid black;"/>
            </div>
            
            <div id="name" style="text-align:center;width:100%;background-color:white;font-size:30px;border:3px solid #b5b4b4;padding:20px 0;box-sizing:border-box;">
               <asp:Label ID="m_Name" runat="server" Text="帖子名称"></asp:Label>
            </div>
            <div id="page_number" style="width:1000px;height:50px;padding:10px 0;position:relative;box-sizing:border-box;font-size:13px;margin-top:0px;">
                <div style="width:100px;position:absolute;left:0;bottom:8px">
                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>--%>
                                    <asp:Button ID="Report" runat="server" Text="举报" OnClientClick="return session();" OnClick="Report_Click" style="width:100px;height:30px;" />
                                <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
                <div style="width:100px;position:absolute;right:0;bottom:8px">
                    <asp:Button ID="BackList" runat="server" Text="返回列表" OnClick="BackList_Click" style="width:100px;height:30px;" />
                </div>
            </div>
            <div id="m_ap"  style="width:100%;background-color:white;position:relative;border:2px solid #b5b4b4;box-sizing:border-box;">
                <div id="m_lp" style="width:120px;height:auto;text-align:center;position:absolute;left:0;top:0;box-sizing:border-box;padding:20px 0 0 20px;">
                    <div style="width:100px;height:100px;position:relative;">
                        <asp:Image ID="HeadImage" runat="server" CssClass="round_icon" Width="100px" Height="100px" ImageUrl="~/images/logo_hearthstone.png" />
                    </div>
                    <div style="margin:0 auto;width:85px;box-sizing:border-box;padding-top:10px;">
                        <asp:Button ID="follow" runat="server" Text="关注" BorderStyle="None" Width="50px" Visible="False" />
                    </div>
                    <div style="width:auto;height:25px;font-size:16px;text-align:center;overflow:hidden;white-space: nowrap;margin-top:10px;">
                            <asp:Label ID="m_username" runat="server"></asp:Label>
                        </div>
                </div>
                <div id="m_rp" style="width:870px;height:100%;position:relative;left:120px;top:0;padding-top:40px;">
                    <div style="width:100%;box-sizing:border-box;padding:10px 45px 10px 25px;text-align:left;margin-bottom:40px;word-wrap:break-word">
                       
                        <asp:TextBox ID="m_Content" runat="server" TextMode="MultiLine" readonly="true" autoHeight="true" style="width:100%;font-size:15px;font-family:'Microsoft YaHei';color:black;resize:none;border:none;outline:none;background-color:white;" Enabled="False" ></asp:TextBox>
                        <br />
                        <asp:Image ID="m_Image" runat="server" style="max-height:300px" />
                    </div>
                    <div style="width:100%;height:50px;position:relative;">
                        <div style="width:auto;height:20px;position:absolute;left:25px;bottom:20px;">
                            <asp:Label ID="datetime" runat="server" Text="1999/11/20 00:30:00" Font-Size="15px" ForeColor="#666666"></asp:Label>
                        </div>
                        <div style="height:20px;position:absolute;bottom:20px;left:200px;">
                            <asp:Button ID="M_Delete" runat="server" Text="删除" style="border:none;background-color:transparent;outline:none;cursor: pointer;" OnClick="Delete_Click" Visible="False"  />
                        </div>
                        <div id="sanlian"  style="width:auto;height:auto;position:absolute;right:30px;bottom:10px;">  
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" Width="30px" ImageUrl="~/images/likes.png" CssClass="outline" OnClientClick="return session();" OnClick="ImageButton1_Click" />
                                    <asp:Label ID="Likes" runat="server" Text="0"></asp:Label>
                                    <input type="image" onclick="showhide()"  style="width:30px;height:30px;outline:none;" src="images/comment.png"  />
                                    <asp:Label ID="Comment" runat="server" Text="0"></asp:Label>
                                    <asp:ImageButton ID="ImageButton3" runat="server" Height="30px" Width="30px" ImageUrl="~/images/collection.png" CssClass="outline" OnClientClick="return session();" OnClick="ImageButton3_Click" />
                                    <asp:Label ID="Collection" runat="server" Text="0"></asp:Label> 
                                </ContentTemplate>
                            </asp:UpdatePanel>
                                                             
                        </div>
                        
                    </div>
                </div>
            </div>
            <div id ="c_ap" runat="server" style="width:100%;background-color:white;position:relative;border:2px solid #b5b4b4;margin-top:20px;box-sizing:border-box;padding:10px 0 20px;">
                <table style="width:1000px;border:0;border-collapse:collapse;">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" OnItemCommand="DataList1_ItemCommand" RepeatLayout = "Flow" RepeatDirection="Horizontal" >
                        <ItemTemplate>
                        
                                <tr>
                                    <td style="width:110px;height:auto;text-align:center;padding-top:25px;padding-left:10px;box-sizing:border-box;vertical-align:top;">
                                        <div style="width:60px;height:60px;margin:0 auto;position:relative;">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/HeadImage/"+Eval("Imagefile") %>' CssClass="round_icon" Height="70px" Width="70px" />
                                            </div>
                                    </td>
                                    <td style="width:880px;height:100%;position:relative;border-bottom:1px solid #cccaca">
                                        <div style="width:100%;height:60px;position:relative;">
                                            <div style="position:absolute;left:10px;top:25px;width:auto;height:20px;font-size:13.5px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("uUsername") %>'></asp:Label>
                                            </div>
                                        </div>
                                        <div style="width:100%;padding:0px 45px 0px 10px;box-sizing:border-box;text-align:left;font-size:15px;margin-bottom:10px;word-break:break-word;">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Convert.ToString(Eval("Matter")).Replace("\r\n", "<br>") %>'></asp:Label>
                                        </div>
                                        <div style="width:100%;height:30px;position:relative;">
                                            <div style="width:auto;height:20px;position:absolute;left:5px;padding-left:5px;">
                                                <asp:Label ID="datetime" runat="server" Text='<%# TimeDifference((DateTime)Eval("Datatime")) %>' Font-Size="13px" ForeColor="#666666"></asp:Label>
                                            </div>
                                            <div style="width:50px;height:20px;position:absolute;left:200px;">
                                                <asp:Button ID="C_Delete" runat="server" Text="删除"  Visible='<%# Eval("uId").ToString() == Convert.ToString(Session["uId"])?true:false %>'  BorderStyle="None" BackColor="Transparent" style="outline:none;cursor: pointer;" CommandName="select" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                        
                        </ItemTemplate>
                    </asp:DataList>
                </table>  
            </div>
        </div>
    </div>
    
    <script defer="defer">
        
        //判断是否登录
        function session() {
            var strSession = '<%=Session["uId"]%>';

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
                    } catch (e) {
                        alert(e);
                    }
                });
                return false;
            }
        }

        function showhide() {
            
            var commentbox = document.getElementById("<%=commentbox.ClientID%>");
            var strSession = '<%=Session["uId"]%>';

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
                    } catch (e) {
                        alert(e);
                    }
                });
            }
            else {
                if (commentbox.style.display == "none") {
                    commentbox.style.display = "block";
                }
                else {
                    commentbox.style.display = "none";
                }                 
            }
           
        }
        function cancelclick() {
            var commentbox = document.getElementById("<%=commentbox.ClientID%>"); 
            var c_content = document.getElementById("<%=c_content.ClientID%>");
            var wordnumber = document.getElementById("<%=Label3.ClientID%>");
            var Publish = document.getElementById("<%=Publish.ClientID%>");
            c_content.value = '';
            commentbox.style.display = "none";
            wordnumber.innerHTML = 500;
            Publish.disabled = 'disabled';
        }
        //回到顶部
        function backtoponclick() {
            document.querySelector('body').scrollIntoView(true);

        }
        function getOffsetTop(obj) {
            var offsetTop = 0;
            while (obj != window.document.body && obj != null) {
                offsetTop += obj.offsetTop
                obj = obj.offsetParent
            }
            return offsetTop;
        }
        

        window.onload = function () {
            var c_content = document.getElementById("<%=c_content.ClientID%>");
            var Publish = document.getElementById("<%=Publish.ClientID%>");
            var wordnumber = document.getElementById("<%=Label3.ClientID%>");
            c_content.onkeyup = function () {
                if (c_content.value == '') {
                    Publish.disabled = 'disabled';
                }
                else {
                    Publish.disabled = '';
                }
                maxlength = 500;
                if (c_content.value.length > maxlength) {
                    c_content.value = c_content.value.substring(0, maxlength);
                }
                wordnumber.innerHTML = maxlength - c_content.value.length;   
            };
            c_content.onblur = function () {
                c_content.value = replaceStr(c_content.value);
            }
            
            
            window.onscroll = function () {
                var top = document.getElementById("sanlian");
                var pageheight = document.body.scrollHeight;
                var scrollTops = document.documentElement.scrollTop;
                var bottom = document.getElementById("bottom");
                var fixComment = document.getElementById("fixComment");
                var backtop = document.getElementById("backtop");
                if (scrollTops > getOffsetTop(top) && scrollTops + 0.75 * bottom.offsetHeight < pageheight - bottom.offsetHeight) {
                    fixComment.style.display = "block";
                    backtop.style.display = "block";
                }
                else {
                    fixComment.style.display = "none";
                    backtop.style.display = "none";
                }
            }
        }
        $(function () {
            $.fn.autoHeight = function () {
                function autoHeight(elem) {
                    elem.style.height = 'auto';
                    elem.scrollTop = 0; //防抖动
                    elem.style.height = elem.scrollHeight + 'px';
                }
                this.each(function () {
                    autoHeight(this);
                    $(this).on('keyup', function () {
                        autoHeight(this);
                    });
                });
            }
            $('textarea[autoHeight]').autoHeight();
        })

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
