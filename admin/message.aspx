<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="author_message" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        消息内容</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <td class="tdright" align="center">
                            <br />
                            <asp:Label ID="messageTitleLabel" runat="server" 
                                Text='<%# Eval("messageTitle") %>' CssClass="subtitle" />
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdright">
                            发送时间：<asp:Label ID="messageTimeLabel" runat="server" 
                                Text='<%# Eval("messageTime") %>' />
                            <br />
                            <br />
                            发 件 人：<asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource1" DataTextField="columnName" 
                                DataValueField="columnID" Enabled="False" 
                                SelectedValue='<%# Eval("messageFrom") %>'>
                            </asp:DropDownList>
                            编辑部<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [column]"></asp:SqlDataSource>
                            <br />
                            <br />
                            消息内容：<asp:Label ID="messageContentLabel" runat="server" 
                                Text='<%# Eval("messageContent") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdright">
                            <asp:Button ID="Button1" runat="server" CssClass="menuBig" 
                                PostBackUrl="~/admin/inputbox.aspx" Text="返回" />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [messageFrom], [messageTime], [messageTitle], [messageContent] FROM [message] WHERE ([messageID] = @messageID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="messageID" QueryStringField="messageID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

