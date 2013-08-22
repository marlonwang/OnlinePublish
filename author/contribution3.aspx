<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="contribution3.aspx.cs" Inherits="author_contribution3" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        上传稿件</p>
    <hr />
    <br />
    <p style="text-align: center; padding-top: 30px"><span class="subtitle">请选择上传的稿件：</span><asp:FileUpload 
            ID="FileUpload1" runat="server" CssClass="fileupload" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="请选择稿件"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Bt_upload" runat="server" CssClass="menuBig" 
            onclick="Bt_upload_Click" Text="上传" />
&nbsp;
        <asp:Button ID="Bt_cancel" runat="server" CssClass="menuBig" onclientclick="return confirm('你确定取消吗？系统将不会保存您的稿件信息！');return false;"
            onclick="Bt_cancel_Click" Text="取消" />
    </p>
    <p style="text-align: center; padding-top: 30px">&nbsp;</p>
    <p style="text-align: center; padding-top: 30px">&nbsp;</p>
    <p style="text-align: center; padding-top: 30px">&nbsp;</p>
</asp:Content>

