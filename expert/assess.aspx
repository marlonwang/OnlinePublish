<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="assess.aspx.cs" Inherits="editor_assess" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        稿件审核</p>
    <table class="table">
        <tr>
            <td class="tdleft">
                中文标题</td>
            <td class="tdright">
                <asp:TextBox ID="txtTitle" runat="server" Width="500px" CssClass="textbox" 
                    ReadOnly="True"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                中文摘要</td>
            <td class="tdright">
                <asp:TextBox ID="txtAbstract" runat="server" Width="500px" Height="35px" 
                    TextMode="MultiLine" CssClass="textarea" ReadOnly="True"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                中文关键字</td>
            <td class="tdright">
                <asp:TextBox ID="txtKeyword" runat="server" Width="500px" CssClass="textbox" 
                    ReadOnly="True"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                稿件字数</td>
            <td class="tdright">
                <asp:TextBox ID="txtLetters" runat="server" Width="500px" CssClass="textbox" 
                    ReadOnly="True"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                作者信息</td>
            <td class="tdright">
                <asp:TextBox ID="txtAuthorInfo" runat="server" Width="500px" Height="80px" 
                    TextMode="MultiLine" CssClass="textarea" ReadOnly="True"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                审稿意见</td>
            <td class="tdright">
                <asp:TextBox ID="txtdocReason" runat="server" Width="500px" Height="140px" 
                    TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtdocReason" Display="Dynamic" ErrorMessage="请填写审稿意见"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                &nbsp;</td>
            <td class="tdright">
                <asp:Button ID="Bt_ok" runat="server" CssClass="menuBig" onclick="Bt_ok_Click" 
                    Text="确定" />
&nbsp;
                <asp:Button ID="Bt_cancel" runat="server" CausesValidation="False" 
                    CssClass="menuBig" PostBackUrl="~/expert/newdoclist.aspx" Text="取消" />
            </td>
        </tr>
    </table>
</asp:Content>

