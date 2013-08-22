using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using management.DataAccessLayer;
using management.DataAccessHelper;


namespace management.BusinessLogicLayer
{
    public class Board
    {
        #region 私有成员

        private int _boardID;
        private int _docID;
        private string _boardRank;
        private string _boardMoney;
        private string _boardState;

        #endregion 私有成员

        #region 属性

        public int boardID
        {
            set
            {
                this._boardID = value;
            }
            get
            {
                return this._boardID;
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
        public string boardRank
        {
            set
            {
                this._boardRank = value;
            }
            get
            {
                return this._boardRank;
            }
        }
        public string boardMoney
        {
            set
            {
                this._boardMoney = value;
            }
            get
            {
                return this._boardMoney;
            }
        }
        public string boardState
        {
            set
            {
                this._boardState = value;
            }
            get
            {
                return this._boardState;
            }
        }

        #endregion 属性

        #region 方法

        public void Add(Hashtable ht)
        {
            Database db = new Database();
            db.Insert("[board]", ht);
        }

        public bool  Update_board(int ID,string rank,string money,string state)  //更新稿件版面信息
        {
            string sql = "update board set boardRank=" + SQLString.GetQuotedString(rank) + ",boardMoney=" + SQLString.GetQuotedString(money) + ",boardState=" + SQLString.GetQuotedString(state) + "where docID=" + SQLString.GetQuotedString(Convert.ToString(ID));
            Database db = new Database();
            if (db.ExecuteSQL(sql) > 0)
            {
                return true;
            }
            return false;
        }

        public DataSet Asign_board(string title, string author)  //主编加载稿件版面信息
        {
            string sql = "select document.docID,document.docTitle,document.authorID,board.boardRank,board.boardMoney,board.boardState from document,board where document.docID=board.docID";
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

        public DataSet Load_board(string author)  //作者加载稿件版面信息
        {
            string sql = "select document.docID,document.docTitle,document.authorID,board.boardRank,board.boardMoney,board.boardState from document,board where document.docID=board.docID and document.authorID=" + SQLString.GetQuotedString(author);
            Database db = new Database();
            DataSet ds = db.GetDataSet(sql);
            return ds;
        }


        #endregion
    }
}