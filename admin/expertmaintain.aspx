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
        专家管理</p>
                                            <table class="table">
                                                <tr>
                                                    <td class="tdright">
                                                        登录名：<asp:TextBox ID="txtexpertID" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp; 专家姓名：<asp:TextBox ID="txtexpertName" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp; 管理栏目：<asp:DropDownList ID="Dropcolumn" runat="server" DataSourceID="SqlDataSource2" DataTextField="columnName" 
                                                            DataValueField="columnID">
                                                        </asp:DropDownList>
&nbsp;&nbsp; <asp:Button ID="Bt_search" runat="server" CssClass="button" Text="查询" 
                    onclick="Bt_search_Click" CausesValidation="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdright">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                            CellPadding="1" CellSpacing="2" CssClass="gvstyle" DataKeyNames="expertID" 
                                                            onpageindexchanging="GridView1_PageIndexChanging" 
                                                            onrowcancelingedit="GridView1_RowCancelingEdit" 
                                                            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                                                            onrowupdating="GridView1_RowUpdating" AllowPaging="True" > 
                                                            <PagerSettings FirstPageText="首页" LastPageText="尾页" 
                                                                Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
                                                            <Columns>
                                                                   <asp:HyperLinkField DataNavigateUrlFields="expertID" 
                                                                    DataNavigateUrlFormatString="expertdetail.aspx?expertID={0}" HeaderText="登录名" 
                                                                    NavigateUrl="~/admin/expertdetail.aspx" DataTextField="expertID">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:HyperLinkField>
                                                                <asp:BoundField DataField="expertName" HeaderText="编辑姓名" ReadOnly="True">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                   <asp:TemplateField HeaderText="管理栏目" SortExpression="columnName">
                                                                       <EditItemTemplate>
                                                                           <asp:DropDownList ID="DropDownList1" runat="server" 
                                                                               DataSourceID="SqlDataSource1" DataTextField="columnName" 
                                                                               DataValueField="columnID">
                                                                           </asp:DropDownList>
                                                                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                                               ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                                               SelectCommand="SELECT * FROM [column]"></asp:SqlDataSource>
                                                                       </EditItemTemplate>
                                                                       <ItemTemplate>
                                                                           <asp:Label ID="Label1" runat="server" Text='<%# Bind("columnName") %>'></asp:Label>
                                                                       </ItemTemplate>
                                                                       <HeaderStyle HorizontalAlign="Center" Width="120px" />
                                                                       <ItemStyle HorizontalAlign="Center" />
                                                                   </asp:TemplateField>
                                                                <asp:BoundField DataField="expertPhone" HeaderText="联系电话" ReadOnly="True">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="expertMail" HeaderText="电子邮件" ReadOnly="True">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="120px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:CommandField CausesValidation="False" HeaderText="编辑" 
                                                                    ShowEditButton="True">
                                                                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:CommandField>
                                                       
                                                                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                            CommandName="Delete" Text="删除" onclientclick="return confirm('你确定要删除吗？');return false;"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                     
                                                            </Columns>
                                                        </asp:GridView>
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
                管理栏目</td>
                                                    <td class="tdright">
                <asp:DropDownList ID="ddlcolumn" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="columnName" 
                    DataValueField="columnID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [column]"></asp:SqlDataSource>
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

