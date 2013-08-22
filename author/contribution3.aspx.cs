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

public partial class author_contribution3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bt_upload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string oldname = FileUpload1.FileName;
            string type = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf(".") + 1);            //获取上传文件的后缀     
            string filename = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + "." + type;

            if (type == "doc")
            {

                if (FileUpload1.FileName != "")
                {
                    //更改上传文件名     

                    String path = Server.MapPath("~/upfiles/" + filename);
                    FileUpload1.PostedFile.SaveAs(path);
                }


                string author = Request.Cookies["userID"].Value.ToString();
                string state = "0";

                Hashtable docHt = new Hashtable();
                docHt.Add("docTime", SQLString.GetQuotedString(DateTime.Now.ToString()));
                docHt.Add("docTitle", SQLString.GetQuotedString(Session["docTitle"].ToString()));
                docHt.Add("docTitleEn", SQLString.GetQuotedString(Session["docTitleEn"].ToString()));
                docHt.Add("docAbstract", SQLString.GetQuotedString(Session["docAbstract"].ToString()));
                docHt.Add("docAbstractEn", SQLString.GetQuotedString(Session["docAbstractEn"].ToString()));
                docHt.Add("docKeywords", SQLString.GetQuotedString(Session["docKeywords"].ToString()));
                docHt.Add("docKeywordsEn", SQLString.GetQuotedString(Session["docKeywordsEn"].ToString()));
                docHt.Add("docLetters", SQLString.GetQuotedString(Session["docLetters"].ToString()));
                docHt.Add("docAuthor", SQLString.GetQuotedString(Session["docAuthor"].ToString()));
                docHt.Add("docColumnID", SQLString.GetQuotedString(Session["docColumnID"].ToString()));
                docHt.Add("authorID", SQLString.GetQuotedString(author));
                docHt.Add("docState", SQLString.GetQuotedString(state));

                Doc dc = new Doc();
                dc.Add(docHt);
                int docID = dc.GetID(author);

                Hashtable ht = new Hashtable();
                ht.Add("attachFilename", SQLString.GetQuotedString(oldname));
                ht.Add("attachName", SQLString.GetQuotedString(filename));
                ht.Add("docID", SQLString.GetQuotedString(Convert.ToString(docID)));
                Attach attach = new Attach();
                attach.Add(ht);


                Response.Write("<script language='javascript'>alert('投稿成功，谢谢您对本刊的支持！')</script>");
                Response.Write("<script>window.location='contribution1.aspx';</script>");

            }
            else
            {
                Response.Write("<script language='javascript'>alert('对不起，目前只接受.doc格式文档，请重新上传！')</script>");
            }


        }
    }
    

    protected void Bt_cancel_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("contribution1.aspx");
    }
}