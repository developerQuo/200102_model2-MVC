package bitcamp.java142.ch6.kcmjf.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class KcmConnProperty {
	
	public static final String ORACLE11G_JDBCDRIVER = 
								"oracle.jdbc.driver.OracleDriver";
	public static final String ORACLE11G_URL = 
								"jdbc:oracle:thin:@127.0.0.1:1521:orclKCM";
	public static final String ORACLE11G_USER = "KCM00";
	public static final String ORACLE11G_PASS = "USER00";
	
	public static Connection getConnection() throws Exception{
		System.out.println("(log) KcmConnProperty.getConnection() entered");
		Connection conn = null;
		
		Class.forName(ORACLE11G_JDBCDRIVER);
		conn = DriverManager.getConnection(ORACLE11G_URL
										 , ORACLE11G_USER
										 , ORACLE11G_PASS);
		System.out.println("(log) KcmConnProperty.getConnection() left");
		return conn;
	}
	
	public static void connClose(Connection _conn
								,PreparedStatement _pstmt
								,ResultSet _rsRs){
		System.out.println("(log) KcmConnProperty.connClose(Connection _conn, PreparedStatement _pstmt, ResultSet _rsRs) entered");
		Connection conn = _conn;
		PreparedStatement pstmt = _pstmt;
		ResultSet rsRs = _rsRs;
		
		try{
			if (conn != null) try{conn.close(); conn = null;}catch(Exception ex){}
			if (pstmt != null) try{pstmt.close(); pstmt = null;}catch(Exception ex){}
			if (rsRs != null) try{rsRs.close(); rsRs = null;}catch(Exception ex){}
		}catch(Exception e2){}
		
		System.out.println("(log) KcmConnProperty.connClose(Connection _conn, PreparedStatement _pstmt, ResultSet _rsRs) left");
	}
	
	public static void connClose(Connection _conn
								,PreparedStatement _pstmt){
		System.out.println("(log) KcmConnProperty.connClose(Connection _conn, PreparedStatement _pstmt) entered");
		Connection conn = _conn;
		PreparedStatement pstmt = _pstmt;
		
		try{
			if (conn != null) try{conn.close(); conn = null;}catch(Exception ex){}
			if (pstmt != null) try{pstmt.close(); pstmt = null;}catch(Exception ex){}
		}catch(Exception e2){}

		System.out.println("(log) KcmConnProperty.connClose(Connection _conn, PreparedStatement _pstmt) left");
	}
}
