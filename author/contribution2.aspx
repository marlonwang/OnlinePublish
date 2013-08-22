<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="contribution2.aspx.cs" Inherits="author_contribution2" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        确认作者信息</p>
    <p>
        &nbsp;&nbsp;
        我们将按以下信息发录用通知、样刊，如果信息有误，请修改<br />
        <table class="table">
            <tr>
                <td class="tdleft">
                    您的姓名</td>
                <td class="tdright">
                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="tdleft">
                    通讯地址</td>
                <td class="tdright">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Width="500px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="tdleft">
                    邮编</td>
                <td class="tdright">
                        <asp:TextBox ID="TxtPostcode" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="TxtPostcode" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="tdleft">
                    单位</td>
                <td class="tdright">
                        <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtCompany" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="tdleft">
                    电话</td>
                <td class="tdright">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="tdleft">
                    Email</td>
                <td class="tdright">
                        <asp:TextBox ID="txtMail" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtMail" Display="Dynamic" ErrorMessage="请输入正确的电子邮件" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
            </tr>
            <tr>
                <td class="tdleft">
                    &nbsp;</td>
                <td class="tdright">
                    <asp:Button ID="Bt_update" runat="server" CssClass="menuBig" 
                        onclick="Bt_update_Click" Text="修 改" />
&nbsp;
                    <asp:Button ID="Bt_next" runat="server" 
                        CssClass="menuBig" PostBackUrl="~/author/contribution3.aspx" Text="下一步" />
                </td>
            </tr>
        </table>
    </p>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

