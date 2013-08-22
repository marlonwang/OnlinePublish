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

public partial class editor_authorlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridviewBind();
        }
    }

    private void GridviewBind()
    {
        Editor ed = new Editor();
        ed.LoadInfo(Request.Cookies["userID"].Value.ToString());
        string column = ed.editorColumn;
        string title = txtdocTitle.Text;
        string author = txtauthorID.Text;
        string state = "11";
        Doc dc = new Doc();
        DataSet ds = dc.editorload(column, title, author, state);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridviewBind();

    }

    protected void Bt_search_Click(object sender, EventArgs e)
    {
        GridviewBind();

    }
}
