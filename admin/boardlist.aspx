<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="boardlist.aspx.cs" Inherits="admin_boardlist" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        版面安排</p>
    <table class="table">
        <tr>
            <td class="tdright">
                稿件名称：<asp:TextBox ID="txtdocTitle" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;稿件作者：<asp:TextBox ID="txtauthorID" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;<asp:Button ID="Bt_search" runat="server" CssClass="button" Text="查询" 
                    onclick="Bt_search_Click" />
            </td>
        </tr>
        <tr>
            <td class="tdright">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="docID" HorizontalAlign="Center" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    onrowcancelingedit="GridView1_RowCancelingEdit" 
                    onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
                    CellPadding="4" CellSpacing="1">
                    <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" 
                        PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                    <Columns>
                        <asp:BoundField DataField="docID" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="docID" 
                            DataNavigateUrlFormatString="~/author/docdetail.aspx?docID={0}" 
                            DataTextField="docTitle" HeaderText="稿件标题" 
                            NavigateUrl="~/author/docdetail.aspx" Target="_blank">
                            <HeaderStyle HorizontalAlign="Center" Width="250px" />
                            <ItemStyle  />
                        </asp:HyperLinkField>
                        <asp:TemplateField HeaderText="通讯作者">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("authorID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("authorID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="发表期次">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("boardRank") %>' 
                                    Width="140px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("boardRank") %>' 
                                    Width="140px"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="130px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="版面费用">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("boardMoney") %>' 
                                    Width="40px"></asp:TextBox>
                                元
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("boardMoney") %>' 
                                    Width="40px"></asp:Label>
                                元
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="缴费状态">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlstate" runat="server" 
                                    SelectedValue='<%# Bind("boardState") %>'>
                                    <asp:ListItem>已缴费</asp:ListItem>
                                    <asp:ListItem>未缴费</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("boardState") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="版面安排" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="确定"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="取消"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="安排"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="120px" />
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

