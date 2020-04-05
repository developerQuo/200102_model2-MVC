package bitcamp.java142.ch6.board.dao;

import java.util.List;

import bitcamp.java142.ch6.board.vo.KcmHelloBoardVO;

public interface KcmHelloBoardDAO {
	
	public List<KcmHelloBoardVO> selectKcmHelloBoard();

	public List<KcmHelloBoardVO> searchKcmHelloBoard(KcmHelloBoardVO _khbvo);
	
	public List<KcmHelloBoardVO> pwSelectKcmHelloBoard(KcmHelloBoardVO _khbvo);
	
	public int insertKcmHelloBoard(KcmHelloBoardVO _khbvo);
	
	public int updateKcmHelloBoard(KcmHelloBoardVO _khbvo);
	
	public int deleteKcmHelloBoard(KcmHelloBoardVO _khbvo);
	
	public boolean pwChckKcmHelloBoard(KcmHelloBoardVO _khbvo);
}
