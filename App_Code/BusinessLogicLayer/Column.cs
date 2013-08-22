using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Column
    {
        #region 私有成员

        private string _columnID;
        private string _columnName;
        private string _columnInfo;

        #endregion 私有成员

        #region 属性

        public string columnID
        {
            set
            {
                this._columnID = value;
            }
            get
            {
                return this._columnID;
            }
        }
        public string columnName
        {
            set
            {
                this._columnName = value;
            }
            get
            {
                return this._columnName;
            }
        }
        public string columnInfo
        {
            set
            {
                this._columnInfo = value;
            }
            get
            {
                return this._columnInfo;
            }
        }

        #endregion 属性

        #region  方法

        public bool  Addcolumn(Hashtable userInfo)
        {
            Database db = new Database();
            if (db.Insert("[column]", userInfo))
            {
                return true;
            }
            return false;
        }

        public DataSet LoadInfo()
        {
            string sql = "select * from [column] order by columnID asc";
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
        }

        public void Delete(string ID)
        {
            string sql = "delete from [column] where columnID=" + SQLString.GetQuotedString(ID);
            Database db = new Database();
            db.ExecuteSQL(sql);
        }

        #endregion 方法
    }
}
