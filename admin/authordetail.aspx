<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="authordetail.aspx.cs" Inherits="admin_authordetail" Title="无标题页" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        作者详细信息</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="authorID" 
            DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <td class="tdleft">
                            注册名</td>
                        <td class="tdright">
                            <asp:Label ID="authorIDLabel" runat="server" Text='<%# Eval("authorID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            真实姓名</td>
                        <td class="tdright">
                            <asp:Label ID="authorNameLabel" runat="server" 
                                Text='<%# Eval("authorName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            性别</td>
                        <td class="tdright">
                            <asp:Label ID="authorSexLabel" runat="server" Text='<%# Eval("authorSex") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            出生日期</td>
                        <td class="tdright">
                            <asp:Label ID="authorBirthLabel" runat="server" 
                                Text='<%# Eval("authorBirth") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            地区</td>
                        <td class="tdright">
                            <asp:Label ID="authorRegionLabel" runat="server" 
                                Text='<%# Eval("authorRegion") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            通迅地址</td>
                        <td class="tdright">
                            <asp:Label ID="authorAddressLabel" runat="server" 
                                Text='<%# Eval("authorAddress") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            邮政编码</td>
                        <td class="tdright">
                            <asp:Label ID="authorPostLabel" runat="server" 
                                Text='<%# Eval("authorPost") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            职业</td>
                        <td class="tdright">
                            <asp:Label ID="authorJobLabel" runat="server" Text='<%# Eval("authorJob") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            工作单位</td>
                        <td class="tdright">
                            <asp:Label ID="authorCompanyLabel" runat="server" 
                                Text='<%# Eval("authorCompany") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            教育程度</td>
                        <td class="tdright">
                            <asp:Label ID="authorDegreeLabel" runat="server" 
                                Text='<%# Eval("authorDegree") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            研究方向</td>
                        <td class="tdright">
                            <asp:Label ID="authorMajorLabel" runat="server" 
                                Text='<%# Eval("authorMajor") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            职称</td>
                        <td class="tdright">
                            <asp:Label ID="authorTitleLabel" runat="server" 
                                Text='<%# Eval("authorTitle") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            联系电话</td>
                        <td class="tdright">
                            <asp:Label ID="authorPhoneLabel" runat="server" 
                                Text='<%# Eval("authorPhone") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            电子邮件</td>
                        <td class="tdright">
                            <asp:Label ID="authorMailLabel" runat="server" 
                                Text='<%# Eval("authorMail") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            个人简介</td>
                        <td class="tdright">
                            <asp:Label ID="authorInfoLabel" runat="server" 
                                Text='<%# Eval("authorInfo") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            &nbsp;</td>
                        <td class="tdright">
                            <asp:Button ID="Bt_cancel" runat="server" CausesValidation="False" 
                                CssClass="menuBig" PostBackUrl="~/admin/authorlist.aspx" Text="返回" />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [author] WHERE ([authorID] = @authorID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="authorID" QueryStringField="authorID" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>

