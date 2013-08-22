using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Assess
    {
        #region 私有成员

        private int _assessID;
        private int _docID;
        private DateTime _docFromTime;
        private DateTime _docToTime;
        private string _expertID;
        private string _assessment;

        #endregion 私有成员

        #region 属性

        public int assessID
        {
            set
            {
                this._assessID = value;
            }
            get
            {
                return this._assessID;
            }
        }
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
        public DateTime docFromTime
        {
            set
            {
                this._docFromTime = value;
            }
            get
            {
                return this._docFromTime;
            }
        }
        public DateTime docToTime
        {
            set
            {
                this._docToTime = value;
            }
            get
            {
                return this._docToTime;
            }
        }
        public string expertID
        {
            set
            {
                this._expertID = value;
            }
            get
            {
                return this._expertID;
            }
        }
        public string assessment
        {
            set
            {
                this._assessment = value;
            }
            get
            {
                return this._assessment;
            }
        }

        #endregion 属性

        public void AsignExp(Hashtable ht)
        {
            Database db = new Database();
            db.Insert("[assess]", ht);
        }

        public DataSet Loadassess(int docID)
        {
            string sql = "select assess.*,expert.expertName,expert.expertID from assess,expert where assess.expertID=expert.expertID and assess.docID=" + SQLString.GetQuotedString(Convert.ToString(docID));
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
        }

        public bool Update(Hashtable ht, string Xwhere)
        {

            Database db = new Database();
            if (db.Update("[assess]", ht, Xwhere))
            {
                return true;
            }
            return false;
        }

        public void Delete(int docID)
        {
            string sql = "delete from assess where docID=" + SQLString.GetQuotedString(Convert.ToString(docID));
            Database db = new Database();
            db.ExecuteSQL(sql);
        }


    }
}