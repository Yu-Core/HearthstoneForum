<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PersonalCenter.aspx.cs" Inherits="游戏论坛.PersonalCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            overflow: hidden;
            height: 40px;
        }
        .auto-style3 {
            height: 40px;
        }
        .delete:hover{
            background-color:rgba(255,255,255,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    
    
    <div style="text-align:center;font-family: PingFangSC-Regular!important;" >
        <div id="ap" style="margin:0 auto;width:1310px;position:relative;margin-top:30px;">

            <div id="lp" style="position:relative;left:0;top:0;width:300px;height:620px;background-color:white;border-radius:5px;box-sizing:border-box;padding:50px 0px 0 30px;z-index:1;color:#555666" >
                
                <div style="height:80px;width:auto;padding:0px 10px;box-sizing:border-box;text-align:left;display:table-cell;vertical-align:middle;overflow:hidden;white-space: nowrap;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"  >
                        <ContentTemplate>
                            <asp:Image ID="Image1" runat="server" Height="80px" Width="80px" ImageAlign="Middle" style="border-radius:50%;border: 2px solid #fff;box-shadow: 0 0 10px 2px rgba(0,0,0,0.06);" />
                            <asp:Label ID="Label1" runat="server" Text="你的用户名" Font-Size="20px" style="margin-left:20px;" ForeColor="#222226" Width="140px"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div style="height:24px;margin-top:36px;font-size:18px;text-align:left;box-sizing:border-box;padding-left:20px;color:black;">
                    基本信息
                </div>
                <div style="height:auto;width:auto;box-sizing:border-box;padding:20px 25px;box-sizing:border-box;font-size:14px;">
                    <table style="border:0;border-collapse:collapse;width:auto;text-align:left;">
                        <tr>
                            <td style="height:35px;">
                                编号:<asp:TextBox ID="id" runat="server" CssClass="pc_TB" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                昵称:<asp:TextBox ID="username" runat="server" CssClass="pc_TB" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                密码:<asp:TextBox ID="password" runat="server" CssClass="pc_TB" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                性别:<asp:DropDownList ID="DropDownList1" runat="server" CssClass="pc_TB" Enabled="False">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                邮箱:<asp:TextBox ID="email" runat="server" CssClass="pc_TB" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                头像:<asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" CssClass="pc_TB" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                姓名:<asp:TextBox ID="uname" runat="server" CssClass="pc_TB" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height:35px;">
                                手机:<asp:TextBox ID="phone" runat="server" CssClass="pc_TB" Enabled="False" MaxLength="11"  ></asp:TextBox>
                            </td>
                        </tr>
                        

                    </table>
                    <div style="position:relative;left:0;top:0;margin-top:30px;text-align:center;" >
                        <div style="margin:0 auto;box-sizing:border-box;padding:0 90.5px;">
                            <input id="edit" type="button" value="编辑" style="background-color:transparent;border:none;color:#409EFF;outline:none;" />
                        </div>
                        <div id="modified"  style="position:absolute;width:100%;height:100%;left:0;top:50px;display:none;z-index:999">
                            <div style="position:absolute;left:0;bottom:0;" class="pc_preservation">
                                <asp:Button ID="Button2"  runat="server" Text="保存" Width="82px" OnClientClick="return checking();" OnClick="Button2_Click" BorderStyle="None" ForeColor="White" Height="32px" style="cursor: pointer;border-radius:20px;outline:none;" />
                            </div>
                            <div style="position:absolute;right:0;bottom:0;" class="pc_cancel">
                               <input id="cancel" type="button" value="取消" style="width:82px;height:32px;color:red;background-color:white;border:1px solid red;cursor: pointer;border-radius:20px;outline:none;" />
                            </div>                            
                        </div>
                    </div>
                </div>               
            </div>
            <div id="rp" style="position:absolute;right:0;top:0;width:1000px;height:620px;">                
                        <div style="height:100px;background-color:white;border-radius:5px;box-sizing:border-box;">
                            <ul style="height:100px;margin:0;">
                                <li class="pc_li">
                                    <asp:Button ID="Button3" runat="server" Text="浏览历史" CssClass="pc_btn" style="border-bottom: 3px solid red;" OnClick="Button3_Click" BackColor="Transparent" Font-Size="18px" BorderStyle="None" Height="70px" />
                                </li>
                                <li class="pc_li">
                                    <asp:Button ID="Button4" runat="server" Text="最近点赞" CssClass="pc_btn" style="border-bottom: 3px solid #c8c5c5;" OnClick="Button4_Click" BackColor="Transparent" Font-Size="18px" BorderStyle="None" Height="70px" />
                                </li>
                                <li class="pc_li">
                                    <asp:Button ID="Button5" runat="server" Text="我的帖子" CssClass="pc_btn" style="border-bottom: 3px solid #c8c5c5;" OnClick="Button5_Click" BackColor="Transparent" Font-Size="18px" BorderStyle="None" Height="70px" />
                                </li>
                                <li class="pc_li">
                                    <asp:Button ID="Button6" runat="server" Text="我的收藏" CssClass="pc_btn" style="border-bottom: 3px solid #c8c5c5;" OnClick="Button6_Click" BackColor="Transparent" Font-Size="18px" BorderStyle="None" Height="70px" />
                                </li>
                                <li class="pc_li" style="float:right;width:290px;margin-right:40px;padding-top:35px;box-sizing:border-box;position:relative;">
                                    <asp:TextBox ID="Sou" runat="server" Height="40px" Width="290px" BackColor="#F5F6F7"  BorderColor="#CCCCCC" placeholder="搜索" style="padding-left:15px;padding-right:50px;box-sizing:border-box;font-size:15px;outline:none;border-radius:5px;" MaxLength="50"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server" style="position:absolute;width:40px;height:40px;right:0;" ImageUrl="~/images/sou.png" OnClientClick="return query();" OnClick="ImageButton1_Click" />
                                </li>
                            </ul>
                        </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div  style="margin-top:5px;height:515px;position:relative;background-color:white;border-radius:5px;box-sizing:border-box;overflow:auto;">
                            <div id="Browsing_history" style="position:absolute;width:100%;height:100%;top:0;left:0;box-sizing:border-box;padding:20px;">
                                <table style="width:100%;border:0;border-collapse:collapse">
                                    <tbody>
                                        <asp:DataList ID="DataList1" runat="server" DataKeyField="mId" OnEditCommand="DataList1_EditCommand"  OnDeleteCommand="DataList1_DeleteCommand"  RepeatLayout = "Flow" RepeatDirection="Horizontal" Caption="History">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="height:41px;width:100%;border-bottom:1px solid #CCCCCC;padding:10px;box-sizing:border-box;overflow:hidden;white-space: nowrap;text-align:left;">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edit" Font-Underline="False" Text='<%# Eval("mName") %>' CssClass="blackcolor" Font-Size="14px" Width="100%">LinkButton</asp:LinkButton>
                                                    </td>
                                                    <td class="delete" style="border-bottom:1px solid #CCCCCC;padding:10px;box-sizing:border-box;">
                                                        
                                                        <input type="image" onclick="dele(this)" src="images/delete.png" style="width:15px;height:15px;outline:none;" />
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Button ID="Button1" CssClass="pc_btn_delete" runat="server" Text="删除" CommandName="delete" style="display:none;" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="Button5" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="Button6" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                

            </div>
         </div>
    </div>
    <script src="scripts/jquery-1.7.2.min.js"></script>
    <script>
        $(".pc_btn").click(function () {
            $(".pc_btn").css('borderBottom','3px solid #c8c5c5');
            $(this).css('borderBottom', '3px solid red');
        })
    </script>
    <script>
        var username = document.getElementById("<%=username.ClientID%>");
        var password = document.getElementById("<%=password.ClientID%>");
        var sex = document.getElementById("<%=DropDownList1.ClientID%>");
        var email = document.getElementById("<%=email.ClientID%>");
        var head = document.getElementById("<%=DropDownList2.ClientID%>");
        var uname = document.getElementById("<%=uname.ClientID%>");
        var phone = document.getElementById("<%=phone.ClientID%>");
        var edit = document.getElementById('edit');
        var preserve = document.getElementById("<%=Button2.ClientID%>");
        var headimg = document.getElementById("<%=Image1.ClientID%>");
        var cancel = document.getElementById('cancel');
        var modified = document.getElementById('modified');
        var usernamereg = /^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
        var passwordreg = /^[A-Za-z0-9]{5,17}$/;
        var emailreg = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
        var unamereg = /^[\u4e00-\u9fa5]{2,}$/;
        var phonereg = /^1[0-9]{10}$/;
        var valuemap = {};
        valuemap[2] = username.value;
        valuemap[3] = password.value;
        valuemap[4] = sex.value;
        valuemap[5] = email.value;
        valuemap[6] = head.value;
        valuemap[7] = uname.value;
        valuemap[8] = phone.value;
        valuemap[9] = headimg.src;
            
        username.onblur = function () {
            if (!usernamereg.exec(username.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的用户名格式',
                    showConfirmButton: false,
                    timer: 1500
                });
                //   preserve.disabled = 'disabled';
            }
            //else {
            //    preserve.disabled = '';
            //}
        }
        password.onblur = function () {
            if (!passwordreg.exec(password.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的密码格式',
                    showConfirmButton: false,
                    timer: 1500
                });
            //    preserve.disabled = 'disabled';
            }
            //else {
            //    preserve.disabled = '';
            //}
        }
        email.onblur = function () {
            if (!emailreg.exec(email.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的邮箱',
                    showConfirmButton: false,
                    timer: 1500
                });
            //    preserve.disabled = 'disabled';
            }
            //else {
            //    preserve.disabled = '';
            //}
        }
        uname.onblur = function () {
            if (!unamereg.exec(uname.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的姓名',
                    showConfirmButton: false,
                    timer: 1500
                });
                //   preserve.disabled = 'disabled';
            }
            //else {
            //    preserve.disabled = '';
            //}
        }
        phone.onblur = function () {
            if (!phonereg.exec(phone.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的手机号',
                    showConfirmButton: false,
                    timer: 1500
                });
            //    preserve.disabled = 'disabled';
            }
            //else {
            //    preserve.disabled = '';
            //}
        }
            
        edit.onclick = function () {
            modified.style.display = 'block';
            edit.style.display = 'none';
            username.disabled = '';
            password.disabled = '';
            sex.disabled = '';
            email.disabled = '';
            head.disabled = '';
            uname.disabled = '';
            phone.disabled = '';
        }
        cancel.onclick = function () {
            modified.style.display = 'none';
            edit.style.display = 'block';
            username.disabled = 'disabled';
            password.disabled = 'disabled';
            sex.disabled = 'disabled';
            email.disabled = 'disabled';
            head.disabled = 'disabled';
            uname.disabled = 'disabled';
            phone.disabled = 'disabled';

            username.value = valuemap[2];
            password.value = valuemap[3];
            sex.value = valuemap[4];
            email.value = valuemap[5];
            head.value = valuemap[6];
            uname.value = valuemap[7];
            phone.value = valuemap[8];
            var headimg2 = document.getElementById("<%=Image1.ClientID%>");
            headimg2.src = valuemap[9];
        }

        function checking() {
            if (!usernamereg.exec(username.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的用户名格式',
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }
            if (!passwordreg.exec(password.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的密码格式',
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }
            if (!emailreg.exec(email.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的邮箱',
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }
            if (!unamereg.exec(uname.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的姓名',
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }
            if (!phonereg.exec(phone.value)) {
                Swal.fire({
                    icon: 'warning',
                    title: '提示',
                    text: '请输入正确的手机号',
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }
        } 
        function dele(obj) {    //传值
            $(obj).next().children(".pc_btn_delete").click();
            var Row = obj.parentNode;
            while (Row.tagName.toLowerCase() != "tr") {
                Row = Row.parentNode;
            }
            Row.parentNode.removeChild(Row); //删除行
            Swal.fire({
                icon: 'success',
                title: '提示',
                text: '删除成功',
                showConfirmButton: false,
                timer: 1000
            });
        }
        function query() {
            var Rolename = document.getElementById("<%=Sou.ClientID%>");
            if (Rolename.value == "" || Rolename.value == null) {
                return false;
            }
        }
    </script>
</asp:Content>
