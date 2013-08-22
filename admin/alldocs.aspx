<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="alldocs.aspx.cs" Inherits="admin_alldocs" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        所有来稿</p>
    <table class="table">
        <tr>
            <td class="tdright">
                稿件名称：<asp:TextBox ID="txtdocTitle" runat="server" CssClass="textbox"></asp:TextBox>
                &nbsp;关 键 词：<asp:TextBox ID="txtKeywords" runat="server" CssClass="textbox" 
                    Width="185px"></asp:TextBox>
&nbsp;<br />
                投稿栏目：<asp:DropDownList ID="ddlColumn" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="columnName" 
                    DataValueField="columnID" Width="130px">
                </asp:DropDownList>
&nbsp;投稿时间：<asp:DropDownList ID="ddlyearF" runat="server" Width="55px">
                </asp:DropDownList>
                年<asp:DropDownList ID="ddlMonthF" runat="server" Width="45px">
                </asp:DropDownList>
                月&nbsp;至 
                <asp:DropDownList ID="ddlYearT" runat="server" Width="55px">
                </asp:DropDownList>
                年<asp:DropDownList ID="ddlMonthT" runat="server" Width="45px">
                </asp:DropDownList>
                月&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Bt_search" runat="server" CssClass="button" Text="查询" 
                    onclick="Bt_search_Click" />
            </td>
        </tr>
        <tr>
            <td class="tdright">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    onpageindexchanging="GridView1_PageIndexChanging" CellPadding="1" 
                    CellSpacing="5">
                    <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" 
                        PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                    <Columns>
                        <asp:BoundField DataField="docID" HeaderText="稿件编号" Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="docID" 
                    DataNavigateUrlFormatString="~/author/docdetail.aspx?docID={0}" 
                    DataTextField="docTitle" HeaderText="稿件名称" 
                    NavigateUrl="~/author/docdetail.aspx" Target="_blank">
                    <HeaderStyle HorizontalAlign="Center" Width="260px" />
                </asp:HyperLinkField>
                        <asp:BoundField DataField="docTime" DataFormatString="{0:d}" HeaderText="投稿时间">
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="columnName" HeaderText="投稿栏目" >
                            <HeaderStyle HorizontalAlign="Center" Width="120px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="authorID" HeaderText="通讯作者">
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="docKeywords" HeaderText="关键词">
                            <HeaderStyle HorizontalAlign="Center" Width="200px" />
                            <ItemStyle HorizontalAlign="Center" Width="200px" />
                        </asp:BoundField>
                <asp:TemplateField HeaderText="下载稿件">
                    <ItemTemplate>
                        <a href="../upfiles/<%#Eval("attachName") %>">下载</a>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="tdright">
                符合条件的稿件共有<asp:Label ID="lblCount" runat="server" CssClass="bold"></asp:Label>
                篇<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [column]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

