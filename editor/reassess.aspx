<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="reassess.aspx.cs" Inherits="editor_assess" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        稿件审核</p>
    <table class="table">
        <tr>
            <td class="tdleft">
                中文标题</td>
            <td class="tdright">
                <asp:TextBox ID="txtTitle" runat="server" Width="500px" CssClass="textbox" 
                    ReadOnly="True"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                专家评审意见</td>
            <td class="tdright">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
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
                </td>
        </tr>
        <tr>
            <td class="tdleft">
                处理结果</td>
            <td class="tdright">
                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="21">主编审核</asp:ListItem>
                    <asp:ListItem Value="12">退回返修</asp:ListItem>
                    <asp:ListItem Value="13">退稿</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdleft">
                审稿意见</td>
            <td class="tdright">
                <asp:TextBox ID="txtdocReason" runat="server" Width="500px" Height="80px" 
                    TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtdocReason" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                （退稿、返修时必填）</td>
        </tr>
        <tr>
            <td class="tdleft">
                &nbsp;</td>
            <td class="tdright">
                <asp:Button ID="Bt_ok" runat="server" CssClass="menuBig" onclick="Bt_ok_Click" 
                    Text="确定" />
&nbsp;
                <asp:Button ID="Bt_cancel" runat="server" CausesValidation="False" 
                    CssClass="menuBig" PostBackUrl="~/editor/expertlist.aspx" Text="取消" />
            </td>
        </tr>
    </table>
</asp:Content>

