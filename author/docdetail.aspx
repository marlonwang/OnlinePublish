<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="help.aspx.cs" Inherits="author_help" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        稿件详细信息</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            HorizontalAlign="Center">
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <td class="tdleft">
                            中文标题</td>
                        <td class="tdright">
                            <asp:Label ID="docTitleLabel" runat="server" Text='<%# Eval("docTitle") %>' 
                                Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            投稿时间</td>
                        <td class="tdright">
                            <asp:Label ID="docTimeLabel" runat="server" Text='<%# Eval("docTime") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            中文摘要</td>
                        <td class="tdright">
                            <asp:Label ID="docAbstractLabel" runat="server" 
                                Text='<%# Eval("docAbstract") %>' Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            中文关键字</td>
                        <td class="tdright">
                            <asp:Label ID="docKeywordsLabel" runat="server" 
                                Text='<%# Eval("docKeywords") %>' Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            投稿栏目</td>
                        <td class="tdright">
                            <asp:Label ID="columnNameLabel" runat="server" 
                                Text='<%# Eval("columnName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            通讯作者</td>
                        <td class="tdright">
                            <asp:Label ID="authorIDLabel" runat="server" Text='<%# Eval("authorID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            稿件字数</td>
                        <td class="tdright">
                            <asp:Label ID="docLettersLabel" runat="server" 
                                Text='<%# Eval("docLetters") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            作者信息</td>
                        <td class="tdright">
                            <asp:Label ID="docAuthorLabel" runat="server" Text='<%# Eval("docAuthor") %>' 
                                Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            稿件状态</td>
                        <td class="tdright">
                            <asp:Label ID="stateTextLabel" runat="server" Text='<%# Eval("stateText") %>' 
                                Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            编辑部审核意见</td>
                        <td class="tdright">
                            <asp:Label ID="docReasonLabel" runat="server" Text='<%# Eval("docReason") %>' 
                                Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            专家审稿意见</td>
                        <td class="tdright">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                                GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="expertName" HeaderText="评审专家">
                                        <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="docToTime" DataFormatString="{0:yyyy-MM-dd}" 
                                        HeaderText="评审时间">
                                        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="assessment" HeaderText="评审意见">
                                        <HeaderStyle HorizontalAlign="Center" Width="490px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                
                                SelectCommand="SELECT assess.assessment, expert.expertName, assess.docToTime FROM assess INNER JOIN expert ON assess.expertID = expert.expertID where assess.docID=@docID">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="docID" QueryStringField="docID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            &nbsp;</td>
                        <td class="tdright" style="text-align: center">
                           <a href="javascript:window.close()">关 闭</a></td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [document].docTime, [document].docTitle, [document].docAbstract,  [document].docKeywords, [document].docLetters, [document].docAuthor, [column].columnName, [document].authorID, [document].docReason, state.stateText FROM [document] INNER JOIN state ON [document].docState = state.stateID INNER JOIN [column] ON [document].docColumnID = [column].columnID
where [document].docID=@docID">
            <SelectParameters>
                <asp:QueryStringParameter Name="docID" QueryStringField="docID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
   
</asp:Content>

