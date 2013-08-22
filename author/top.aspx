<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="author_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>顶部</title>
    <STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #2a8dc8
}
BODY {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
TD {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
DIV {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
P {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.STYLE1 {
	color: #000000;
	font-weight: bold;
}

</STYLE>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width=10><IMG src="../images/new_001.jpg" border=0></TD>
    <TD background=../images/new_002.jpg><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td height="35" valign="bottom"><FONT size=4><B>  长江大学期刊社在线投稿系统 管理中心</B></FONT></td>
          </tr>
        <tr>
          <td height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbluserName" runat="server"></asp:Label>
              您好！&nbsp;欢迎使用长江大学期刊社在线投稿系统&nbsp;&nbsp;&nbsp; <a class="STYLE1" href="#" language="javascript" onclick="if (confirm('确认要离开本系统?')){;href='../Default.aspx';target='_top';}">   安全退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE2">日期：</span><font color="#666666">
            <script language="JavaScript" type="text/javascript">
<!---
today=new Date();
var hours = today.getHours();
var minutes = today.getMinutes();
var seconds = today.getSeconds();
function initArray(){
this.length=initArray.arguments.length
for(var i=0;i<this.length;i++)
this[i+1]=initArray.arguments[i] }
var d=new initArray("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
document.write(today.getYear(),"年",today.getMonth()+1,"月",today.getDate(),"日 ",d[today.getDay()+1]," ");
//-->
    </script>
            </font></td>
          </tr>
        </tbody>
    </table></TD>
    <TD width=10><IMG src="../images/new_003.jpg" 
border=0></TD></TR></TBODY></TABLE>
    </div>
    </form>
</body>
</html>
