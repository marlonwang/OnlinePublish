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
            int docID =Convert.ToInt32( Request.QueryString["docID"]);
            Doc dc = new Doc();
            dc.Docload(docID);
            txtTitle.Text = dc.docTitle;
            txtAbstract.Text = dc.docAbstract;
            txtKeyword.Text = dc.docKeywords;
            txtLetters.Text = dc.docLetters.ToString();
            txtAuthorInfo.Text = dc.docAuthor;
            
        }
        if (DropDownList1.SelectedValue != "11")
        {
            CheckBoxList1.Visible = false;
            RequiredFieldValidator1.Enabled = true;
        }
        else
        {
            CheckBoxList1.Visible = true;
            RequiredFieldValidator1.Enabled = false;
        }
    }
    protected void Bt_ok_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "11")
        {
            SendExp(Convert.ToInt32(Request.QueryString["docID"]));
        }
        string where = " where docID=" + SQLString.GetQuotedString(Request.QueryString["docID"]);
        string state = DropDownList1.SelectedValue;
        Hashtable Ht = new Hashtable();
        Ht.Add("docState", SQLString.GetQuotedString(state));
        Ht.Add("docReason", SQLString.GetQuotedString(txtdocReason.Text));
        Doc dc = new Doc();
        if (dc.Update(Ht, where))
        {
            Response.Write("<script>alert('审核完毕！');window.location='authorlist.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('审核失败！');window.location='authorlist.aspx';</script>");
        }

    }

    private void SendExp(int docID)
    {
        int i = 0;
        foreach (ListItem item in CheckBoxList1.Items)
        {
            if (item.Selected == true)
            {
                i++;
            }
        }
        if (i != 3)
        {
            Response.Write("<Script Language=JavaScript>alert(\"请选择三位专家评审！\")</Script>");
        }

        else
        {
            string[] arr = new string[CheckBoxList1.Items.Count];
            for (int j = 0; j < CheckBoxList1.Items.Count; j++)
            {
                if (CheckBoxList1.Items[j].Selected == true)
                {
                    arr[i] = CheckBoxList1.Items[j].Value;
                    Hashtable ht = new Hashtable();
                    ht.Add("expertID", SQLString.GetQuotedString(arr[i]));
                    ht.Add("docID", SQLString.GetQuotedString(Convert.ToString(docID)));
                    Assess ass = new Assess();
                    ass.AsignExp(ht);
                }

            }
        }

    }
}
