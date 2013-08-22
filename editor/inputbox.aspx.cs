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
            string editor = Request.Cookies["userID"].Value.ToString();
            Message msg = new Message();
            lblcount.Text = msg.Get_msgCount(editor);
        }

    }

    public void GridviewBind()
    {
        string ID = Request.Cookies["userID"].Value.ToString();
        Editor editor = new Editor();
        editor.LoadInfo(ID);
        string columnID = editor.editorColumn;
        Message msg = new Message();
        DataSet ds = msg.LoadMsg(columnID);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();

    }

    protected void CheckAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckItem");
            if (CheckAll.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }

        }

    }
    protected void Bt_delete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckItem");
            int msgID = Convert.ToInt32(GridView1.DataKeys[i].Value);
            if (cbox.Checked == true)
            {
                Message msg = new Message();
                msg.Delete_msg(msgID);
                Response.Write("<Script Language=JavaScript>alert(\"删除成功！\")</Script>");
            }
            GridviewBind();
        }

    }
    protected void Bt_cancel_Click(object sender, EventArgs e)
    {
        CheckAll.Checked = false;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckItem");
            cbox.Checked = false;
        }

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
