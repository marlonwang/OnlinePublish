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

public partial class author_contribution2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Author author = new Author();
            author.LoadInfo(Request.Cookies["userID"].Value.ToString());
            txtName.Text = author.authorName;
            txtAddress.Text = author.authorAddress;
            TxtPostcode.Text = author.authorPost;
            txtCompany.Text = author.authorCompany;
            txtPhone.Text = author.authorPhone;
            txtMail.Text = author.authorMail;
        }

    }
    protected void Bt_update_Click(object sender, EventArgs e)
    {
        string userID = Request.Cookies["userID"].Value.ToString();
        string where = " where authorID=" + SQLString.GetQuotedString(userID);
        Hashtable ht = new Hashtable();
        ht.Add("authorName", SQLString.GetQuotedString(txtName.Text));
        ht.Add("authorMail", SQLString.GetQuotedString(txtMail.Text));
        ht.Add("authorPost", SQLString.GetQuotedString(TxtPostcode.Text));
        ht.Add("authorCompany", SQLString.GetQuotedString(txtCompany.Text));
        ht.Add("authorPhone", SQLString.GetQuotedString(txtPhone.Text));
        ht.Add("authorAddress", SQLString.GetQuotedString(txtAddress.Text));

        Author author = new Author();
        if (author.Update(ht, where))
        {
            Response.Write("<Script Language=JavaScript>alert(\"修改成功！\")</Script>");

        }


    }
}
