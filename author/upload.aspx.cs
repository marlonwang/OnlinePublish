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

public partial class author_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bt_upload_Click(object sender, EventArgs e)
    {
        int docID = Convert.ToInt32(Request.QueryString["docID"]);
        if (FileUpload1.HasFile)
        {
            string name = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
            string type = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf(".") + 1);            //获取上传文件的后缀 
            string filename = name + "." + type;
            if (type == "doc")
            {

                if (FileUpload1.FileName != "")
                {
                    String path = Server.MapPath("~/upfiles/" + filename);
                    FileUpload1.PostedFile.SaveAs(path);

                    Attach attach = new Attach();
                    attach.Delete(docID);
                    Hashtable ht = new Hashtable();
                    ht.Add("attachFilename", SQLString.GetQuotedString(FileUpload1.FileName));
                    ht.Add("attachName", SQLString.GetQuotedString(filename));
                    ht.Add("docID", SQLString.GetQuotedString(Convert.ToString(docID)));
                    attach.Add(ht);

                    Doc dc = new Doc();
                    dc.Docload(docID);
                    string docState = dc.docState;
                    string state = "";
                    if (docState == "12")
                    {
                        state = "11";
                    }
                    if (docState == "22")
                    {
                        state = "25";
                    }

                    dc.Update_attach(docID, state);
                }

                Response.Write("<script language='javascript'>alert('上传成功！');window.location='modifylist.aspx'</script>");

            }
            else
            {
                Response.Write("<script language='javascript'>alert('对不起，目前只接受.doc格式文档，请重新上传！')</script>");
            }
        }
    }
    
}
