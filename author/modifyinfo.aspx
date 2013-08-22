<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="modifyinfo.aspx.cs" Inherits="author_modifyinfo" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        修改个人资料
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
                        <asp:ListItem>男</asp:ListItem>
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
              <tr>
                    <td class="tdleft">
                        电子邮件</td>
                    <td class="tdright">
                        <asp:TextBox ID="txtMail" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="请输入正确的电子邮件" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        请输入您的电子邮件地址（必填）</td>
                </tr>
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
                    <asp:DropDownList ID="ddlDegree" runat="server" Width="150px">
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
                    &nbsp;</td>
                <td class="tdright">
                        <asp:Button ID="Bt_update" runat="server" CssClass="button" Text="修 改" 
                            onclick="Bt_update_Click" />
&nbsp;
                        <asp:Button ID="Bt_reset" runat="server" CausesValidation="False" 
                            CssClass="button" Text="重 置" />
                </td>
            </tr>
        </table>
   
              </asp:Content>

