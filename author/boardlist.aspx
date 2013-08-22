<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="boardlist.aspx.cs" Inherits="author_boarding" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        发表稿件</p>
    <table class="table">
        <tr>
            <td class="tdright">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" HorizontalAlign="Center" 
                    onpageindexchanging="GridView1_PageIndexChanging" GridLines="Horizontal">
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
                        <asp:BoundField DataField="boardRank" HeaderText="发表期次">
                            <HeaderStyle HorizontalAlign="Center" Width="160px" />
                            <ItemStyle HorizontalAlign="Center" Width="160px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="版面费用">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("boardMoney") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("boardMoney") %>'></asp:Label>
                                元
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="140px" />
                            <ItemStyle HorizontalAlign="Center" Width="140px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="boardState" HeaderText="缴费状态">
                            <HeaderStyle HorizontalAlign="Center" Width="120px" />
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        尚未通过审核通过的稿件信息
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

