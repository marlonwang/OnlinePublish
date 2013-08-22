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


public partial class admin_boardlist : System.Web.UI.Page
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
        string title = txtdocTitle.Text;
        string author = txtauthorID.Text;
        Board bd = new Board();
        DataSet ds = bd.Asign_board(title,author);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridviewBind();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int docID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        string rank = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
        string money = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;//5%1%a%s%p%x
        string state = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlstate")).SelectedValue;
        Board bd = new Board();
        if (bd.Update_board(docID, rank, money, state))
        {
            Response.Write("<script>alert('更新成功！');window.location=window.location;</script>");
        }
        else
        {
            Response.Write("<script>alert('更新失败！');window.location=window.location;</script>");
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridviewBind();
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
