using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Message
    {
        #region 私有成员

        private int _messageID;
        private string _messageFrom;
        private string _messageTo;
        private DateTime _messageTime;
        private string _messageTitle;
        private string _messageContent;
        private string _messageState;

        #endregion 私有成员

        #region 属性

        public int messageID
        {
            set
            {
                this._messageID = value;
            }
            get
            {
                return this._messageID;
            }
        }
        public string messageFrom
        {
            set
            {
                this._messageFrom = value;
            }
            get
            {
                return this._messageFrom;
            }
        }
        public string messageTo
        {
            set
            {
                this._messageTo = value;
            }
            get
            {
                return this._messageTo;
            }
        }
        public DateTime messageTime
        {
            set
            {
                this._messageTime = value;
            }
            get
            {
                return this._messageTime;
            }
        }
        public string messageTitle
        {
            set
            {
                this._messageTitle = value;
            }
            get
            {
                return this._messageTitle;
            }
        }
        public string messageContent
        {
            set
            {
                this._messageContent = value;
            }
            get
            {
                return this._messageContent;
            }
        }
        public string messageState
        {
            set
            {
                this._messageState = value;
            }
            get
            {
                return this._messageState;
            }
        }

        #endregion 属性

        #region  方法

        public bool NewMesg(Hashtable msg)  //发送消息
        {
            Database db = new Database();
            if (db.Insert("[message]", msg))
            {
                return true;
            }
            return false;
        }

        public DataSet LoadMsg(string user)  //加载消息
        {
            string sql = "select * from message where messageTo=" + SQLString.GetQuotedString(user) + "order by messageState asc,messageTime desc";
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
            
        }

        public void Update_state(int messageID)  //打开消息后改变状态
        {
            string sql = "update message set messageState=" + SQLString.GetQuotedString("1") + "where messageID=" + SQLString.GetQuotedString(Convert .ToString (messageID));
            Database db = new Database();
            db.ExecuteSQL(sql);
        }

        public void Delete_msg(int messageID)  //删除消息
        {
            string sql = "delete from message where messageID=" + SQLString.GetQuotedString(Convert.ToString(messageID));
            Database db = new Database();
            db.ExecuteSQL(sql);
        }

        public string Get_msgCount(string user)  //计算未读消息条数
        {
            string sql = "select count(*) from message where messageState=" + SQLString.GetQuotedString("0") + "and messageTo=" + SQLString.GetQuotedString(user);
            Database db = new Database();
            return db.GetScalar(sql);
        }

        #endregion
    }

}