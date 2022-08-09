<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs"  Inherits="游戏论坛.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>  
    <div style="margin-top:30px;text-align:center;">
        <div style="width:600px;margin:auto;">
            <table border="0"   style="width:600px;border-collapse:collapse;">
                <tr>
                    <td class="register" style="text-align:center;font-size:20px;font-family:Tahoma;padding-bottom:10px;">
                        <asp:Label ID="Label10" runat="server" Text="注册条款" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="register">
                        <asp:Label ID="Label1" runat="server" Text="1、遵守中国有关的法律和法规。不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。不得利用本网络服务系统进行任何不利于本网站的行为。"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="register">
                        <asp:Label ID="Label2" runat="server" Text="2、遵守所有与网络服务有关的网络协议、规定和程序。"></asp:Label>
                    </td>
                </tr>
                    <tr>
                    <td class="register">
                        <asp:Label ID="Label3" runat="server" Text="3、不干扰或混乱网络服务。"></asp:Label>
                        </td>
                </tr>
                <tr>
                <td class="register">
                    <asp:Label ID="Label4" runat="server" Text="4、不得为任何非法目的而使用本网络服务系统。"></asp:Label>
                    </td>
                </tr>
                    <tr>
                    <td class="register">
                        <asp:Label ID="Label5" runat="server" Text="5、不得传播任何虚假的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料。"></asp:Label>
                        </td>
                </tr>
                <tr>
                <td class="register">
                    <asp:Label ID="Label6" runat="server" Text="6、不得侵犯其他任何第三方的专利权、著作权、商标权、名誉权或其他任何合法权益。"></asp:Label>
                    </td>
                </tr>
                    <tr>
                    <td class="register">
                        <asp:Label ID="Label7" runat="server" Text="7、不得在论坛BBS发表任何与政治相关的信息。"></asp:Label>
                        </td>
                </tr>
                <tr>
                <td class="register">
                    <asp:Label ID="Label8" runat="server" Text="8、遵守所有使用网站服务的网络协议、规定、程序和惯例。"></asp:Label>
                    </td>
                </tr>
                    <tr>
                    <td class="register" style="text-align:center">
                        
                                    <table style="width:100%">
                                        <tr>
                                            <td style=" text-align:center;">
                                                <asp:CheckBox ID="CheckBox1" runat="server" Text="我已仔细阅读，并同意以上条款"  Font-Size="12px" />
                                            </td>
                                        </tr>
                                    </table>
                                
                    </td>                    
                </tr>
                <tr>
                    <td class="register" style="text-align:center">
                        <asp:Button ID="Button1" runat="server" Text="同意并继续"  BackColor="Red" ForeColor="White" Width="250px" OnClientClick="return check();" OnClick="Button1_Click" BorderColor="#999999" Height="30px"  />
                    </td>
                </tr>
            </table>
        </div>
       
    </div>
    <script>
        function check() {
            var checkbox = document.getElementById("<%=CheckBox1.ClientID%>");
            if (checkbox.checked) {
                return true;
            }
            else {
                Swal.fire({
                    title: '提示',
                    icon: 'warning',
                    text: '请确认同意上面条款',
                    confirmButtonText: '确定'
                });
                return false;
            }
        }
    </script>
    
</asp:Content>
