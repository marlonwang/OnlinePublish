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

public partial class author_contribution1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bt_next_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Session["docTitle"] = txtTitle.Text;
            Session["docTitleEn"] = txttitleEN.Text;
            Session["docAbstract"] = txtAbstract.Text;
            Session["docAbstractEn"] = txtAbstractEN.Text;
            Session["docKeywords"] = txtKeyword.Text;
            Session["docKeywordsEn"] = txtKeywordEN.Text;
            Session["docLetters"] = txtLetters.Text;
            Session["docAuthor"] = txtAuthorInfo.Text;
            Session["docColumnID"] = dddlColumn.Text;

            Response.Redirect("contribution2.aspx");
        }

    }
}
