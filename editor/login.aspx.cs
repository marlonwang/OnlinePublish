using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using management.BusinessLogicLayer;
using management.DataAccessHelper;

public partial class author_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bt_login_Click(object sender, EventArgs e)
    {
        string editorID = txtUserID.Text;
        string editorPwd = txtUserPwd.Text;
        Editor editor = new Editor();
        int flag = editor.Login(editorID, editorPwd);
        if (flag == 1)
        {
            editor.LoadInfo(editorID);
            Response.Cookies["userID"].Value = txtUserID.Text;
            Response.Cookies["userID"].Expires = DateTime.Now.AddDays(7);
            Response.Cookies["userName"].Value = editor.editorName;
            Response.Cookies["userName"].Expires = DateTime.Now.AddDays(7);
            Response.Cookies["editorColumn"].Value = editor.editorColumn;
            Response.Cookies["editorColumn"].Expires = DateTime.Now.AddDays(7);
            Response.Cookies["userPwd"].Value = txtUserPwd.Text;
            Response.Cookies["userPwd"].Expires = DateTime.Now.AddDays(7);
            Response.Redirect("main.htm");
        }
        else if (flag == -1)
        {
            Response.Write("<Script Language=JavaScript>alert(\"密码错误！\")</Script>");
        }
        else if (flag == 0)
        {
            Response.Write("<Script Language=JavaScript>alert(\"用户名不存在！\")</Script>");
        }

    }

    protected void Bt_reset_Click(object sender, EventArgs e)
    {
        txtUserID.Text = "";
        txtUserPwd.Text = "";
    }
}
