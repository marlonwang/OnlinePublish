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
        string adminID = txtUserID.Text;
        string adminPwd = txtUserPwd.Text;
        Admin admin = new Admin();
        int flag = admin.Login(adminID, adminPwd);
        if (flag == 1)
        {
            Response.Cookies["userID"].Value = txtUserID.Text;
            Response.Cookies["userID"].Expires = DateTime.Now.AddDays(7);
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
