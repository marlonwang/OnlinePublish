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


public partial class author_sendmessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bt_send_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Hashtable ht = new Hashtable();
            ht.Add("messageFrom", SQLString.GetQuotedString("主编"));
            ht.Add("messageTo", SQLString.GetQuotedString(ddlColumn .SelectedValue));
            ht.Add("messageTime", SQLString.GetQuotedString(DateTime.Now.ToString()));
            ht.Add("messageTitle", SQLString.GetQuotedString(txtTitle.Text));
            ht.Add("messageContent", SQLString.GetQuotedString(txtContent.Text));
            ht.Add("messageState", SQLString.GetQuotedString("0"));

            Message msg = new Message();
            if (msg.NewMesg(ht))
            {
                Response.Write("<Script Language=JavaScript>alert(\"发送成功！\")</Script>");
            }
            else
            {
                Response.Write("<Script Language=JavaScript>alert(\"发送失败！\")</Script>");
            }
            txtContent.Text = "";
            txtTitle.Text = "";
        }
    }
}
