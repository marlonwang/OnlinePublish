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
            int docID = Convert.ToInt32(Request.QueryString["docID"]);
            Doc dc = new Doc();
            dc.Docload(docID);
            txtTitle.Text = dc.docTitle;

            Assess ass = new Assess();
            DataSet ds = new DataSet();
            ds = ass.Loadassess(docID);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
        }
            if (ddlState.SelectedValue != "21")
            {
                RequiredFieldValidator1.Enabled = true;
            }
            else
            {
                RequiredFieldValidator1.Enabled = false;
            }
        
    }
    protected void Bt_ok_Click(object sender, EventArgs e)
    {
        string where = " where docID=" + SQLString.GetQuotedString(Request.QueryString["docID"]);
        string state = ddlState.SelectedValue;
        Hashtable ht = new Hashtable();
        ht.Add("docState", SQLString.GetQuotedString(state));
        ht.Add("docReason", SQLString.GetQuotedString(txtdocReason.Text));
        Doc dc = new Doc();
        if (dc.Update(ht, where))
        {
            Response.Write("<script>alert('审核完毕！');window.location='expertlist.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('审核失败！');window.location='expertlist.aspx';</script>");
        }
    }

 
   
}
