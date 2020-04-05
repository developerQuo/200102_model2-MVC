package bitcamp.java142.ch6.board.controller;

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

import bitcamp.java142.ch6.board.dao.KcmHelloBoardDAO;
import bitcamp.java142.ch6.board.dao.KcmHelloBoardDAOImpl;
import bitcamp.java142.ch6.board.sql.KcmHelloBoardSqlMap;
import bitcamp.java142.ch6.board.vo.KcmHelloBoardVO;
import bitcamp.java142.ch6.kcmjf.sql.KcmSqlQueryMap;

/**
 * Servlet implementation class KcmHelloBoardServlet
 */
@WebServlet("/KcmHelloBoardServlet")
public class KcmHelloBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if (request.getContentType().toLowerCase().startsWith("multipart/form-data")){
			String imgInputPath = KcmHelloBoardSqlMap.BOARD_IMG_INPUT_PATH;
			int size = 10*1024*1024;
			try{
				MultipartRequest multi = new MultipartRequest(request,
						  imgInputPath,
						  size,
						  "EUC-KR",
						  new DefaultFileRenamePolicy());

				String selectFunc = multi.getParameter("selectFunc");
				

				if(selectFunc.equals("I")){
					//System.out.println(" (log) 'I' entered");
					KcmHelloBoardVO khbvo = null;
					
					String isudType = selectFunc;
					String chkInKno = multi.getParameter("chkInKno");
					String ksubject = multi.getParameter("ksubject");
					String kname = multi.getParameter("kname");
					String kpw = multi.getParameter("kpw");
					String kmemo = multi.getParameter("kmemo");
					String kdeleteyn = "Y";
					Enumeration imgFile = multi.getFileNames();
					String boardImg = (String)imgFile.nextElement();
					String kImgPath = multi.getFilesystemName(boardImg);
					kImgPath = KcmHelloBoardSqlMap.BOARD_IMG_OUTPUT_PATH + kImgPath;
					System.out.println(   isudType + " : " 
										+ chkInKno + " : "
										+ ksubject + " : "
										+ kname + " : "
										+ kpw + " : "
										+ kmemo + " : "
										+ kdeleteyn + " : "
										+ kImgPath);
					
					KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
					khbvo = new KcmHelloBoardVO(ksubject
											   ,kname
											   ,kpw
											   ,kmemo
											   ,kdeleteyn
											   ,kImgPath);
					int nCnt = khbdao.insertKcmHelloBoard(khbvo);
					
					request.setAttribute("nCnt", nCnt);
					//http://localhost:8088/Model2_MVC/board/jsp/insertKcmBoard.jsp
					RequestDispatcher rd = request.getRequestDispatcher("board/jsp/insertKcmBoardOK.jsp");
					rd.forward(request, response);
					
				}

				if(selectFunc.equals("U")){
					System.out.println(" (log) selectFunc 'U' entered");
					String chkInKno = multi.getParameter("chkInKno");
					String kno = multi.getParameter("kno");
					String ksubject = multi.getParameter("ksubject");
					String kname = multi.getParameter("kname");
					String kmemo = multi.getParameter("kmemo");
					Enumeration imgFile = multi.getFileNames();
					String boardImg = (String)imgFile.nextElement();
					String kImgPath = multi.getFilesystemName(boardImg);
					kImgPath = KcmHelloBoardSqlMap.BOARD_IMG_OUTPUT_PATH + kImgPath;
					
					KcmHelloBoardVO khbvo3 = null;
					KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
					
					khbvo3 = new KcmHelloBoardVO(kno,
												ksubject,
												kmemo,
												kImgPath);
					int nCnt = khbdao.updateKcmHelloBoard(khbvo3);
					
					request.setAttribute("nCnt", nCnt);
					RequestDispatcher rd = request.getRequestDispatcher("board/jsp/updateKcmBoardOK.jsp");
					rd.forward(request, response);
				}

			}catch(Exception e){
				System.out.println("에러 발생 >>> " + e.getMessage());
			}

		}
		
		if (request.getContentType().toLowerCase().startsWith("application/x-www-form-urlencoded")){
			request.setCharacterEncoding("EUC-KR");
			String selectFunc = request.getParameter("selectFunc");
			//System.out.println(" selectFunc >>> " + selectFunc);

			List<KcmHelloBoardVO> aList = null;
			KcmHelloBoardVO khbvo = null;
			
			if(selectFunc.equals("SA")){
				KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
				aList = khbdao.selectKcmHelloBoard();
				
				request.setAttribute("aList", aList);
				//http://localhost:8088/Model2_MVC/board/jsp/selectKcmBoard.jsp
				RequestDispatcher rd = request.getRequestDispatcher("board/jsp/selectKcmBoard.jsp");
				rd.forward(request, response);
			}

			if(selectFunc.equals("LIU")){
//				System.out.println(" (log) selectFunc 'LIU' entered");
				String isudType = selectFunc;
				String chkInKno = request.getParameter("chkInKno");
				
				if (isudType != null){
//					System.out.println("isudType >>> " + isudType);
//					System.out.println("chkInKno >>> " + chkInKno);
					boolean bool = "LIU".equals(isudType.toUpperCase());
					
					if (bool){
						KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
						
						KcmHelloBoardVO khbvo2 = new KcmHelloBoardVO();
						khbvo2.setKno(chkInKno);
						
						List<KcmHelloBoardVO> aList2 = khbdao.searchKcmHelloBoard(khbvo2);
						
						request.setAttribute("aList", aList2);
						//http://localhost:8088/Model2_MVC/board/jsp/updateKcmBoard.jsp
						RequestDispatcher rd = request.getRequestDispatcher("board/jsp/updateKcmBoard.jsp");
						rd.forward(request, response);
					}
				}
			}


			if(selectFunc.equals("LID")){
				System.out.println(" (log) selectFunc 'LID' entered");
				String chkInKno = request.getParameter("chkInKno");
				
				KcmHelloBoardVO khbvo4 = null;
				List<KcmHelloBoardVO> aList4 = null;
				KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
				
				khbvo4 = new KcmHelloBoardVO();
				khbvo4.setKno(chkInKno);
				aList4 = khbdao.searchKcmHelloBoard(khbvo4);
				
				request.setAttribute("aList", aList4);
				RequestDispatcher rd = request.getRequestDispatcher("board/jsp/deleteKcmBoard.jsp");
				rd.forward(request, response);
			}
			
			if(selectFunc.equals("D")){
				System.out.println(" (log) selectFunc 'D' entered");
				String kno = request.getParameter("kno");
				String kdeleteyn = "N";
				
				KcmHelloBoardVO khbvo5 = null;
				KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
			
				khbvo5 = new KcmHelloBoardVO(kno,
											kdeleteyn);
				int nCnt = khbdao.deleteKcmHelloBoard(khbvo5);
				
				request.setAttribute("nCnt", nCnt);
				RequestDispatcher rd = request.getRequestDispatcher("board/jsp/deleteKcmBoardOK.jsp");
				rd.forward(request, response);
			}
			
			if(selectFunc.equals("pwChck")){
				System.out.println(" (log) selectFunc 'pwChck' entered");
				String kno = request.getParameter("kno");
				String kpw = request.getParameter("kpw");
				
				KcmHelloBoardVO khbvo6 = null;
				KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();
				
				khbvo6 = new KcmHelloBoardVO();
				khbvo6.setKno(kno);
				khbvo6.setKpw(kpw);
				System.out.println("--------------khbvo6.getKno() " + khbvo6.getKno());
				System.out.println("--------------khbvo6.getKpw() " + khbvo6.getKpw());
				boolean pBool = khbdao.pwChckKcmHelloBoard(khbvo6);
				System.out.println("--------------pBool");
				request.setAttribute("pBool", pBool);
				RequestDispatcher rd = request.getRequestDispatcher("board/jsp/pwChckOK.jsp");
				rd.forward(request, response);
			}
		}
	}

}
