<%@ Page Language="C#" AutoEventWireup="true" CodeFile="expertInfo.aspx.cs" Inherits="expert_assessement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../images/Style.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div > 
    
        <br />
        <br />
        <br />
    <table align="center">
    <tr>
        <td>
           <p align="center" class="subtitle" >  
               <asp:Label ID="Label1" runat="server" 
                   Text="Label" CssClass="subtitle"></asp:Label>
               简介</p><br />
    
    <p>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                姓名:
                <asp:Label ID="expertNameLabel" runat="server" 
                    Text='<%# Eval("expertName") %>' />
                <br />
                <br />
                性别:
                <asp:Label ID="expertSexLabel" runat="server" Text='<%# Eval("expertSex") %>' />
                <br />
                <br />
                简介:
                <asp:Label ID="expertInfoLabel" runat="server" Text='<%# Eval("expertInfo") %>' 
                    Width="400px" />
                <br />
                <br />
                邮箱:
                <asp:Label ID="expertMailLabel" runat="server" 
                    Text='<%# Eval("expertMail") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [expertName], [expertSex], [expertInfo], [expertMail] FROM [expert] WHERE ([expertID] = @expertID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="expertID" QueryStringField="expertID" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
   
   
        <p align="center"><a href="javascript:window.close()">关 闭</a></p> </td>
    </tr>
</table>
          </form>  
        </div>



</body>
</html>
