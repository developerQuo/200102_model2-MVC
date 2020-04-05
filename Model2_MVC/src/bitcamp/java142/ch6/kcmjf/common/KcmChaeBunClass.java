package bitcamp.java142.ch6.kcmjf.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import bitcamp.java142.ch6.kcmjf.sql.KcmSqlQueryMap;

public abstract class KcmChaeBunClass {
	
	public static final String BIZ_GUBUN_M = "M";
	
	public static String ymdFormat(){
		System.out.println("(log) KcmChaeBunClass.ymdFormat() entered");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String d = sdf.format(date);
		System.out.println(d);
		System.out.println("(log) KcmChaeBunClass.ymdFormat() left");
		return d;
	}
	
	// MYYYYMMDD0001
	public static String memberNo(){
		System.out.println("(log) KcmSqlQueryMap.memberNo() entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		StringBuffer numbering = null;

		// 구분자 M 붙이기.
		numbering = new StringBuffer();
		numbering.append(BIZ_GUBUN_M);
		System.out.println("appended BIZ_GUBUN_M >>> " + numbering);
		// SYSDATE 이용해서 날짜부분 도출.
		numbering.append(KcmChaeBunClass.ymdFormat());
		System.out.println("appended ymdFormat() >>> " + numbering);
		try{
			// DB의 행 개수 + 1로 계산해서 숫자부분 도출.
			// 4개 자리로 만들고 공백은 0으로 채워넣음.
			conn = KcmConnProperty.getConnection();
			System.out.println("Connection 성공!!");
			pstmt = conn.prepareStatement(KcmSqlQueryMap.KMEM_CHAEBUN);
			System.out.println("KcmSqlQueryMap.KMEM_CHAEBUN >>> \n" + KcmSqlQueryMap.KMEM_CHAEBUN);
			rsRs = pstmt.executeQuery();
			
			if (rsRs != null){
				while (rsRs.next()){
					System.out.println("rsRs >>> " + rsRs.getString("COMMNO"));
					numbering.append(rsRs.getString(1));
				}			
			}
			System.out.println("appended COMMNO >>> " + numbering);
			
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println("DB연결 또는 쿼리에 문제가 발생했습니다. " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}
		
		System.out.println("(log) KcmSqlQueryMap.memberNo() left");
		return numbering.toString();
	}
}
