using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Author
    {
        #region 私有成员

        private string _authorID;
        private string _authorPwd;
        private string _authorName;
        private string _authorSex;
        private string _authorBirth;
        private string _authorRegion;
        private string _authorAddress;
        private string _authorPost;
        private string _authorJob;
        private string _authorCompany;
        private string _authorDegree;
        private string _authorMajor;
        private string _authorTitle;
        private string _authorMail;
        private string _authorPhone;
        private string _authorInfo;
        private bool _exist;		//是否存在标志
        #endregion 私有成员

        #region 属性

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
        public string authorPwd
        {
            set
            {
                this._authorPwd = value;
            }
            get
            {
                return this._authorPwd;
            }
        }
        public string authorName
        {
            set
            {
                this._authorName = value;
            }
            get
            {
                return this._authorName;
            }
        }
        public string authorSex
        {
            set
            {
                this._authorSex = value;
            }
            get
            {
                return this._authorSex;
            }
        }
        public string authorBirth
        {
            set
            {
                this._authorBirth = value;
            }
            get
            {
                return this._authorBirth;
            }
        }
        public string authorRegion
        {
            set
            {
                this._authorRegion = value;
            }
            get
            {
                return this._authorRegion;
            }
        }
        public string authorPost
        {
            set
            {
                this._authorPost = value;
            }
            get
            {
                return this._authorPost;
            }
        }
        public string authorMail
        {
            set
            {
                this._authorMail = value;
            }
            get
            {
                return this._authorMail;
            }
        }
        public string authorDegree
        {
            set
            {
                this._authorDegree = value;
            }
            get
            {
                return this._authorDegree;
            }
        }
        public string authorMajor
        {
            set
            {
                this._authorMajor = value;
            }
            get
            {
                return this._authorMajor;
            }
        }
        public string authorTitle
        {
            set
            {
                this._authorTitle = value;
            }
            get
            {
                return this._authorTitle;
            }
        }
        public string authorJob
        {
            set
            {
                this._authorJob = value;
            }
            get
            {
                return this._authorJob;
            }
        }
        public string authorCompany
        {
            set
            {
                this._authorCompany = value;
            }
            get
            {
                return this._authorCompany;
            }
        }
        public string authorPhone
        {
            set
            {
                this._authorPhone = value;
            }
            get
            {
                return this._authorPhone;
            }
        }
        public string authorAddress
        {
            set
            {
                this._authorAddress = value;
            }
            get
            {
                return this._authorAddress;
            }
        }
        public string authorInfo
        {
            set
            {
                this._authorInfo = value;
            }
            get
            {
                return this._authorInfo;
            }
        }
        public bool exist
        {
            get
            {
                return this._exist;
            }
        }


     
        #endregion 属性

        #region 方法

        public bool CheckUser(string authorID)
        {
            string sql = "select * from author where authorID=" + SQLString.GetQuotedString(authorID);
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
            if (db.Insert("[author]", userInfo))
            {
                return true;
            }
            return false;

        }

        public int Login(string authorID, string authorPwd)
        {
            string sql = "select * from author where authorID=" + SQLString.GetQuotedString(authorID);
            Database db = new Database();
            SqlDataReader sdr=db .GetDataReader(sql);
            if (sdr.Read())
            {
               if (sdr["authorPwd"].ToString() == authorPwd)
               {
                   return 1;
               }
               else
                   return -1;
           
            }
            return 0;
        }

        public void LoadInfo(string authorID)
        {
            string sql="select * from author where authorID="+SQLString .GetQuotedString (authorID);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                this._authorID = GetSafeData.ValidateDataRow_S(dr, "authorID");
                this._authorPwd = GetSafeData.ValidateDataRow_S(dr, "authorPwd");
                this._authorName = GetSafeData.ValidateDataRow_S(dr, "authorName");
                this._authorSex = GetSafeData.ValidateDataRow_S(dr, "authorSex");
                this._authorBirth = GetSafeData.ValidateDataRow_S(dr, "authorBirth");
                this._authorRegion = GetSafeData.ValidateDataRow_S(dr, "authorRegion");
                this._authorPost = GetSafeData.ValidateDataRow_S(dr, "authorPost");
                this._authorMail = GetSafeData.ValidateDataRow_S(dr, "authorMail");
                this._authorDegree = GetSafeData.ValidateDataRow_S(dr, "authorDegree");
                this._authorMajor = GetSafeData.ValidateDataRow_S(dr, "authorMajor");
                this._authorTitle = GetSafeData.ValidateDataRow_S(dr, "authorTitle");
                this._authorJob = GetSafeData.ValidateDataRow_S(dr, "authorJob");
                this._authorCompany = GetSafeData.ValidateDataRow_S(dr, "authorCompany");
                this._authorPhone = GetSafeData.ValidateDataRow_S(dr, "authorPhone");
                this._authorAddress = GetSafeData.ValidateDataRow_S(dr, "authorAddress");
                this._authorInfo = GetSafeData.ValidateDataRow_S(dr, "authorInfo");
                this._exist = true;
            }
            else
            {
                this._exist = false;
            }

        }

        public bool  Update(Hashtable userInfo,string Xwhere)
        {
            
            Database db = new Database();
            if (db.Update("[author]", userInfo, Xwhere))
            {
                return true;
            }
            return false;
        }

        public bool  Delete(string ID)
        {
            string sql = "delete from [author] where authorID=" + SQLString.GetQuotedString(ID);
            Database db = new Database();
            if (db.ExecuteSQL(sql)>0)
            {
                return true;
            }
            return false;
        }

        public DataSet Loadauthor(string userID)
        {
            string sql = "select * from author where 1=1";
            if (userID.Trim() != "")
            {
                sql += "and authorID like '%" + userID + "%'";
            }
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;

        }

        #endregion 方法
    }


}
