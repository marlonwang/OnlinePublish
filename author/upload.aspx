<%@ Page Language="C#" MasterPageFile="~/system.master" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="author_Default" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="title">
        上传稿件</p>
    <p align="center">
        &nbsp;</p>
    <p align="center">
        请选择上传的稿件：<asp:FileUpload ID="FileUpload1" runat="server" 
            CssClass="fileupload" />
&nbsp;</p>
    <p align="center">
        &nbsp;<asp:Button ID="Bt_upload" runat="server" CssClass="menuBig" 
            Text="上传" onclick="Bt_upload_Click" />
    &nbsp;<asp:Button ID="Bt_back" runat="server" CssClass="menuBig" 
            Text="返回" CausesValidation="False" 
            PostBackUrl="~/author/modifylist.aspx" />
    </p>
    <p style="margin-bottom: 200px">
        &nbsp;</p>
    
</asp:Content>

