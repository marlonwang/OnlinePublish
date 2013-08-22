using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Doc
    {
        #region 私有成员

        private int _docID;
        private DateTime _docTime;
        private string _docTitle;
        private string _docTitleEn;
        private string _docAbstract;
        private string _docAbstractEn;
        private string _docKeywords;
        private string _docKeywordsEn;
        private int _docLetters;
        private string _docAuthor;
        private string _docColumnID;
        private string _authorID;
        private string _docState;
        private string _docReason;
        #endregion 私有成员

        #region 属性

        public int docID
        {
            set
            {
                this._docID = value;
            }
            get
            {
                return this._docID;
            }
        }
        public DateTime docTime
        {
            set
            {
                this._docTime = value;
            }
            get
            {
                return this._docTime;
            }
        }
        public string docTitle
        {
            set
            {
                this._docTitle = value;
            }
            get
            {
                return this._docTitle;
            }
        }
        public string docTitleEn
        {
            set
            {
                this._docTitleEn = value;
            }
            get
            {
                return this._docTitleEn;
            }
        }
        public string docAbstract
        {
            set
            {
                this._docAbstract = value;
            }
            get
            {
                return this._docAbstract;
            }
        }
        public string docAbstractEn
        {
            set
            {
                this._docAbstractEn = value;
            }
            get
            {
                return this._docAbstractEn;
            }
        }
        public string docKeywords
        {
            set
            {
                this._docKeywords = value;
            }
            get
            {
                return this._docKeywords;
            }
        }
        public string docKeywordsEn
        {
            set
            {
                this._docKeywordsEn = value;
            }
            get
            {
                return this._docKeywordsEn;
            }
        }
        public int docLetters
        {
            set
            {
                this._docLetters = value;
            }
            get
            {
                return this._docLetters;
            }
        }
        public string docAuthor
        {
            set
            {
                this._docAuthor = value;
            }
            get
            {
                return this._docAuthor;
            }
        }
        public string docColumnID
        {
            set
            {
                this._docColumnID = value;
            }
            get
            {
                return this._docColumnID;
            }
        }
        public string authorID
        {
            set
            {
                this._authorID = value;
            }
            get
            {
                return this._authorID;
            }
        }
        public string docState
        {
            set
            {
                this._docState = value;
            }
            get
            {
                return this._docState;
            }
        }
        public string docReason
        {
            set
            {
                this._docReason = value;
            }
            get
            {
                return this._docReason;
            }
        }
        #endregion 属性

        #region 方法

        public void Add(Hashtable Document)  //添加稿件信息
        {
            Database db = new Database();
            db.Insert("[document]", Document);
        }
        public bool Update(Hashtable document, string Xwhere)  //更新稿件信息
        {

            Database db = new Database();
            if (db.Update("[document]", document, Xwhere))
            {
                return true;
            }
            return false;
        }
        public void Docload(int docID)  //加载稿件信息
        {
            string sql = "select * from document where docID=" + SQLString.GetQuotedString(Convert.ToString(docID));
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                this._docID = GetSafeData.ValidateDataRow_N(dr, "docID");
                this._docTime = GetSafeData.ValidateDataRow_T(dr, "docTime");
                this._docTitle = GetSafeData.ValidateDataRow_S(dr, "docTitle");
                this._docTitleEn = GetSafeData.ValidateDataRow_S(dr, "docTitleEn");
                this._docAbstract = GetSafeData.ValidateDataRow_S(dr, "docAbstract");
                this._docAbstractEn = GetSafeData.ValidateDataRow_S(dr, "docAbstractEn");
                this._docKeywords = GetSafeData.ValidateDataRow_S(dr, "docKeywords");
                this._docKeywordsEn = GetSafeData.ValidateDataRow_S(dr, "docKeywordsEn");
                this._docLetters = GetSafeData.ValidateDataRow_N(dr, "docLetters");
                this._docAuthor = GetSafeData.ValidateDataRow_S(dr, "docAuthor");
                this._docColumnID = GetSafeData.ValidateDataRow_S(dr, "docColumnID");
                this._authorID = GetSafeData.ValidateDataRow_S(dr, "authorID");
                this._docState = GetSafeData.ValidateDataRow_S(dr, "docState");
                this._docReason = GetSafeData.ValidateDataRow_S(dr, "docReason");
            }

        }
        public DataSet editorload(string editor, string title, string author, string state)  //根据投稿栏目加载编辑稿件信息
        {
            string sql = "";
            if (state != "")
            {
                sql = "select document.*,attach.* from document,attach where document.docID=attach.docID and docState=" + SQLString.GetQuotedString(state) + " and document.docColumnID=" + SQLString.GetQuotedString(editor);
            }
            else
            {
                sql = "select document.*,attach.*,state.stateText from document,attach,state where document.docID=attach.docID and document.docState=state.stateID and docState !=" + SQLString.GetQuotedString("0") + " and document.docColumnID=" + SQLString.GetQuotedString(editor);
            }
            if (title != "")
            {
                sql += "and docTitle like '%" + title + "%'";

            }
            if (author != "")
            {
                sql += "and authorID like '%" + author + "%'";

            }

            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
        }
        public int GetID(string authorID) //获取最后投稿的稿件编号
        {
            int ID;
            string sql = "select docID from document where  authorID=" + SQLString.GetQuotedString(authorID) + "order by docTime desc";
            Database db = new Database();
            SqlDataReader sdr = db.GetDataReader(sql);
            if (sdr.Read())
            {
                ID = sdr.GetInt32(0);
                return ID;

            }
            return -1;
        }
        public DataSet expertload(string expert, string title, string author, int assess)  //专家审核稿件 assess为0 未审稿件，否则为已审稿件
        {
            string sql;
            if (assess == 0)
            {
                sql = "select document.docID,document.docTitle,docTime,document.authorID,attach.attachName,assess.expertID from document,attach,assess where document.docID=attach.docID and document.docID=assess.docID and assess.expertID=" + SQLString.GetQuotedString(expert) + "and assess.assessment is null";
            }
            else
            {
                sql = "select document.docID,document.docTitle,docTime,document.authorID,attach.attachName,assess.expertID,assess.assessment from document,attach,assess where document.docID=attach.docID and document.docID=assess.docID and assess.expertID=" + SQLString.GetQuotedString(expert) + "and assess.assessment is not null";
            }
            if (title != "")
            {
                sql += " and docTitle like '%" + title + "%'";

            }
            if (author != "")
            {
                sql += " and authorID like '%" + author + "%'";

            }

            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;

        }
        public DataRow viewassess(string expert, int docID)  //查看专家审稿意见
        {
            string sql = "select assessment from assess where docID=" + SQLString.GetQuotedString(Convert.ToString(docID)) + "and expertID=" + SQLString.GetQuotedString(expert);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            return dr;
        }
        public DataSet adminload(string title, string author, string state)  //主编未审稿件信息
        {
            string sql = "";
            if (state == "")
            {
                sql = "select document.*,attach.* from document,attach where document.docID=attach.docID and docState !=" + SQLString.GetQuotedString(state) + " and docState like '2_'";
            }
            else
            {
               sql = "select document.*,attach.* from document,attach where document.docID=attach.docID and docState=" + SQLString.GetQuotedString(state);
            }
            if (title != "")
            {
                sql += "and docTitle like '%" + title + "%'";

            }
            if (author != "")
            {
                sql += "and authorID like '%" + author + "%'";

            }
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;

        }
        public DataSet LoadRepairdoc(string author) //加载作者返修稿件
        {
            string sql = " SELECT [document].docID, [document].docTime, [document].docTitle, [document].docReason, state.stateText FROM document,state where [document].docState = state.stateID and docState like " + SQLString.GetQuotedString("_2") + "and authorID=" + SQLString.GetQuotedString(author);
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
        }
        public void Update_attach(int docID, string state)  //上传返修稿件后更改状态
        {
            string sql = "update document set docState=" + SQLString.GetQuotedString(state) + "where docID=" + SQLString.GetQuotedString(Convert.ToString(docID));
            Database db = new Database();
            db.ExecuteSQL(sql);
        }
        public DataSet AllDoc(string title, string column, string Keywords, string timeF, string timeT)  //稿件统计信息
        {
            string sql = "SELECT [document].docID,[document].docTime, [document].docTitle, [document].docKeywords, [document].authorID, [column].columnName,attach.attachName FROM [column],[document],[attach] where document.docID=attach.docID and [column].columnID = [document].docColumnID and [document].docTime between " + SQLString.GetQuotedString(timeF) + "and " + SQLString.GetQuotedString(timeT);
            if (title != "")
            {
                sql += "and docTitle like '%" + title + "%'";

            }
            if (column != "")
            {
                sql += "and docColumnID like '%" + column + "%'";

            }
            if (Keywords != "")
            {
                sql += "and docTitle like '%" + Keywords + "%'";

            }
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;

        }
        #endregion
    }
}
