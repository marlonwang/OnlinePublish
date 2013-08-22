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

public partial class admin_expertmaintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bt_add_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Editor ed = new Editor();
            ed.LoadInfo(Request.Cookies["userID"].Value.ToString());
            string column = ed.editorColumn;

            Hashtable ht = new Hashtable();
            ht.Add("expertID", SQLString.GetQuotedString(txtID.Text));
            ht.Add("expertPwd", SQLString.GetQuotedString(txtID.Text));//51(aspx)
            ht.Add("expertName", SQLString.GetQuotedString(txtName.Text));
            ht.Add("expertColumn", SQLString.GetQuotedString(column));
            Expert ep = new Expert();
            if (ep.Add(ht))
            {
                Response.Write("<script>alert('添加成功！');window.location=window.location;</script>");
            }
            else
            {

                Response.Write("<script>alert('添加失败！');window.location=window.location;</script>");
            }
            txtID.Text = "";
            txtName.Text = "";
        }

    }
}
