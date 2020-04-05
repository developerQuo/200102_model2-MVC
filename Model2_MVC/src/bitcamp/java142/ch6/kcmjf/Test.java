package bitcamp.java142.ch6.kcmjf;


import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import bitcamp.java142.ch6.kcmjf.dao.KcmMemberDAO;
import bitcamp.java142.ch6.kcmjf.dao.KcmMemberDAOImpl;
import bitcamp.java142.ch6.kcmjf.vo.KcmMemberVO;

public class Test {

	public static void displayFunc(KcmMemberVO _kmvo){
//		System.out.println("(log) KcmMemberScr.displayFunc(KcmMemberVO _kmvo) entered");
		System.out.print("  " + _kmvo.getKmem());
		System.out.print(" " + _kmvo.getKid());
		System.out.print(" " + _kmvo.getKpw());
		System.out.print(" " + _kmvo.getKname());
		System.out.print(" " + _kmvo.getKemail());
		System.out.print(" " + _kmvo.getKhp());
		System.out.print(" " + _kmvo.getKbirth());
		System.out.print(" " + _kmvo.getKpostno());
		System.out.print(" " + _kmvo.getKjuso());
		System.out.print(" " + _kmvo.getKdeleteYN());
		System.out.print(" " + _kmvo.getKinsertdate());
		System.out.println(" " + _kmvo.getKupdatedate());
//		System.out.println("(log) KcmMemberScr.displayFunc(KcmMemberVO _kmvo) left");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("(log) Test.main() entered");
		
		// connect Test
//		KcmMemberDAO kdao = null;
//		KcmMemberVO kvo = null;
//		String inputVal_1 = "";
//		String inputVal_2 = "";
//		
//		Scanner sc = new Scanner(System.in);
//		inputVal_1 = sc.nextLine();
//		if(sc.hasNext()){
//			inputVal_2 = sc.nextLine();
//		}
//		sc.close();
//		System.out.println("inputVal_1 >>> " + inputVal_1);
//		System.out.println("inputVal_2 >>> " + inputVal_2);
//		
//		kvo = new KcmMemberVO();
//		kvo.setKid(inputVal_1);
//		kvo.setKpw(inputVal_2);
//		
//		System.out.println("kid >>> " + kvo.getKid());
//		System.out.println("kpw >>> " + kvo.getKpw());
//		
//		kdao = new KcmMemberDAOImpl();
//		List<KcmMemberVO> aList = kdao.loginKcmMember(kvo);
//		System.out.println("aList.size() >>> " + aList.size());
//		
//		System.out.println(aList.iterator());
//		Iterator<KcmMemberVO> iter = aList.iterator();
//		if (iter.hasNext()){
//			KcmMemberVO kvo_2 = iter.next();
//			System.out.println("kid >>> " + kvo_2.getKid());
//			System.out.println("kpw >>> " + kvo_2.getKpw());
//		}
		
		// Select All Test
//		KcmMemberDAO kdao = null;
//		
//		kdao = new KcmMemberDAOImpl();
//		List<KcmMemberVO> aList = (List<KcmMemberVO>)kdao.selectKcmMember();
//		
//		Iterator<KcmMemberVO> iter = aList.iterator();
//		if (iter != null){
//			while (iter.hasNext()){
//				KcmMemberVO kvo = iter.next();
//				Test.displayFunc(kvo);
//			}
//		}
		
//		// Insert Test
//		String id = "happy";
//		String pw = "123452";
//		String name = "김하방";
//		String email = "habang@gmail.com";
//		String hp = "01012485421";
//		String birth = "19940410";
//		String postno = "11241";
//		String juso = "서울시 서대문구 남가좌동";
//		
//		KcmMemberDAO kdao = null;
//		boolean flag = false;
//		KcmMemberVO kmvo = new KcmMemberVO();
//		kmvo.setKid(id);
//		kmvo.setKpw(pw);
//		kmvo.setKname(name);
//		kmvo.setKemail(email);
//		kmvo.setKhp(hp);
//		kmvo.setKbirth(birth);
//		kmvo.setKpostno(postno);
//		kmvo.setKjuso(juso);
//		
//		kdao = new KcmMemberDAOImpl();
//		flag = kdao.insertKcmMember(kmvo);
//		if (flag){
//			System.out.println(" 회원가입 성공!");
//		}
		
//		// search Test
//		String mem = "M201912060020";
//		
//		KcmMemberVO kvo = new KcmMemberVO();
//		kvo.setKmem(mem);
//		
//		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
//		List<KcmMemberVO> aList = kmdao.searchKcmMember(kvo);
//		Iterator<KcmMemberVO> iter = aList.iterator();
//		if (aList.size() > 0){
//			while (iter.hasNext()){
//				KcmMemberVO kvo_2 = iter.next();
//				Test.displayFunc(kvo_2);
//			}
//		}
//		System.err.println("dsdadassssssssssss");
		
		// pw update Test
//		String mem = "M201911190005";
//		String pw = "qwerqwer";
//		
//		KcmMemberVO kmvo = new KcmMemberVO();
//		kmvo.setKmem(mem);
//		
//		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
//		boolean flag = kmdao.updateKcmMember(kmvo, pw);
//		if (flag){
//			System.out.println("변경 성공");
//		}else{
//			System.out.println("실패");
//		}
		
//		// delete Test
		String mem = "M201912260029";
		
		KcmMemberVO kmvo = new KcmMemberVO();
		kmvo.setKmem(mem);
		
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		boolean flag = kmdao.deleteKcmMember(kmvo);
		if (flag){
			System.out.println("삭제 성공!");
		}
		
		System.out.println("(log) Test.main() left");
	}

}
