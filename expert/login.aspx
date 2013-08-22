<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="author_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登录</title>
    <STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #2a8dc8
}
BODY {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
TD {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
DIV {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
P {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
}
</STYLE>
    <link href="../images/Manage.css" rel="stylesheet" type="text/css" />
    <link href="../images/Style.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width=10><IMG src="../images/new_001.jpg" border=0></TD>
    <TD background=../images/new_002.jpg><FONT size=5><B>长江大学期刊社在线投稿系统  
        <span class="title">——用户登录</span></B></FONT></TD>
    <TD width=10><IMG src="../images/new_003.jpg" 
border=0></TD></TR></TBODY></TABLE>
<blockquote><p><font size=3>
    欢迎您，请先在此登录： 
                </p></blockquote>
            <table align="center" style="margin-top: 40px" cellpadding="5" cellspacing="4">
                <tr>
                    <td>
                        <span class="title">用户名</span></td>
                    <td>
                        <asp:TextBox ID="txtUserID" runat="server" CssClass="textbox" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtUserID" Display="Dynamic" ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td >
                        <span class="title">密&nbsp;&nbsp; 码</span></td>
                    <td>
                        <asp:TextBox ID="txtUserPwd" runat="server" CssClass="textbox" 
                            TextMode="Password" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtUserPwd" Display="Dynamic" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Bt_login" runat="server" CssClass="button" Text="登 陆" 
                            onclick="Bt_login_Click" />
&nbsp;
                        <asp:Button ID="Bt_reset" runat="server" CssClass="button" Text="重 置" 
                            CausesValidation="False" onclick="Bt_reset_Click" />
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
