using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Expert
    {
        #region 私有成员

        private string _expertID;
        private string _expertPwd;
        private string _expertName;
        private string _expertSex;
        private string _expertColumn;
        private string _expertPhone;
        private string _expertMail;
        private string _expertAddress;
        private string _expertInfo;

        #endregion 私有成员

        #region 属性

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
        public string expertPwd
        {
            set
            {
                this._expertPwd = value;
            }
            get
            {
                return this._expertPwd;
            }
        }
        public string expertName
        {
            set
            {
                this._expertName = value;
            }
            get
            {
                return this._expertName;
            }
        }
        public string expertSex
        {
            set
            {
                this._expertSex = value;
            }
            get
            {
                return this._expertSex;
            }
        }
        public string expertColumn
        {
            set
            {
                this._expertColumn = value;
            }
            get
            {
                return this._expertColumn;
            }
        }
        public string expertPhone
        {
            set
            {
                this._expertPhone = value;
            }
            get
            {
                return this._expertPhone;
            }
        }
        public string expertMail
        {
            set
            {
                this._expertMail = value;
            }
            get
            {
                return this._expertMail;
            }
        }
        public string expertAddress
        {
            set
            {
                this._expertAddress = value;
            }
            get
            {
                return this._expertAddress;
            }
        }
        public string expertInfo
        {
            set
            {
                this._expertInfo = value;
            }
            get
            {
                return this._expertInfo;
            }
        }

        #endregion 属性

        #region 方法

        public bool CheckUser(string expertID)
        {
            string sql = "select * from expert where expertID=" + SQLString.GetQuotedString(expertID);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                return false;
            }
            return true;
        }

        public bool Add(Hashtable userInfo)
        {
            Database db = new Database();
            if (db.Insert("[expert]", userInfo))
            {
                return true;
            }
            return false;

        }

        public int Login(string expertID, string expertPwd)
        {
            string sql = "select * from expert where expertID=" + SQLString.GetQuotedString(expertID);
            Database db = new Database();
            SqlDataReader sdr = db.GetDataReader(sql);
            if (sdr.Read())
            {
                if (sdr["expertPwd"].ToString() == expertPwd)
                {
                    return 1;
                }
                else
                    return -1;

            }
            return 0;
        }

        public void LoadInfo(string expertID)
        {
            string sql = "select * from expert where expertID=" + SQLString.GetQuotedString(expertID);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                this._expertID = GetSafeData.ValidateDataRow_S(dr, "expertID");
                this._expertPwd = GetSafeData.ValidateDataRow_S(dr, "expertPwd");
                this._expertName = GetSafeData.ValidateDataRow_S(dr, "expertName");
                this._expertSex = GetSafeData.ValidateDataRow_S(dr, "expertSex");
                this._expertColumn = GetSafeData.ValidateDataRow_S(dr, "expertColumn");
                this._expertMail = GetSafeData.ValidateDataRow_S(dr, "expertMail");
                this._expertPhone = GetSafeData.ValidateDataRow_S(dr, "expertPhone");
                this._expertAddress = GetSafeData.ValidateDataRow_S(dr, "expertAddress");
                this._expertInfo = GetSafeData.ValidateDataRow_S(dr, "expertInfo");
            }

        }

        public bool Update(Hashtable userInfo, string Xwhere)
        {

            Database db = new Database();
            if (db.Update("[expert]", userInfo, Xwhere))
            {
                return true;
            }
            return false;
        }

        public DataSet ExpertInfo(string columnID,string userID,string userName )
        {
            string sql = "select * from expert where expertColumn=" + SQLString.GetQuotedString(columnID);
            if (userID != "")
            {
                sql += "and expertID like '%" + userID + "%'";

            }
            if (userName != "")
            {
                sql += "and expertName like '%" + userName + "%'";

            }
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
        }

        public void Delete(string expertID)
        {
            string sql = "delete from expert where expertID=" + SQLString.GetQuotedString(expertID);
            Database db = new Database();
            db.ExecuteSQL(sql);
        }


        public bool Del(string expert)
        {
            string sql = "delete from expert where expertID=" + SQLString.GetQuotedString(expert);
            Database db = new Database();
            if (db.ExecuteSQL(sql) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataSet LoadInfo(string ID,string column,string Name)
        {
            string sql = "SELECT expert.expertID, expert.expertName, expert.expertPhone, expert.expertMail, expert.expertColumn, [column].columnName FROM [expert],[column] where[column].columnID = expert.expertColumn";
            if (ID != "")
            {
                sql += " and expertID like '%" + ID + "%'";

            }

            if (column != "")
            {
                sql += " and expertColumn like '%" + column + "%'";

            }
            if (Name != "")
            {
                sql += " and expertName like '%" + Name + "%'";

            }

            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;

        }
        public bool Update_Column(string expert, string column)
        {
            string sql = "update expert set expertColumn=" + SQLString.GetQuotedString(column) + "where expertID=" + SQLString.GetQuotedString(expert);
            Database db = new Database();
            if (db.ExecuteSQL(sql) > 0)
            {
                return true;
            }
            return false;
        }
   

        #endregion 方法

    }


}
