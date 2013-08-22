<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="authorlist.aspx.cs" Inherits="admin_authorlist" Title="无标题页" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        作者管理</p>
    <table class="table">
        <tr>
            <td class="tdright">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="authorID" DataSourceID="SqlDataSource1" CellSpacing="2" 
                    CssClass="gvstyle">
                    <Columns>
                        <asp:BoundField DataField="authorID" HeaderText="注册名" ReadOnly="True" 
                            SortExpression="authorID">
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="authorName" HeaderText="真实姓名" 
                            SortExpression="authorName">
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="authorMail" HeaderText="电子邮件" 
                            SortExpression="authorMail">
                            <HeaderStyle HorizontalAlign="Center" Width="150px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="authorPhone" HeaderText="联系电话" 
                            SortExpression="authorPhone">
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="删除" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="删除" onclientclick="return confirm('你确定要删除吗？');return false;"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="authorID" HeaderText="详细" Text="详细" 
                            DataNavigateUrlFormatString="authordetail.aspx?authorID={0}" 
                            NavigateUrl="~/admin/authordetail.aspx">
                            <HeaderStyle HorizontalAlign="Center" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT [authorID], [authorName], [authorMail], [authorPhone] FROM [author]" 
                    DeleteCommand="DELETE FROM author where authorID=@authorID">
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>

</asp:Content>

