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

public partial class author_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Author author = new Author();
        if (author.CheckUser(txtID.Text))
        {
            Response.Write("<Script Language=JavaScript>alert(\"恭喜该用户名可用！\")</Script>");

        }
        else
        {
            Response.Write("<Script Language=JavaScript>alert(\"该用户名已注册！\")</Script>");

        }

    }
    protected void Bt_register_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Hashtable ht = new Hashtable();
            ht.Add("authorID", SQLString.GetQuotedString(txtID.Text));
            ht.Add("authorPwd", SQLString.GetQuotedString(txtPwd.Text));
            ht.Add("authorName", SQLString.GetQuotedString(txtName.Text));
            ht.Add("authorSex", SQLString.GetQuotedString(rblSex.SelectedValue));
            ht.Add("authorBirth", SQLString.GetQuotedString(txtBirth.Text));
            ht.Add("authorRegion", SQLString.GetQuotedString(txtRegion.Text));
            ht.Add("authorPost", SQLString.GetQuotedString(TxtPostcode.Text));
            ht.Add("authorMail", SQLString.GetQuotedString(txtMail.Text));
            ht.Add("authorDegree", SQLString.GetQuotedString(dddlDegree.SelectedValue));
            ht.Add("authorMajor", SQLString.GetQuotedString(txtMajor.Text));
            ht.Add("authorTitle", SQLString.GetQuotedString(txtTitle.Text));
            ht.Add("authorJob", SQLString.GetQuotedString(txtJob.Text));
            ht.Add("authorCompany", SQLString.GetQuotedString(txtCompany.Text));
            ht.Add("authorPhone", SQLString.GetQuotedString(txtPhone.Text));
            ht.Add("authorAddress", SQLString.GetQuotedString(txtAddress.Text));
            ht.Add("authorInfo", SQLString.GetQuotedString(txtInfo.Text));
            Author author = new Author();
            if (author.Add(ht))
            {
                Response.Write("<script>alert('注册成功！');window.location='login.aspx';</script>");
            }
            else
            {
                Response.Write("<Script Language=JavaScript>alert(\"注册失败！\")</Script>");
            }
        }

    }
}
