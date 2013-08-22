<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="doclist.aspx.cs" Inherits="editor_authorlist" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        初审稿件</p>
    <table class="table">
        <tr class="tdright">
            <td>
                稿件名称：<asp:TextBox ID="txtdocTitle" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;稿件作者：<asp:TextBox ID="txtauthorID" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;<asp:Button ID="Bt_search" runat="server" CssClass="button" Text="查询" 
                    onclick="Bt_search_Click" />
            </td>
        </tr>
        <tr>
            <td class="tdright">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="gvstyle" GridLines="Horizontal" AllowPaging="True" BackColor="#E4E4E4" 
                    BorderWidth="1px" CellSpacing="5" 
                    onpageindexchanging="GridView1_PageIndexChanging1" DataKeyNames="docID">
            <PagerSettings FirstPageText="首页" LastPageText="尾页" 
                Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
            <Columns>
                <asp:BoundField DataField="docID" Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="docID" 
                    DataNavigateUrlFormatString="~/author/docdetail.aspx?docID={0}" 
                    DataTextField="docTitle" HeaderText="稿件名称" 
                    NavigateUrl="~/author/docdetail.aspx" Target="_blank">
                    <HeaderStyle HorizontalAlign="Center" Width="260px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="docTime" DataFormatString="{0:yyyy-MM-dd}" 
                    HeaderText="投稿时间">
                    <HeaderStyle HorizontalAlign="Center" Width="140px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="authorID" HeaderText="通讯作者">
                    <HeaderStyle HorizontalAlign="Center" Width="140px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="下载稿件">
                    <ItemTemplate>
                        <a href="../upfiles/<%#Eval("attachName") %>">下载</a>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:HyperLinkField HeaderText="审核" Text="审核" DataNavigateUrlFields="docID" 
                    DataNavigateUrlFormatString="assess.aspx?docID={0}" 
                    NavigateUrl="~/editor/assess.aspx">
                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

