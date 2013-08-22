<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="modifypwd.aspx.cs" Inherits="author_modifypwd" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        修改密码</p>
    <table class="table">
        <tr>
            <td class="tdleft">
                旧密码</td>
            <td class="tdright">
                <asp:TextBox ID="txtPwdold" runat="server" TextMode="Password" Width="200px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtPwdold" Display="Dynamic" ErrorMessage="请输入旧密码"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                新密码</td>
            <td class="tdright">
                <asp:TextBox ID="txtPwdnew" runat="server" TextMode="Password" Width="200px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPwdnew" Display="Dynamic" ErrorMessage="请输入新密码"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                确认新密码</td>
            <td class="tdright">
                <asp:TextBox ID="txtPwdconfirm" runat="server" TextMode="Password" 
                    Width="200px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPwdconfirm" Display="Dynamic" ErrorMessage="请再次输入新密码"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPwdnew" ControlToValidate="txtPwdconfirm" 
                    Display="Dynamic" ErrorMessage="两次密码不一致"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                &nbsp;</td>
            <td class="tdright">
                <asp:Button ID="Bt_Update" runat="server" Text="修 改" Width="55px" 
                    CssClass="button" onclick="Bt_Update_Click" />
&nbsp;
                <asp:Button ID="Bt_reset" runat="server" CausesValidation="False" Text="取 消" 
                    Width="55px" CssClass="button" onclick="Bt_reset_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

