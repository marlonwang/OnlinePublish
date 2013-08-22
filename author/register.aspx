<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="author_register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>用户注册</title>
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
    <TD background=../images/new_002.jpg><FONT size=5><B>《安财学报》在线投稿系统  
        <span class="title">——用户注册</span></B></FONT></TD>
    <TD width=10><IMG src="../images/new_003.jpg" 
border=0></TD></TR>
                </TBODY>
            </TABLE>
    </div>
    <div class="register">
        <p>
            <span class="title">帐号基本信息（必填）&gt;&gt;</span><br />
            <table class="table">
                <tr>
                    <td class="tdleft">
                        用户名</td>
                    <td class="tdright">
                        <asp:TextBox ID="txtID" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtID" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <span>用户名由2~16个字母、数字、汉字或者下划线组成&nbsp;&nbsp; </span>
                        <asp:LinkButton ID="LinkButton1" 
                            runat="server" CausesValidation="False" onclick="LinkButton1_Click">检测用户名</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="tdleft">
                        密码</td>
                    <td class="tdright">
                        <asp:TextBox ID="txtPwd" runat="server" CssClass="textbox" Width="200px" 
                            TextMode="Password"></asp:TextBox>
                        <span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtPwd" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        密码至少6个字符，请不要和登录名相同。</span></td>
                </tr>
                <tr>
                    <td class="tdleft">
                        确认密码</td>
                    <td class="tdright">
                        <asp:TextBox ID="txtPwdconfirm" runat="server" CssClass="textbox" Width="200px" 
                            TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtPwdconfirm" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txtPwd" ControlToValidate="txtPwdconfirm" 
                            Display="Dynamic" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                        </td>
                </tr>
                <tr>
                    <td class="tdleft">
                        电子邮件</td>
                    <td class="tdright">
                        <asp:TextBox ID="txtMail" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="请输入正确的电子邮件地址" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        请输入您的常用电子邮件地址</td>
                </tr>
                </table>
            <br />
        </p>
        <p>
            <span class="title">您的职业和联系信息&gt;&gt;</span><br />
        </p>
        <table class="table">
            <tr>
                <td class="tdleft">
                    真实姓名       <td class="tdright">
                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        请输入您的真实姓名（必填）</td>
            </tr>
            <tr>
                <td class="tdleft">
                    性别</td>
                <td class="tdright">
                    <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    出生日期</td>
                <td class="tdright">
                        <asp:TextBox ID="txtBirth" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        生日用于确认您的年龄，格式如:1990-01-01</td>
            </tr>
            <tr>
                <td class="tdleft">
                    地区</td>
                <td class="tdright">
                        <asp:TextBox ID="txtRegion" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        您所在的省、市</td>
            </tr>
            <tr>
                <td class="tdleft">
                    通讯地址</td>
                <td class="tdright">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Width="500px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        （必填）</td>
            </tr>
            <tr>
                <td class="tdleft">
                    邮政编码</td>
                <td class="tdright">
                        <asp:TextBox ID="TxtPostcode" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="TxtPostcode" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        （必填）</td>
            </tr>
            <tr>
                <td class="tdleft">
                    职业</td>
                <td class="tdright">
                        <asp:TextBox ID="txtJob" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    工作单位</td>
                <td class="tdright">
                        <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtCompany" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        （必填）</td>
            </tr>
            <tr>
                <td class="tdleft">
                    教育程度</td>
                <td class="tdright">
                    <asp:DropDownList ID="dddlDegree" runat="server" Width="150px">
                        <asp:ListItem>大学本科</asp:ListItem>
                        <asp:ListItem>本科以下</asp:ListItem>
                        <asp:ListItem>硕士生</asp:ListItem>
                        <asp:ListItem>硕士</asp:ListItem>
                        <asp:ListItem>博士生</asp:ListItem>
                        <asp:ListItem>博士</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    专业方向</td>
                <td class="tdright">
                        <asp:TextBox ID="txtMajor" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    职称</td>
                <td class="tdright">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    移动电话</td>
                <td class="tdright">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        （必填）</td>
            </tr>
            <tr>
                <td class="tdleft">
                    个人简介</td>
                <td class="tdright">
                        <asp:TextBox ID="txtInfo" runat="server" CssClass="textarea" 
                        Width="500px" Height="140px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    服务条款</td>
                <td class="tdright">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="是，我愿意接受并遵守相关声明条款。" />
                        <asp:HyperLink ID="HyperLink1" runat="server">查看</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    &nbsp;</td>
                <td class="tdright">
                        <asp:Button ID="Bt_register" runat="server" CssClass="button" Text="完 成" 
                            onclick="Bt_register_Click" />
&nbsp;
                        <asp:Button ID="Bt_reset" runat="server" CausesValidation="False" 
                            CssClass="button" Text="重 置" />
                </td>
            </tr>
        </table></div>
    </form>
</body>
</html>
