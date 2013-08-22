<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assessement.aspx.cs" Inherits="expert_assessement" %>

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
           <p align="center" class="subtitle" >  <asp:Label ID="Label1" runat="server" 
                   Text="Label"></asp:Label>
       <span>审稿意见</span></p><br />
    
    <p>
        <asp:Label ID="lblAssessment" runat="server" Height="200px" Width="600px" 
            CssClass="textbox"></asp:Label>
    </p>
   
   
        <p align="center"><a href="javascript:window.close()">关 闭</a></p> </td>
    </tr>
</table>
          </form>  
        </div>



</body>
</html>
