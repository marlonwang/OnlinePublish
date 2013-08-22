<%@ Page Language="C#" AutoEventWireup="true" CodeFile="expertassess.aspx.cs" Inherits="expert_assessement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../images/Style.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body >
    <form id="form1" runat="server">
    <div > 
    
        <br />
        <br />
        <br />
    <table align="center">
    <tr>
        <td>
           <p align="center" class="subtitle" >  
               <asp:Label ID="lbldocTitle" runat="server" 
                   Text="Label"></asp:Label>
       <span>审稿意见</span></p><br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="textbox">
            <Columns>
                <asp:BoundField DataField="expertID" HeaderText="专家号" Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="expertName,expertID" 
                    DataNavigateUrlFormatString="expertInfo.aspx?expertName={0}&amp;expertID={1}" 
                    DataTextField="expertName" HeaderText="专家名" 
                    NavigateUrl="~/author/expertInfo.aspx" Target="_blank">
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="docToTime" HeaderText="审稿时间" 
                    SortExpression="docToTime" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle HorizontalAlign="Center" Width="170px" />
                    <ItemStyle HorizontalAlign="Center" Width="170px" />
                </asp:BoundField>
                <asp:BoundField DataField="assessment" HeaderText="审稿意见" 
                    SortExpression="assessment">
                    <HeaderStyle HorizontalAlign="Center" Width="600px" />
                    <ItemStyle HorizontalAlign="Center" Width="600px" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                尚无专家审稿意见
            </EmptyDataTemplate>
        </asp:GridView>
   
   
        <p align="center"><a href="javascript:window.close()">关 闭</a></p> </td>
    </tr>
</table>
          </form>  
        </div>



</body>
</html>
