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
            Expert expert = new Expert();
            expert.LoadInfo(userID);
            txtName.Text = expert.expertName;
            rblSex.SelectedValue = expert.expertSex;
            txtMail.Text = expert.expertMail;
            txtPhone.Text = expert.expertPhone;
            txtAddress.Text = expert.expertAddress;
            txtInfo.Text = expert.expertInfo;
            ddlcolumn.SelectedValue = expert.expertColumn;
        }

    }
    protected void Bt_update_Click(object sender, EventArgs e)
    {
        string userID = Request.Cookies["userID"].Value.ToString();
        string where = " where editorID=" + SQLString.GetQuotedString(userID);
        Hashtable ht = new Hashtable();
        ht.Add("expertName", SQLString.GetQuotedString(txtName.Text));
        ht.Add("expertSex", SQLString.GetQuotedString(rblSex.SelectedValue));
        ht.Add("expertMail", SQLString.GetQuotedString(txtMail.Text));
        ht.Add("expertPhone", SQLString.GetQuotedString(txtPhone.Text));
        ht.Add("expertAddress", SQLString.GetQuotedString(txtAddress.Text));
        ht.Add("expertInfo", SQLString.GetQuotedString(txtInfo.Text));

        Expert expert = new Expert();
        if (expert.Update(ht, where))
        {
            Response.Write("<Script Language=JavaScript>alert(\"修改成功！\")</Script>");

        }

    }
}
