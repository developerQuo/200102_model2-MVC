package bitcamp.java142.ch6.kcmjf.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class SessionUtil {

	/*
	 * 클라이언트 브라우저에 문서가 캐쉬되는 것을 막는다.
	 * 
	 * @param	hReq	http request
	 * @param	hRes	http response
	 * */
	public static void setNoCache(HttpServletRequest hReq
								 ,HttpServletResponse hRes)
	{
		if(hReq.getProtocol().compareTo("HTTP/1.0") == 0)
		{
			// HTTP 1.0 이면
			hRes.setHeader("Pragma", "no-cache");
		}
		else if(hReq.getProtocol().compareTo("HTTP/1.1") == 0)
		{
			// HTTP 1.1 이면
			hRes.setHeader("Cache-control", "no-cache");
		}
		
		// proxy server
		hRes.setDateHeader("Expires", 0);
	}
	
	/*
	 * 클라이언트 브라우저에 문서가 캐쉬되는 것을 막는다.
	 * 
	 * @param	hRes	http response
	 */
	public static void setNoCache(HttpServletResponse hRes)
	{
		// HTTP 1.1 용
		hRes.setHeader("Cache-Control", "no-store");
		
		// HTTP 1.0 용
		hRes.setHeader("Pragma", "no-cache");
		
		// proxy server
		hRes.setDateHeader("Expires", 0);
	}
	
	/*
	 * Object가 null인지 체크한다.
	 * 
	 * @param	object	null인지 체크할 Obj.
	 * @return	object	null이면 true,	null아니면 false를 리턴. 
	 */
	public static boolean isNull(Object object)
	{
		if(object == null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
