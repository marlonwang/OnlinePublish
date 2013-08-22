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

public partial class admin_editormaintain : System.Web.UI.Page
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
        string ID = txtexpertID.Text;
        string column = Dropcolumn.SelectedValue;
        string Name = txtexpertName.Text;
        Editor ed = new Editor();
        DataSet ds = ed.LoadInfo(ID, column, Name);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridviewBind();

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridviewBind();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string editor = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
        string column = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1")).SelectedValue;
        Editor ed = new Editor();
        if (ed.Update_Column(editor,column))
        {
            Response.Write("<script>alert('更新成功！');window.location=window.location;</script>");
        }
        else
        {
            Response.Write("<script>alert('更新失败！');window.location=window.location;</script>");
        }


    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string editor = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
        Editor ed = new Editor();
        if (ed.Delete(editor))
        {
            Response.Write("<script>alert('删除成功！');window.location=window.location;</script>");
        }
        else
        {
            Response.Write("<script>alert('删除失败！');window.location=window.location;</script>");
        }

    }

    protected void Bt_add_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Hashtable ht = new Hashtable();
            ht.Add("editorID", SQLString.GetQuotedString(txtID.Text));
            ht.Add("editorPwd", SQLString.GetQuotedString(txtID.Text));
            ht.Add("editorName", SQLString.GetQuotedString(txtName.Text));
            ht.Add("editorColumn", SQLString.GetQuotedString(ddlcolumn.SelectedValue));
            Editor ed = new Editor();
            ed.Adduser(ht);
            Response.Write("<script>alert('添加成功！');window.location=window.location;</script>");
            txtID.Text = "";
            txtName.Text = "";
        }

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridviewBind();
    }
    protected void Bt_search_Click(object sender, EventArgs e)
    {
        GridviewBind();
    }
}
