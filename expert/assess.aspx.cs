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
using management.DataAccessHelper;
using management.BusinessLogicLayer;

public partial class editor_assess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            int docID =Convert.ToInt32( Request.QueryString["docID"]);
            Doc dc = new Doc();
            dc.Docload(docID);
            txtTitle.Text = dc.docTitle;
            txtAbstract.Text = dc.docAbstract;
            txtKeyword.Text = dc.docKeywords;
            txtLetters.Text = dc.docLetters.ToString();
            txtAuthorInfo.Text = dc.docAuthor;
            
        }
    }
    protected void Bt_ok_Click(object sender, EventArgs e)
    {
        string xwhere = " where docID=" + SQLString.GetQuotedString(Request.QueryString["docID"]) + "and expertID=" + SQLString.GetQuotedString(Request.Cookies["userID"].Value.ToString());
        Hashtable ht = new Hashtable();
        ht.Add("assessment", SQLString.GetQuotedString(txtdocReason.Text));
        ht.Add("docToTime", SQLString.GetQuotedString(DateTime.Now.ToShortDateString()));
        Assess ass = new Assess();
        if (ass.Update(ht, xwhere))
        {
            Response.Write("<script>alert('审核完毕！');window.location='newdoclist.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('审核失败！');window.location='newdoclist.aspx';</script>");
        }

    }

   

 }
