<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="editordetail.aspx.cs" Inherits="admin_editordetail" Title="无标题页" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        编辑详细信息</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="editorID" 
            DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <td class="tdleft">
                            登录名</td>
                        <td class="tdright">
                            <asp:Label ID="editorIDLabel" runat="server" Text='<%# Eval("editorID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            真实姓名</td>
                        <td class="tdright">
                            <asp:Label ID="editorNameLabel" runat="server" 
                                Text='<%# Eval("editorName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            性别</td>
                        <td class="tdright">
                            <asp:Label ID="editorSexLabel" runat="server" Text='<%# Eval("editorSex") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            管理栏目</td>
                        <td class="tdright">
                            <asp:Label ID="columnNameLabel" runat="server" 
                                Text='<%# Eval("columnName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            联系电话</td>
                        <td class="tdright">
                            <asp:Label ID="editorPhoneLabel" runat="server" 
                                Text='<%# Eval("editorPhone") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            电子邮件</td>
                        <td class="tdright">
                            <asp:Label ID="editorMailLabel" runat="server" 
                                Text='<%# Eval("editorMail") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            通讯地址</td>
                        <td class="tdright">
                            <asp:Label ID="editorAddressLabel" runat="server" 
                                Text='<%# Eval("editorAddress") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            个人简介</td>
                        <td class="tdright">
                            <asp:Label ID="editorInfoLabel" runat="server" 
                                Text='<%# Eval("editorInfo") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdleft">
                            &nbsp;</td>
                        <td class="tdright">
                            <asp:Button ID="Bt_cancel" runat="server" CausesValidation="False" 
                                CssClass="menuBig" PostBackUrl="~/admin/editormaintain.aspx" Text="返回" />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT editor.*, [column].columnName FROM [column] INNER JOIN editor ON [column].columnID = editor.editorColumn
where editorID=@editorID">
            <SelectParameters>
                <asp:QueryStringParameter Name="editorID" QueryStringField="editorID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

