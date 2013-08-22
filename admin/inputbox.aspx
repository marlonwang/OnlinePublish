<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="inputbox.aspx.cs" Inherits="author_inputbox" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        已接收消息</p>
        <table class="table">
            <tr>
                <td class="tdright">
                    您有<asp:Label ID="lblcount" runat="server"></asp:Label>
                    条未读消息</td>
            </tr>
            <tr>
                <td class="tdright">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="messageID" 
                        onrowdeleting="GridView1_RowDeleting" AllowPaging="True" BorderWidth="1px" 
                        CellPadding="1" CellSpacing="1" CssClass="gvstyle" 
                        onpageindexchanging="GridView1_PageIndexChanging">
                        <PagerSettings FirstPageText="第一页" LastPageText="尾页" NextPageText="下一页" 
                            PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckItem" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <ItemTemplate>
                                    <img alt="" height="10" src='../images/<%#Eval("messageState") %>.gif' 
                                        width="14" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="messageID" HeaderText="消息编号" Visible="False" />
                            <asp:HyperLinkField DataNavigateUrlFormatString="message.aspx?messageID={0}" 
                                DataTextField="messageTitle" HeaderText="消息标题" 
                                NavigateUrl="~/author/message.aspx" DataNavigateUrlFields="messageID">
                                <HeaderStyle HorizontalAlign="Center" Width="250px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="messageTime" HeaderText="发送时间" >
                                <HeaderStyle HorizontalAlign="Center" Width="150px" />
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="messageState" HeaderText="消息状态" Visible="False" />
                            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Delete"   onclientclick="return confirm('你确定要删除吗？');return false;"
                                        Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="tdright">
                    <asp:CheckBox ID="CheckAll" runat="server" AutoPostBack="True" 
                        oncheckedchanged="CheckAll_CheckedChanged" Text="全选" />
                    <asp:Button ID="Bt_delete" runat="server" CssClass="button" 
                        onclick="Bt_delete_Click" Text="删除" />
&nbsp;<asp:Button ID="Bt_cancel" runat="server" CssClass="button" onclick="Bt_cancel_Click" 
                        Text="取消" />
                </td>
            </tr>
    </table>

</asp:Content>
