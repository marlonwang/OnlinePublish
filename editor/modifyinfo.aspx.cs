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

public partial class author_modifyinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string userID = Request.Cookies["userID"].Value.ToString();
            Editor editor = new Editor();
            editor.LoadInfo(userID);
            txtName.Text = editor.editorName;
            rblSex.SelectedValue = editor.editorSex;
            txtMail.Text = editor.editorMail;
            txtPhone.Text = editor.editorPhone;
            txtAddress.Text = editor.editorAddress;
            txtInfo.Text = editor.editorInfo;
            ddlcolumn.SelectedValue = editor.editorColumn;
        }

    }
    protected void Bt_update_Click(object sender, EventArgs e)
    {
        string userID = Request.Cookies["userID"].Value.ToString();
        string where = " where editorID=" + SQLString.GetQuotedString(userID);
        Hashtable ht = new Hashtable();
        ht.Add("editorName", SQLString.GetQuotedString(txtName.Text));
        ht.Add("editorSex", SQLString.GetQuotedString(rblSex.SelectedValue));
        ht.Add("editorMail", SQLString.GetQuotedString(txtMail.Text));
        ht.Add("editorPhone", SQLString.GetQuotedString(txtPhone.Text));
        ht.Add("editorAddress", SQLString.GetQuotedString(txtAddress.Text));
        ht.Add("editorInfo", SQLString.GetQuotedString(txtInfo.Text));

        Editor editor = new Editor();
        if (editor.Update(ht, where))
        {
            Response.Write("<Script Language=JavaScript>alert(\"修改成功！\")</Script>");

        }

    }
}
