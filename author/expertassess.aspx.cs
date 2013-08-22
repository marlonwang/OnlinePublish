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
            Doc dc = new Doc();
            int id = Convert.ToInt32(Request.QueryString["docID"]);
            dc.Docload(id);
            lbldocTitle.Text = dc.docTitle;

            Assess ass = new Assess();
            DataSet ds = new DataSet();
            ds = ass.Loadassess(Convert.ToInt32(Request.QueryString["docID"]));
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();//5*1*a*s*p*x
        }

    }
}
