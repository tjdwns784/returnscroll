package com.spring.returnscroll.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class LoginSessionListener implements HttpSessionAttributeListener {

	public static Map<String, HttpSession> map = new HashMap<String, HttpSession>();

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// 로그인 시 등 세션에 값을 입력하면 동작하는 부분
		HttpSession session = se.getSession();
		String uid = (String) session.getAttribute("uid");
		
		boolean isLogged = map.containsKey(uid);
		if(isLogged) {
			HttpSession loggedSession = map.get(uid);
			loggedSession.invalidate();
		}
		
		map.put(uid, session);
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
	}

}
