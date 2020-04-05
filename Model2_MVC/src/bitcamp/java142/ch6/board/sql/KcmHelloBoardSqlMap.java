package bitcamp.java142.ch6.board.sql;

public abstract class KcmHelloBoardSqlMap {
	
	public static final String BOARD_IMG_INPUT_PATH = "D://00.BITCAMP//"
			+ "java142//.metadata//.plugins//org.eclipse.wst.server.core//"
			+ "tmp0//wtpwebapps//Model2_MVC//board//img";
	
	public static final String BOARD_IMG_OUTPUT_PATH = "board//img//";
	
	public static final String B_CHAEBUN = 
			"SELECT /*+ INDEX_DESC(A SYS_C0011152) */	\n "
		  + "LPAD(TO_CHAR(NVL(MAX(SUBSTR(A.KNO, 2)), 0) + 1), 4, '0') AS COMMNO	\n "
		  + "FROM   KCMHELLOBOARD A";

	public static String getSelectQuery(){
		System.out.println("(log) KcmHelloBoardSqlMap.getSelectQuery() entered");
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT								\n");
		sb.append("       A.KNO            KNO			\n");
		sb.append("      ,A.KSUBJECT       KSUBJECT		\n");
		sb.append("      ,A.KNAME          KNAME		\n");
		sb.append("      ,A.KPW            KPW			\n");
		sb.append("      ,A.KMEMO          KMEMO		\n");
		sb.append("      ,A.KDELETEYN      KDELETEYN	\n");
		sb.append("      ,A.KINSERTDATE    KINSERTDATE	\n");
		sb.append("      ,A.KUPDATEDATE    KUPDATEDATE	\n");
		sb.append("      ,A.KIMG_PATH	   KIMG_PATH	\n");
		sb.append("FROM  KCMHELLOBOARD A				\n");
		sb.append("WHERE 1 = 1							\n");
		sb.append("AND   A.KDELETEYN = 'Y'				\n");
		System.out.println("(log) KcmHelloBoardSqlMap.getSelectQuery() left");
		return sb.toString();
	}
	
	public static String getSearchQuery(){
		System.out.println("(log) KcmHelloBoardSqlMap.getSelectQuery() entered");
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT								\n");
		sb.append("       A.KNO            KNO,			\n");
		sb.append("       A.KSUBJECT       KSUBJECT,	\n");
		sb.append("       A.KNAME          KNAME,		\n");
		sb.append("       A.KINSERTDATE    KINSERTDATE,	\n");
		sb.append("       A.KUPDATEDATE    KUPDATEDATE,	\n");
		sb.append("       A.KMEMO          KMEMO,		\n");
		sb.append("       A.KPW            KPW,			\n");
		sb.append("       A.KDELETEYN      KDELETEYN	\n");
		sb.append("      ,A.KIMG_PATH	   KIMG_PATH	\n");
		sb.append("FROM   KCMHELLOBOARD A				\n");
		sb.append("WHERE  A.KNO = ?						\n");
		sb.append("AND    A.KDELETEYN = 'Y'				");
		System.out.println("(log) KcmHelloBoardSqlMap.getSelectQuery() left");
		return sb.toString();
	}
	
	public static String getInsertQuery(){
		System.out.println("(log) KcmHelloBoardSqlMap.getInsertQuery() entered");
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO KCMHELLOBOARD A(A.KNO,			\n");
		sb.append("                            A.KSUBJECT,		\n");
		sb.append("                            A.KNAME,			\n");
		sb.append("                            A.KPW,			\n");
		sb.append("                            A.KMEMO,			\n");
		sb.append("                            A.KDELETEYN,		\n");
		sb.append("                            A.KINSERTDATE,	\n");
		sb.append("                            A.KUPDATEDATE,	\n");
		sb.append("                            A.KIMG_PATH)		\n");
		sb.append("VALUES(?,									\n");
		sb.append("       ?,									\n");
		sb.append("       ?,									\n");
		sb.append("       ?,									\n");
		sb.append("       ?,									\n");
		sb.append("       ?,									\n");
		sb.append("       TO_CHAR(SYSDATE, 'YYYY-MM-DD'),		\n");
		sb.append("       TO_CHAR(SYSDATE, 'YYYY-MM-DD'),		\n");
		sb.append("       ?)									");
		System.out.println("(log) KcmHelloBoardSqlMap.getInsertQuery() left");
		return sb.toString();
	}
	
	public static String getUpdateQuery(){
		System.out.println("(log) KcmHelloBoardSqlMap.getUpdateQuery() entered");
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE  KCMHELLOBOARD A									\n");
		sb.append("SET     A.KSUBJECT = ?,									\n");
		sb.append("        A.KMEMO = ?,										\n");
		sb.append("        A.KIMG_PATH = ?,									\n");
		sb.append("        A.KUPDATEDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD')	\n");
		sb.append("WHERE   A.KNO   = ?										\n");
		sb.append("AND     A.KDELETEYN = 'Y'								");
		System.out.println("(log) KcmHelloBoardSqlMap.getUpdateQuery() left");
		return sb.toString();
	}
	
	public static String getDeleteQuery(){
		System.out.println("(log) KcmHelloBoardSqlMap.getDeleteQuery() entered");
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE  KCMHELLOBOARD A									\n");
		sb.append("SET     A.KDELETEYN = ?,									\n");
		sb.append("        A.KUPDATEDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD')	\n");
		sb.append("WHERE   A.KNO   = ?										\n");
		sb.append("AND     A.KDELETEYN = 'Y'								");
		System.out.println("(log) KcmHelloBoardSqlMap.getDeleteQuery() left");
		return sb.toString();
	}
	
	public static String getPwChckQuery(){
		System.out.println("(log) KcmHelloBoardSqlMap.getPwChckQuery() entered");
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT					\n");
		sb.append("      A.KPW    KPW		\n");
		sb.append("FROM  KCMHELLOBOARD A	\n");
		sb.append("WHERE A.KNO = ?			\n");
		sb.append("AND   A.KDELETEYN = 'Y'	");
		System.out.println("(log) KcmHelloBoardSqlMap.getPwChckQuery() left");
		return sb.toString();
	}
}
