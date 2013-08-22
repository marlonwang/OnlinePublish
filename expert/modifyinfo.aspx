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
                                                        请输入您的真实姓名</td>
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
            </tr>
            <tr>
                <td class="tdleft">
                    评审栏目</td>
                <td class="tdright">
                        <asp:DropDownList ID="ddlcolumn" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="columnName" DataValueField="columnID" Enabled="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [column]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    电子邮件</td>
                <td class="tdright">
                        <asp:TextBox ID="txtMail" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" 
                            ErrorMessage="请输入正确的电子邮箱" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    移动电话</td>
                <td class="tdright">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">
                    通讯地址</td>
                <td class="tdright">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Width="500px"></asp:TextBox>
                </td>
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

