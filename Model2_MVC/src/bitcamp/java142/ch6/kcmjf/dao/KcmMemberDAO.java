package bitcamp.java142.ch6.kcmjf.dao;

import java.util.List;

import bitcamp.java142.ch6.kcmjf.vo.KcmMemberVO;

public interface KcmMemberDAO {

	public List<KcmMemberVO> selectKcmMember();
	
	public List<KcmMemberVO> searchKcmMember(KcmMemberVO _kmvo);
	
	public boolean insertKcmMember(KcmMemberVO _kmvo);
	
	public boolean updateKcmMember(KcmMemberVO _kmvo, String _sVal);
	
	public boolean deleteKcmMember(KcmMemberVO _kmvo);
	
	// login
	public List<KcmMemberVO> loginKcmMember(KcmMemberVO _kmvo);
	
	// be overlapped id check
	public int IdCheckKcmMember(KcmMemberVO _kmvo);
}
