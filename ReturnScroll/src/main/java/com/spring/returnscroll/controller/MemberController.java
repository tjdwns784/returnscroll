package com.spring.returnscroll.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.returnscroll.Service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberservice;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(Locale locale, Model model, HttpServletRequest req, @RequestParam Map<String, Object> map) {

		Map<String, Object> user = memberservice.login(map);						
		HttpSession session = req.getSession();						
								
		if (user != null) {						
			session.setAttribute("uid", user.get("uid"));					
			return "index";					
		} else {						
			model.addAttribute("msg", "환영합니다.");					
			return "login";					
								
		}						
								
	}					
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)							
	public String logout(Model model, HttpServletRequest req) {							
		HttpSession session = req.getSession();						
		session.invalidate();						
		return "redirect:index";						
	}			

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {

		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public String joinPost(@RequestParam Map<String, Object> map) {
		String y = (String) map.get("year");
		String m = (String) map.get("month");
		String d = (String) map.get("day");
		map.put("birth", y + m + d);
		int result = memberservice.join(map);
		String msg = "";
		if (result == 1) {
			msg = "success";
		} else {
			msg = "fail";
		}

		return msg;
	}

	// 중복확인
	@RequestMapping(value = "/idDup", method = RequestMethod.GET)
	@ResponseBody
	public int dup(@RequestParam("id") String id) {
		String result = memberservice.idDup(id);
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}

	@RequestMapping(value = "/nickDup", method = RequestMethod.GET)
	@ResponseBody
	public int dupNick(@RequestParam("nick") String nick) {
		String result = memberservice.nickDup(nick);
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}

	@RequestMapping(value = "/emailDup", method = RequestMethod.GET)
	@ResponseBody
	public int dupEmail(@RequestParam("email") String email) {
		String result = memberservice.emailDup(email);
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}

}
//
//	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
//	public String logout(HttpServletRequest request, HttpSession httpsession) {
//		httpsession.invalidate(); //세션삭제
//		//메세지 출력후 페이지 이동
//		request.setAttribute("type", "success");
//		request.setAttribute("msg", "로그아웃");
//		request.setAttribute("url", "/home");
//		return "alert";
//		
//	}
//}