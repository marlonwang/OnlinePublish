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
                处理结果</td>
            <td class="tdright">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="11">专家评审</asp:ListItem>
                    <asp:ListItem Value="12">退回返修</asp:ListItem>
                    <asp:ListItem Value="13">退稿</asp:ListItem>
                </asp:DropDownList>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="expertName" 
                    DataValueField="expertID" RepeatColumns="5" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT [expertID], [expertName] FROM [expert] WHERE ([expertColumn] = @expertColumn)">
                    <SelectParameters>
                        <asp:CookieParameter CookieName="editorColumn" Name="expertColumn" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                审稿意见</td>
            <td class="tdright">
                <asp:TextBox ID="txtdocReason" runat="server" Width="500px" Height="80px" 
                    TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtdocReason" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                （退稿、返修时必填）</td>
        </tr>
        <tr>
            <td class="tdleft">
                &nbsp;</td>
            <td class="tdright">
                <asp:Button ID="Bt_ok" runat="server" CssClass="menuBig" onclick="Bt_ok_Click" 
                    Text="确定" />
&nbsp;
                <asp:Button ID="Bt_cancel" runat="server" CausesValidation="False" 
                    CssClass="menuBig" PostBackUrl="~/editor/authorlist.aspx" Text="取消" />
            </td>
        </tr>
    </table>
</asp:Content>

