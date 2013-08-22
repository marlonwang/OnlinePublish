using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Attach
    {
        #region 私有成员

        private int _attachID;
        private string _attachFilename;
        private string _attachName;

        #endregion 私有成员

        #region 属性

        public int attachID
        {
            set
            {
                this._attachID = value;
            }
            get
            {
                return this._attachID;
            }
        }
        public string attachFilename
        {
            set
            {
                this._attachFilename = value;
            }
            get
            {
                return this._attachFilename;
            }
        }
        public string attachName
        {
            set
            {
                this._attachName = value;
            }
            get
            {
                return this._attachName;
            }
        }
        #endregion 属性

        #region

        public void Add(Hashtable file)
        {
            Database db = new Database();
            db.Insert("[attach]", file);

        }


        public void Delete(int ID)
        {
            string sql = "delete from attach where docID=" + SQLString.GetQuotedString(Convert.ToString(ID));
            Database db = new Database();
            db.ExecuteSQL(sql);

        }

        public DataRow  GetRow(int docID)
        {
            string sql = "select *  from attach where docID=" + SQLString.GetQuotedString(Convert.ToString(docID));
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            return dr;
        }

      
        #endregion
    }
}
