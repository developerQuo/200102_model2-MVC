package bitcamp.java142.ch6.board.vo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class KcmHelloBoardVO {
	private String kno;
	private String ksubject;
	private String kname;
	private String kpw;
	private String kmemo;
	private String kdeleteyn;
	private String kinsertdate;
	private String kupdatedate;
	private String kImgPath;
	
	
	public KcmHelloBoardVO() {
	}

	public KcmHelloBoardVO(String kno, String kdeleteyn) {
		this.kno = kno;
		this.kdeleteyn = kdeleteyn;
	}

	public KcmHelloBoardVO(String kno
						 , String ksubject
						 , String kmemo
						 , String kImgPath) {
		this.kno = kno;
		this.ksubject = ksubject;
		this.kmemo = kmemo;
		this.kImgPath = kImgPath;
	}
	
	public KcmHelloBoardVO(String ksubject, 
						   String kname, 
						   String kpw, 
						   String kmemo, 
						   String kdeleteyn,
						   String kImgPath) {
		this.ksubject = ksubject;
		this.kname = kname;
		this.kpw = kpw;
		this.kmemo = kmemo;
		this.kdeleteyn = kdeleteyn;
		this.kImgPath = kImgPath;
	}

	public KcmHelloBoardVO(String kno
						  ,String ksubject
						  ,String kname
						  ,String kpw
						  ,String kmemo
						  ,String kdeleteyn
						  ,String kinsertdate
						  ,String kupdatedate
						  ,String kImgPath) {
		this.kno = kno;
		this.ksubject = ksubject;
		this.kname = kname;
		this.kpw = kpw;
		this.kmemo = kmemo;
		this.kdeleteyn = kdeleteyn;
		this.kinsertdate = kinsertdate;
		this.kupdatedate = kupdatedate;
		this.kImgPath = kImgPath;
	}

	public String getKno() {
		return kno;
	}
	public void setKno(String kno) {
		this.kno = kno;
	}
	public String getKsubject() {
		return ksubject;
	}
	public void setKsubject(String ksubject) {
		this.ksubject = ksubject;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getKpw() {
		return kpw;
	}
	public void setKpw(String kpw) {
		this.kpw = kpw;
	}
	public String getKmemo() {
		return kmemo;
	}
	public void setKmemo(String kmemo) {
		this.kmemo = kmemo;
	}
	public String getKdeleteyn() {
		return kdeleteyn;
	}
	public void setKdeleteyn(String kdeleteyn) {
		this.kdeleteyn = kdeleteyn;
	}
	public String getKinsertdate() {
		return kinsertdate;
	}
	public void setKinsertdate(String kinsertdate) {
		this.kinsertdate = kinsertdate;
	}
	public String getKupdatedate() {
		return kupdatedate;
	}
	public void setKupdatedate(String kupdatedate) {
		this.kupdatedate = kupdatedate;
	}
	
	public String getkImgPath() {
		return kImgPath;
	}

	public void setkImgPath(String kImgPath) {
		this.kImgPath = kImgPath;
	}

	public static void setVO(ResultSet _rsRs,
							 List<KcmHelloBoardVO> _aList) throws Exception{
		while (_rsRs.next()){
			String kno = _rsRs.getString("KNO");
			String ksubject = _rsRs.getString("KSUBJECT");
			String kname = _rsRs.getString("KNAME");
			String kpw = _rsRs.getString("KPW");
			String kmemo = _rsRs.getString("KMEMO");
			String kdeleteyn = _rsRs.getString("KDELETEYN");
			String kinsertdate = _rsRs.getString("KINSERTDATE");
			String kupdatedate = _rsRs.getString("KUPDATEDATE");
			String kImgPath = _rsRs.getString("KIMG_PATH");
			
			KcmHelloBoardVO khbvo = new KcmHelloBoardVO(
										kno
									   ,ksubject
									   ,kname
									   ,kpw
									   ,kmemo
									   ,kdeleteyn
									   ,kinsertdate
									   ,kupdatedate
									   ,kImgPath);
			_aList.add(khbvo);
		}
	}
	
}
