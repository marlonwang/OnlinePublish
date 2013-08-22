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
            Author author = new Author();
            author.LoadInfo(userID);
            txtName.Text = author.authorName;
            rblSex.SelectedValue = author.authorSex;
            txtBirth.Text = author.authorBirth;
            txtRegion.Text = author.authorRegion;
            txtMail.Text = author.authorMail;
            TxtPostcode.Text = author.authorPost;
            ddlDegree.SelectedValue = author.authorDegree;
            txtMajor.Text = author.authorMajor;
            txtTitle.Text = author.authorTitle;
            txtJob.Text = author.authorJob;
            txtCompany.Text = author.authorCompany;
            txtPhone.Text = author.authorPhone;
            txtAddress.Text = author.authorAddress;
            txtInfo.Text = author.authorInfo;
        }

    }
    protected void Bt_update_Click(object sender, EventArgs e)
    {
        string userID = Request.Cookies["userID"].Value.ToString();
        string where = " where authorID=" + SQLString.GetQuotedString(userID);
        Hashtable ht = new Hashtable();
        ht.Add("authorName", SQLString.GetQuotedString(txtName.Text));
        ht.Add("authorSex", SQLString.GetQuotedString(rblSex.SelectedValue));
        ht.Add("authorBirth", SQLString.GetQuotedString(txtBirth.Text));
        ht.Add("authorRegion", SQLString.GetQuotedString(txtRegion.Text));
        ht.Add("authorMail", SQLString.GetQuotedString(txtMail.Text));
        ht.Add("authorPost", SQLString.GetQuotedString(TxtPostcode.Text));
        ht.Add("authorDegree", SQLString.GetQuotedString(ddlDegree.SelectedValue));
        ht.Add("authorMajor", SQLString.GetQuotedString(txtMajor.Text));
        ht.Add("authorTitle", SQLString.GetQuotedString(txtTitle.Text));
        ht.Add("authorJob", SQLString.GetQuotedString(txtJob.Text));
        ht.Add("authorCompany", SQLString.GetQuotedString(txtCompany.Text));
        ht.Add("authorPhone", SQLString.GetQuotedString(txtPhone.Text));
        ht.Add("authorAddress", SQLString.GetQuotedString(txtAddress.Text));
        ht.Add("authorInfo", SQLString.GetQuotedString(txtInfo.Text));

        Author author = new Author();
        if (author.Update(ht, where))
        {
            Response.Write("<Script Language=JavaScript>alert(\"修改成功！\")</Script>");

        }

    }
}
