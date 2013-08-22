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

public partial class expert_assessement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string expert = Request.Cookies["userID"].Value.ToString();
            int docID = Convert.ToInt32(Request.QueryString["docID"]);
            Doc dc = new Doc();
            dc.Docload(docID);
            Label1.Text = dc.docTitle;
            DataRow dr = dc.viewassess(expert, docID);
            lblAssessment.Text = dr[0].ToString();
        }

    }
}
