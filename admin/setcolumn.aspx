<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="setcolumn.aspx.cs" Inherits="admin_setcolumn" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        栏目设置</p>
                                            <table class="table">
                                                <tr>
                                                    <td class="tdright" colspan="2">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                            CssClass="gvstyle" DataKeyNames="columnID" 
                                                            onrowdeleting="GridView1_RowDeleting" BorderWidth="1px" CellPadding="1" 
                                                            CellSpacing="2">
                                                            <Columns>
                                                                <asp:BoundField DataField="columnID" HeaderText="栏目编号">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="columnName" HeaderText="栏目名称">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="180px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                            CommandName="Delete"   onclientclick="return confirm('你确定要删除吗？');return false;" Text="删除"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdleft">
                                                        栏目编号</td>
            <td class="tdright">
                <asp:TextBox ID="txtcolumnID" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtcolumnID" Display="Dynamic" ErrorMessage="请输入栏目号" 
                    Font-Size="Small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                栏目名称</td>
            <td class="tdright">
                <asp:TextBox ID="txtcolumnName" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtcolumnName" Display="Dynamic" ErrorMessage="请输入栏名称" 
                    Font-Size="Small"></asp:RequiredFieldValidator>
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
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

