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

public partial class admin_alldocs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 2008; i < 2021; i++)
            {
                ddlyearF.Items.Add(Convert.ToString(i));
            }
            for (int k = 2020; k > 2008; k--)
            {
                ddlYearT.Items.Add(Convert.ToString(k));

            }
            for (int j = 1; j < 13; j++)
            {
                ddlMonthF.Items.Add(Convert.ToString(j));
                ddlMonthT.Items.Add(Convert.ToString(j));

            }

            GridviewBind();
        }

    }

    //5_1_a_s_p_x
    private void GridviewBind()
    {
        string timeF = ddlyearF.SelectedItem.Text + "-" + ddlMonthF.SelectedItem.Text + "-" + "1";
        string timeT = ddlYearT.SelectedItem.Text + "-" + ddlMonthT.SelectedItem.Text + "-" + "1";
        string title = txtdocTitle.Text;
        string column = ddlColumn.SelectedValue;
        string keyword = txtKeywords.Text;
        Doc dc = new Doc();
        DataSet ds = dc.AllDoc(title, column, keyword, timeF, timeT);
        lblCount.Text = Convert.ToString(ds.Tables[0].Rows.Count);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridviewBind();

    }
    protected void Bt_search_Click(object sender, EventArgs e)
    {
        GridviewBind();//5+1+a+s+p+x

    }
}
