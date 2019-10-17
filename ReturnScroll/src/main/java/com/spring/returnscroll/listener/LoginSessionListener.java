package com.spring.returnscroll.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class LoginSessionListener implements HttpSessionAttributeListener {

	public static Map<String, HttpSession> map = new HashMap<String, HttpSession>();

	public static Map<String, String> sessionList = new HashMap<String, String>();
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// 로그인 시 등 세션에 값을 입력하면 동작하는 부분
		HttpSession session = se.getSession();
		Map<String, Object> uid = (Map<String, Object>) session.getAttribute("uid");
		
		boolean isLogged = map.containsKey(uid.get("uid"));
		if(isLogged) {
			HttpSession loggedSession = map.get(uid.get("uid"));
			loggedSession.invalidate();
		}
		
		map.put((String) uid.get("uid"), session);
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		HttpSession session = se.getSession();
		Map<String, Object> uid = (Map<String, Object>) session.getAttribute("uid");
		
		map.remove(uid.get("uid"));
//		System.out.println("removed");
//		System.out.println(map);
//		HttpSession session = se.getSession();
//		String uid = (String) session.getAttribute("uid");
//		
//		System.out.println(uid);
//		
//		map.remove(uid);
//		session.invalidate();
//		
//		System.out.println(map);
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
	}

}
