<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="expertmaintain.aspx.cs" Inherits="admin_expertmaintain" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        编辑管理</p>
                                            <table class="table">
                                                <tr>
                                                    <td class="tdright">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                            CellPadding="1" CellSpacing="2" CssClass="gvstyle" DataKeyNames="expertID" 
                                                            DataSourceID="SqlDataSource1">
                                                            <Columns>
                                                                <asp:BoundField DataField="expertID" HeaderText="登录名" ReadOnly="True">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="expertName" HeaderText="编辑姓名">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="expertPhone" HeaderText="联系电话">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="expertMail" HeaderText="电子邮件">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="120px" />
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
                                                                <asp:HyperLinkField DataNavigateUrlFields="expertID" 
                                                                    DataNavigateUrlFormatString="expertdetail.aspx?expertID={0}" HeaderText="详细" 
                                                                    NavigateUrl="~/admin/expertdetail.aspx" Text="详细">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:HyperLinkField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            SelectCommand="SELECT [expertID], [expertName], [expertPhone], [expertMail] FROM [expert] where expertColumn=@expertColumn">
                                                            <SelectParameters>
                                                                <asp:CookieParameter CookieName="editorColumn" Name="expertColumn" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdright">
                                                        <table class="style1">
                                                            <tr>
                                                    <td class="tdleft">
                                                        登录名</td>
                                                    <td class="tdright">
                <asp:TextBox ID="txtID" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtID" Display="Dynamic" ErrorMessage="请输入编辑登录名"></asp:RequiredFieldValidator>
                                                    </td>
                                                                </tr>
                                                                <tr>
                                                    <td class="tdleft">
                                                        真实姓名</td>
                                                    <td class="tdright">
                <asp:TextBox ID="txtName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtName" Display="Dynamic" ErrorMessage="请填写编辑真实姓名"></asp:RequiredFieldValidator>
                                                    </td>
                                                            </tr>
                                                            <tr>
                                                    <td class="tdleft">
                                                        &nbsp;</td>
                                                    <td class="tdright">
                <asp:Button ID="Bt_add" runat="server" CssClass="menuBig" Text="添加" 
                    onclick="Bt_add_Click" />
&nbsp;
                <asp:Button ID="Bt_cancel" runat="server" CausesValidation="False" 
                    CssClass="menuBig" Text="取消" />
                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </table>
</asp:Content>

