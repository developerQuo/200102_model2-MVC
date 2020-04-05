package bitcamp.java142.ch6.kcmjf.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bitcamp.java142.ch6.kcmjf.dao.KcmMemberDAO;
import bitcamp.java142.ch6.kcmjf.dao.KcmMemberDAOImpl;
import bitcamp.java142.ch6.kcmjf.sql.KcmSqlQueryMap;
import bitcamp.java142.ch6.kcmjf.vo.KcmMemberVO;

/**
 * Servlet implementation class KcmMemberServlet
 */
@WebServlet("/KcmMemberServlet")
public class KcmMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("---------------------" + request.getContentType());
		if (request.getContentType().equals("application/x-www-form-urlencoded")){
			request.setCharacterEncoding("EUC-KR");
			String selectFunc = request.getParameter("selectFunc");
			//System.out.println("(log) selectFunc >>> " + selectFunc);
			if (selectFunc.equals("SA")){
				System.out.println("(log) /Model2_MVC/SelectKcmMember entered");
				KcmMemberDAO kdao = new KcmMemberDAOImpl();
				
				List<KcmMemberVO> aList = kdao.selectKcmMember();
				System.out.println(" (log) /SelectKcmMember aList.size() >>> " + aList.size());
				request.setAttribute("aList", aList);
				//http://localhost:8088/Model2_MVC/member/jsp/selectKcmMember.jsp
				RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/selectKcmMember.jsp");
				rd.forward(request, response);
			}

			if (selectFunc.equals("SN")){
				String mem = request.getParameter("mem");
				KcmMemberVO kvo = new KcmMemberVO();
				kvo.setKmem(mem);
				
				KcmMemberDAO kmdao = new KcmMemberDAOImpl();
				List<KcmMemberVO> aList = kmdao.searchKcmMember(kvo);
				System.out.println(" (log) /SearchKcmMember aList.size() >>> " + aList.size());
				
				request.setAttribute("aList", aList);
				//http://localhost:8088/Model2_MVC/member/jsp/searchKcmMember.jsp
				RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/searchKcmMember.jsp");
				rd.forward(request, response);
			}
			
			if (selectFunc.equals("U")){
				String mem = request.getParameter("mem");
				String pw = request.getParameter("pw");

				KcmMemberVO kmvo = new KcmMemberVO();
				kmvo.setKmem(mem);
				
				KcmMemberDAO kmdao = new KcmMemberDAOImpl();
				boolean flag = kmdao.updateKcmMember(kmvo, pw);
				
				request.setAttribute("flag", new Boolean(flag));
				RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/updateKcmMember.jsp");
				rd.forward(request, response);
			}

			if (selectFunc.equals("D")){
				String mem = request.getParameter("mem");
				
				KcmMemberVO kmvo = new KcmMemberVO();
				kmvo.setKmem(mem);
				System.out.println(" (log) kmvo.getKmem() >>> " + kmvo.getKmem());
				
				KcmMemberDAO kmdao = new KcmMemberDAOImpl();
				boolean flag = kmdao.deleteKcmMember(kmvo);
				System.out.println(" (log) delete flag >>> " + flag);
				request.setAttribute("flag", new Boolean(flag));
				RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/deleteKcmMember.jsp");
				rd.forward(request, response);
			}
			
			if (selectFunc.equals("LOGIN")){
				//System.out.println(" (log) login servlet entered");
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");

				KcmMemberDAO kdao = new KcmMemberDAOImpl();
				KcmMemberVO kvo = null;
				kvo = new KcmMemberVO();
				kvo.setKid(id);
				kvo.setKpw(pw);
				
				List<KcmMemberVO> aList = kdao.loginKcmMember(kvo);
				
				request.setAttribute("aList", aList);
				//http://localhost:8088/Model2_MVC/member/jsp/loginProcess.jsp
				RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/loginProcess.jsp");
				rd.forward(request, response);
			}
			
			if (selectFunc.equals("idChck")){
				System.out.println(" (log) IdCheckServlet entered");
				String id = request.getParameter("id");
				//System.out.println(" IdCheck :: id >>> " + id);

				int idNcnt = 0;
				boolean flag = false;
				
				KcmMemberVO kmvo = null;
				KcmMemberDAO kmdao = new KcmMemberDAOImpl();
				
				kmvo = new KcmMemberVO();
				kmvo.setKid(id);
				idNcnt = kmdao.IdCheckKcmMember(kmvo);
				
				
				if (idNcnt == 0){
					flag = true;
				}
				
				request.setAttribute("flag", new Boolean(flag));
				//http://localhost:8088/Model2_MVC/member/jsp/idCheck.jsp
				RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/idCheck.jsp");
				System.out.println(" (log) IdCheckServlet left");
				rd.forward(request, response);
			}
		}

		if (request.getContentType().toLowerCase().startsWith("multipart/form-data")){
			String imgInputPath = KcmSqlQueryMap.IMG_INPUT_PATH;
			int size = 10*1024*1024;
			try{
				MultipartRequest multi = new MultipartRequest(request,
															  imgInputPath,
															  size,
															  "EUC-KR",
															  new DefaultFileRenamePolicy());

				String selectFunc = multi.getParameter("selectFunc");

				if (selectFunc.equals("I")){
					String id = multi.getParameter("id");
					String pw = multi.getParameter("pw");
					String name = multi.getParameter("name");
					String email = multi.getParameter("email");
					String hp = multi.getParameter("hp");
					String birth = multi.getParameter("birth");
					String postno = multi.getParameter("postno");
					String juso = multi.getParameter("juso");
					Enumeration imgFile = multi.getFileNames();
					String memberImg = (String)imgFile.nextElement();
					String imgPath = multi.getFilesystemName(memberImg);
					imgPath = KcmSqlQueryMap.IMG_OUTPUT_PATH + imgPath;
					//System.out.println(" memberImg >>>>>>>>>>>>>>>" + memberImg);
					System.out.println(" imgPath >>>>>>>>>>>>>>>" + imgPath);
					
					KcmMemberDAO kdao = null;
					boolean flag = false;
					KcmMemberVO kmvo = new KcmMemberVO();
					kmvo.setKid(id);
					kmvo.setKpw(pw);
					kmvo.setKname(name);
					kmvo.setKemail(email);
					kmvo.setKhp(hp);
					kmvo.setKbirth(birth);
					kmvo.setKpostno(postno);
					kmvo.setKjuso(juso);
					kmvo.setKimg_path(imgPath);
					
					kdao = new KcmMemberDAOImpl();
					flag = kdao.insertKcmMember(kmvo);
					
					request.setAttribute("flag", new Boolean(flag));
					//http://localhost:8088/Model2_MVC/member/jsp/insertKcmMember.jsp
					RequestDispatcher rd = request.getRequestDispatcher("/member/jsp/insertKcmMember.jsp");
					rd.forward(request, response);
				}
			}catch(Exception e){
				System.out.println("에러 발생 >>> " + e.getMessage());
			}


		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
