using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;

namespace management.BusinessLogicLayer
{
    public class Editor
    {
        #region 私有成员

        private string _editorID;
        private string _editorPwd;
        private string _editorName;
        private string _editorSex;
        private string _editorColumn;
        private string _editorPhone;
        private string _editorMail;
        private string _editorAddress;
        private string _editorInfo;

        #endregion 私有成员

        #region 属性

        public string editorID
        {
            set
            {
                this._editorID = value;
            }
            get
            {
                return this._editorID;
            }
        }
        public string editorPwd
        {
            set
            {
                this._editorPwd = value;
            }
            get
            {
                return this._editorPwd;
            }
        }
        public string editorName
        {
            set
            {
                this._editorName = value;
            }
            get
            {
                return this._editorName;
            }
        }
        public string editorSex
        {
            set
            {
                this._editorSex = value;
            }
            get
            {
                return this._editorSex;
            }
        }
        public string editorColumn
        {
            set
            {
                this._editorColumn = value;
            }
            get
            {
                return this._editorColumn;
            }
        }
        public string editorPhone
        {
            set
            {
                this._editorPhone = value;
            }
            get
            {
                return this._editorPhone;
            }
        }
        public string editorMail
        {
            set
            {
                this._editorMail = value;
            }
            get
            {
                return this._editorMail;
            }
        }
        public string editorAddress
        {
            set
            {
                this._editorAddress = value;
            }
            get
            {
                return this._editorAddress;
            }
        }
        public string editorInfo
        {
            set
            {
                this._editorInfo = value;
            }
            get
            {
                return this._editorInfo;
            }
        }
      
        #endregion 属性

        #region  方法

        public bool CheckUser(string editorID)
        {
            string sql = "select * from editor where editorID=" + SQLString.GetQuotedString(editorID);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                return false;
            }
            return true;
        }

        public int Login(string editorID, string editorPwd)
        {
            string sql = "select * from editor where editorID=" + SQLString.GetQuotedString(editorID);
            Database db = new Database();
            SqlDataReader sdr = db.GetDataReader(sql);
            if (sdr.Read())
            {
                if (sdr["editorPwd"].ToString() == editorPwd)
                {
                    return 1;
                }
                else
                    return -1;

            }
            return 0;
        }

        public void LoadInfo(string editorID)
        {
            string sql = "select * from editor where editorID=" + SQLString.GetQuotedString(editorID);
            Database db = new Database();
            DataRow dr = db.GetDataRow(sql);
            if (dr != null)
            {
                this._editorID = GetSafeData.ValidateDataRow_S(dr, "editorID");
                this._editorPwd = GetSafeData.ValidateDataRow_S(dr, "editorPwd");
                this._editorName = GetSafeData.ValidateDataRow_S(dr, "editorName");
                this._editorSex = GetSafeData.ValidateDataRow_S(dr, "editorSex");
                this._editorColumn = GetSafeData.ValidateDataRow_S(dr, "editorColumn");
                this._editorPhone = GetSafeData.ValidateDataRow_S(dr, "editorPhone");
                this._editorMail = GetSafeData.ValidateDataRow_S(dr, "editorMail");
                this._editorAddress = GetSafeData.ValidateDataRow_S(dr, "editorAddress");
                this._editorInfo = GetSafeData.ValidateDataRow_S(dr, "editorInfo");
            }

        }
        public DataSet LoadInfo(string ID, string column, string Name)
        {
            string sql = "SELECT editor.editorID, editor.editorName, editor.editorPhone, editor.editorMail, editor.editorColumn, [column].columnName FROM [editor],[column] where[column].columnID = editor.editorColumn";
            if (ID != "")
            {
                sql += " and editorID like '%" + ID + "%'";

            }

            if (column != "")
            {
                sql += " and editorColumn like '%" + column + "%'";

            }
            if (Name != "")
            {
                sql += " and editorName like '%" + Name + "%'";

            }

            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
            
        }
        public bool Update(Hashtable userInfo, string Xwhere)
        {

            Database db = new Database();
            if (db.Update("[editor]", userInfo, Xwhere))
            {
                return true;
            }
            return false;
        }

        public bool Update_Column(string editor, string column)  
        {
            string sql = "update editor set editorColumn=" + SQLString.GetQuotedString(column) + "where editorID=" + SQLString.GetQuotedString(editor);
            Database db = new Database();
            if (db.ExecuteSQL(sql) > 0)
            {
                return true;
            }
            return false;
        }
   
        public void Adduser(Hashtable userInfo)
        {
            Database db = new Database();
            db.Insert("[editor]", userInfo);
        }

        public bool Delete(string editor)
        {
            string sql = "delete from editor where editorID=" + SQLString.GetQuotedString(editor);
            Database db = new Database();
            if (db.ExecuteSQL(sql)>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        #endregion 方法
    }
      
}
