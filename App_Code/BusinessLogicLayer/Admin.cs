using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Admin
    {
        #region 私有成员

        private string _adminID;
        private string _adminPwd;

        #endregion 私有成员

        #region 属性

        public string adminID
        {
            set
            {
                this._adminID = value;
            }
            get
            {
                return this._adminID;
            }
        }
        public string adminPwd
        {
            set
            {
                this._adminPwd = value;
            }
            get
            {
                return this._adminPwd;
            }
        }

        #endregion 属性

        #region  方法

        public int Login(string adminID, string adminPwd)
        {
            string sql = "select * from admin where adminID=" + SQLString.GetQuotedString(adminID);
            Database db = new Database();
            SqlDataReader sdr = db.GetDataReader(sql);
            if (sdr.Read())
            {
                if (sdr["adminPwd"].ToString() == adminPwd)
                {
                    return 1;
                }
                else
                    return -1;

            }
            return 0;
        }

        public bool Update(Hashtable userInfo, string Xwhere)
        {

            Database db = new Database();
            if (db.Update("[admin]", userInfo, Xwhere))
            {
                return true;
            }
            return false;
        }

        public void LoadInfo(string adminID)
        {
            string sql = "select * from admin where adminID=" + SQLString.GetQuotedString(adminID);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                this._adminID = GetSafeData.ValidateDataRow_S(dr, "adminID");
                this._adminPwd = GetSafeData.ValidateDataRow_S(dr, "adminPwd");
            }

        }

    



        #endregion 方法

    }
}
