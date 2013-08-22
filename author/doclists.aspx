<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="doclists.aspx.cs" Inherits="author_doclists" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        已投稿件</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="gvstyle" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            AllowPaging="True" BackColor="#E4E4E4" BorderWidth="1px" CellSpacing="5">
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
                    <HeaderStyle HorizontalAlign="Center" Width="120px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="stateText" HeaderText="稿件状态">
                    <HeaderStyle HorizontalAlign="Center" Width="120px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="docID" 
                    DataNavigateUrlFormatString="expertassess.aspx?docID={0}" HeaderText="专家意见" 
                    NavigateUrl="~/author/expertassess.aspx" Text="查看" Target="_blank" >
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
                <asp:TemplateField HeaderText="下载稿件">
                    <ItemTemplate>
                        <a href="../upfiles/<%#Eval("attachName") %>">下载</a>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
            SelectCommand="SELECT [document].docID, [document].docTime, [document].docTitle, [document].docReason, attach.attachName, state.stateText FROM attach INNER JOIN [document] ON attach.docID = [document].docID INNER JOIN state ON [document].docState = state.stateID where [document].authorID=@auhorID">
            <SelectParameters>
                <asp:CookieParameter CookieName="userID" Name="auhorID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

