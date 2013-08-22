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

public partial class author_inputbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridviewBind();
            string author = Request.Cookies["userID"].Value.ToString();
            Message msg = new Message();
            lblcount.Text = msg.Get_msgCount(author);
        }

    }

    public void GridviewBind()
    {
        string author = Request.Cookies["userID"].Value.ToString();
        Message msg = new Message();
        DataSet ds = msg.LoadMsg(author);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();

    }

  

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int msgID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        Message msg = new Message();
        msg.Delete_msg(msgID);
        Response.Write("<Script Language=JavaScript>alert(\"删除成功！\");window.location='inputbox.aspx';</Script>");


    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridviewBind();

    }
}
