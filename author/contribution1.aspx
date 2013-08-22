<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="contribution1.aspx.cs" Inherits="author_contribution1" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <p class="title">填写稿件信息</p><table class="table">
        <tr>
            <td class="tdleft">
                中文标题</td>
            <td class="tdright">
                <asp:TextBox ID="txtTitle" runat="server" Width="500px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                (必填，不超过100字)</td>
        </tr>
        <tr>
            <td class="tdleft">
                英文标题</td>
            <td class="tdright">
                <asp:TextBox ID="txttitleEN" runat="server" Width="500px" CssClass="textbox"></asp:TextBox>
                (限400字符以内)</td>
        </tr>
        <tr>
            <td class="tdleft">
                中文摘要</td>
            <td class="tdright">
                <asp:TextBox ID="txtAbstract" runat="server" Width="500px" Height="35px" 
                    TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtAbstract" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                (必填，不超过200字)</td>
        </tr>
        <tr>
            <td class="tdleft">
                英文摘要</td>
            <td class="tdright">
                <asp:TextBox ID="txtAbstractEN" runat="server" Width="500px" Height="35px" 
                    TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                (限2000字符以内)</td>
        </tr>
        <tr>
            <td class="tdleft">
                中文关键字</td>
            <td class="tdright">
                <asp:TextBox ID="txtKeyword" runat="server" Width="500px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtKeyword" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                (必填，不超过100字)</td>
        </tr>
        <tr>
            <td class="tdleft">
                英文关键字</td>
            <td class="tdright">
                <asp:TextBox ID="txtKeywordEN" runat="server" Width="500px" CssClass="textbox"></asp:TextBox>
                (限200字符以内)</td>
        </tr>
        <tr>
            <td class="tdleft">
                稿件字数</td>
            <td class="tdright">
                <asp:TextBox ID="txtLetters" runat="server" Width="500px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtLetters" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                (必填)</td>
        </tr>
        <tr>
            <td class="tdleft">
                作者信息</td>
            <td class="tdright">
                <asp:TextBox ID="txtAuthorInfo" runat="server" Width="500px" Height="150px" 
                    TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                <br />
                (稿件作者信息，包括姓名、职称、著作等信息)</td>
        </tr>
        <tr>
            <td class="tdleft">
                投稿栏目</td>
            <td class="tdright">
                <asp:DropDownList ID="dddlColumn" runat="server" Width="150px" 
                     DataSourceID="SqlDataSource1" 
                    DataTextField="columnName" DataValueField="columnID">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="dddlColumn" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                (必填)<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [column]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                &nbsp;</td>
            <td class="tdright">
                <asp:Button ID="Bt_next" runat="server" BorderStyle="None" Text="下一步" 
                    CssClass="menuBig" onclick="Bt_next_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

