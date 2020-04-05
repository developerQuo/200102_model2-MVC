package bitcamp.java142.ch6.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bitcamp.java142.ch6.board.common.KcmHelloBoardChaebunClass;
import bitcamp.java142.ch6.kcmjf.common.KcmConnProperty;
import bitcamp.java142.ch6.board.sql.KcmHelloBoardSqlMap;
import bitcamp.java142.ch6.board.vo.KcmHelloBoardVO;

public class KcmHelloBoardDAOImpl implements KcmHelloBoardDAO {

	@Override
	public List<KcmHelloBoardVO> selectKcmHelloBoard() {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.selectKcmHelloBoard() entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		List<KcmHelloBoardVO> aList = null;
		KcmHelloBoardVO khbvo = null;
		
		try{
			conn = KcmConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getSelectQuery());
			System.out.println(" SELECT QUERY >>> \n" + KcmHelloBoardSqlMap.getSelectQuery());
			rsRs = pstmt.executeQuery();
			
			aList = new ArrayList<KcmHelloBoardVO>();
			KcmHelloBoardVO.setVO(rsRs, aList);			
			
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생. " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.selectKcmHelloBoard() left");
		return aList;
	}

	@Override
	public List<KcmHelloBoardVO> searchKcmHelloBoard(KcmHelloBoardVO _khbvo){
		System.out.println("(log) KcmHelloBoardDAOImpl.searchKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		List<KcmHelloBoardVO> aList = null;
		KcmHelloBoardVO khbvo = null;
		
		try{
			conn = KcmConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getSearchQuery());
			System.out.println(" SEARCH QUERY >>> \n " + KcmHelloBoardSqlMap.getSearchQuery());
			System.out.println(" _khbvo.getKno() >>> " + _khbvo.getKno());
			pstmt.setString(1, _khbvo.getKno());
			rsRs = pstmt.executeQuery();
			
			aList = new ArrayList<KcmHelloBoardVO>();
			KcmHelloBoardVO.setVO(rsRs, aList);	
			
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생 " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.searchKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return aList;
	}
	
	@Override
	public List<KcmHelloBoardVO> pwSelectKcmHelloBoard(KcmHelloBoardVO _khbvo){
		return null;
	}

	@Override
	public int insertKcmHelloBoard(KcmHelloBoardVO _khbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.insertKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		try{
			conn = KcmConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getInsertQuery());
			System.out.println(" INSERT QUERY >>> \n" + KcmHelloBoardSqlMap.getInsertQuery());
			pstmt.setString(1, KcmHelloBoardChaebunClass.boardNo());
			pstmt.setString(2, _khbvo.getKsubject());
			pstmt.setString(3, _khbvo.getKname());
			pstmt.setString(4, _khbvo.getKpw());
			pstmt.setString(5, _khbvo.getKmemo());
			pstmt.setString(6, _khbvo.getKdeleteyn());
			pstmt.setString(7, _khbvo.getkImgPath());
			nCnt = pstmt.executeUpdate();
			if (nCnt > 0){
				System.out.println(" 쿼리 수행 성공! " );
			}
			if (!conn.getAutoCommit()){conn.commit();}
			
			KcmConnProperty.connClose(conn, pstmt);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생. " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.insertKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return nCnt;
	}

	@Override
	public int updateKcmHelloBoard(KcmHelloBoardVO _khbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.updateKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		try{
			conn = KcmConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getUpdateQuery());
			System.out.println(" UPDATE QUERY >>> \n" + KcmHelloBoardSqlMap.getUpdateQuery());
			pstmt.setString(1, _khbvo.getKsubject());
			pstmt.setString(2, _khbvo.getKmemo());
			pstmt.setString(3, _khbvo.getkImgPath());
			pstmt.setString(4, _khbvo.getKno());
			nCnt = pstmt.executeUpdate();
			System.out.println(" nCnt >>> " + nCnt);
			
			if (nCnt >= 1){System.out.println(" 업데이트 성공!");}
			if (!conn.getAutoCommit()){conn.commit();}
			
			KcmConnProperty.connClose(conn, pstmt);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생 " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.updateKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return nCnt;
	}

	@Override
	public int deleteKcmHelloBoard(KcmHelloBoardVO _khbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.deleteKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		
		try{
			conn = KcmConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getDeleteQuery());
			System.out.println(" DELETE QUERY >>> \n" +KcmHelloBoardSqlMap.getDeleteQuery());
			pstmt.setString(1, _khbvo.getKdeleteyn());
			pstmt.setString(2, _khbvo.getKno());
			nCnt = pstmt.executeUpdate();
			
			if (nCnt >= 1){System.out.println(" 삭제 성공! ");}
			if (!conn.getAutoCommit()){conn.commit();}
			
			KcmConnProperty.connClose(conn, pstmt);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생 " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.deleteKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return nCnt;
	}
	
	public boolean pwChckKcmHelloBoard(KcmHelloBoardVO _khbvo){
		System.out.println("(log) KcmHelloBoardDAOImpl.pwChckKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		List<KcmHelloBoardVO> aList = null;
		boolean pBool = false;
		System.out.println(" _khbvo.getKno() >>> " + _khbvo.getKno());
		try{
			conn = KcmConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getPwChckQuery());
			pstmt.setString(1, _khbvo.getKno());
			rsRs = pstmt.executeQuery();
			
			aList = new ArrayList<KcmHelloBoardVO>();
			System.out.println(" 3 >>> ");
			while(rsRs.next()){
				String kpw = rsRs.getString("KPW");
				KcmHelloBoardVO khbvo = new KcmHelloBoardVO();
				khbvo.setKpw(kpw);
				aList.add(khbvo);
			}
			System.out.println(" aList.size() >>> " + aList.size());
			
			if (aList != null && aList.size() > 0){
				for (int i=0; aList.size()>i; i++){
					KcmHelloBoardVO khbvo = aList.get(i);
					System.out.println(" _khbvo.getKpw() >>> " + _khbvo.getKpw());
					System.out.println(" khbvo.getKpw() >>> " + khbvo.getKpw());
					if (_khbvo.getKpw().equals(khbvo.getKpw())){
						System.out.println(" 비밀번호 일치!! ");
						pBool = true;
					}
				}
			}else{
				System.out.println(" DB에서 해당 정보를 찾을 수 없습니다. ");
			}
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생했습니다. " + e.getMessage());
		}finally{
			KcmConnProperty.connClose(conn, pstmt, rsRs);
		}
		
		return pBool;
	}

}
