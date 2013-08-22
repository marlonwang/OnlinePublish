using System;

namespace management.DataAccessHelper
{
	//�Դ��ݹ������ַ������д������
	public class SQLString
	{
		//���о�̬��������SQL�ַ��������(')ת����('')
		public static String GetSafeSqlString(String XStr)
		{
			return XStr.Replace("'","''");

		}

		//���о�̬��������SQL�ַ��������(')ת����('')�������ַ��������߼���(')
		public static String GetQuotedString(String XStr)
		{
			return ("'" + GetSafeSqlString(XStr) + "'");
		}
	}
}
