<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="游戏论坛.WebForm2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="orderslist">
                   <!--增加datalist-->       
              <table id="customers" width="100%" cellpadding="0" cellspacing="0" border="1px">
            	    <tbody>
                    <tr align="center" valign="middle" height="30px">
                      <th width="100%">标题</th>
                    </tr>
                   <asp:DataList ID = "Orders_list" runat = "server" RepeatLayout = "Flow" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <tr height="30px" align="center" valign="middle">
                                  <td><%# Eval("mName")%></td>
                                  
                            </tr>
                        </ItemTemplate> 
                     </asp:DataList>
                    </tbody>
                </table>
             </div>
 
           <div class="fenye">
                      <%-- 分页控件--%>
                         <center>
                            <webdiyer:AspNetPager ID="AspNetPagerNotice" runat="server" CurrentPageButtonClass="cpb"
                                   Width="570px" ShowPageIndexBox="Always" PageSize="16"
                                   FirstPageText="首页" LastPageText="尾页" PrevPageText="上一页" NextPageText="下一页"
                                   OnPageChanged="AspNetPagerNotice_PageChanged"
                                   CurrentPageButtonStyle="color:#f60" NumericButtonCount="6" Font-Bold="False" 
                                   Font-Names="微软雅黑">
                           </webdiyer:AspNetPager>
                      </center>
           </div>
    </form>
</body>
</html>
