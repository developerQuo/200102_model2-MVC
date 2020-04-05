package bitcamp.java142.ch6.kcmjf.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class SessionUtil {

	/*
	 * Ŭ���̾�Ʈ �������� ������ ĳ���Ǵ� ���� ���´�.
	 * 
	 * @param	hReq	http request
	 * @param	hRes	http response
	 * */
	public static void setNoCache(HttpServletRequest hReq
								 ,HttpServletResponse hRes)
	{
		if(hReq.getProtocol().compareTo("HTTP/1.0") == 0)
		{
			// HTTP 1.0 �̸�
			hRes.setHeader("Pragma", "no-cache");
		}
		else if(hReq.getProtocol().compareTo("HTTP/1.1") == 0)
		{
			// HTTP 1.1 �̸�
			hRes.setHeader("Cache-control", "no-cache");
		}
		
		// proxy server
		hRes.setDateHeader("Expires", 0);
	}
	
	/*
	 * Ŭ���̾�Ʈ �������� ������ ĳ���Ǵ� ���� ���´�.
	 * 
	 * @param	hRes	http response
	 */
	public static void setNoCache(HttpServletResponse hRes)
	{
		// HTTP 1.1 ��
		hRes.setHeader("Cache-Control", "no-store");
		
		// HTTP 1.0 ��
		hRes.setHeader("Pragma", "no-cache");
		
		// proxy server
		hRes.setDateHeader("Expires", 0);
	}
	
	/*
	 * Object�� null���� üũ�Ѵ�.
	 * 
	 * @param	object	null���� üũ�� Obj.
	 * @return	object	null�̸� true,	null�ƴϸ� false�� ����. 
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
