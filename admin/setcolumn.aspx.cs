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


public partial class admin_setcolumn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GridviewBind();
        }

    }

    private void GridviewBind()
    {
        Column col = new Column();
        DataSet ds = col.LoadInfo();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Bt_add_Click(object sender, EventArgs e)
    {
        Hashtable ht = new Hashtable();
        ht.Add("columnID", SQLString.GetQuotedString(txtcolumnID.Text));
        ht.Add("columnName", SQLString.GetQuotedString(txtcolumnName.Text));
        Column col = new Column();
        if (col.Addcolumn(ht))
        {
            Response.Write("<script>alert('添加成功！');window.location=window.location;</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败！');window.location=window.location;</script>");
        }
        txtcolumnID.Text = "";
        txtcolumnName.Text = "";

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string ID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        Column col = new Column();
        col.Delete(ID);
        Response.Write("<script>alert('删除成功！');window.location=window.location;</script>");

    }
}
