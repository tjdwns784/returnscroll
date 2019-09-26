package com.spring.returnscroll.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
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

	// 아이디 찾기
	@RequestMapping(value = "/userSearch", method = RequestMethod.GET)
	public String userIdSearch() {
		return "userSearch";
	}
	@RequestMapping(value = "/userSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearchPost(@RequestParam("uname") String uname, 
			@RequestParam("phone") String phone) {
		
		String result = memberservice.get_searchId(uname, phone);
		
		return result;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/searchPassword", method = RequestMethod.POST)
	@ResponseBody
	public String passwordSearch(@RequestParam("uid")String uid,
			@RequestParam("email")String email,
			HttpServletRequest request) {

		memberservice.mailSendWithPassword(uid, email);
		
		return "userSearchPassword";
	}
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String loginPost(Model model, HttpServletRequest req, HttpSession httpSession, @RequestParam Map<String, Object> map) {
		String upw = (String) map.get("upw");
		
		String result2="";
	    try {
	        MessageDigest md5 = MessageDigest.getInstance("MD5");
	        byte[] byteValue = md5.digest(upw.getBytes());
	             
	        Base64 base64EnDe =new Base64();
	 
	        result2 = base64EnDe.encodeToString(byteValue).replaceAll("\r\n","");
	    }catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	    }
	    map.put("upw", result2);
		
		
		String user = memberservice.login(map);				
								
		if (user != null) {						
			httpSession.setAttribute("uid", map.get("uid"));
			return "success";					
		} else {						
			model.addAttribute("msg", "다시 로그인 해주세요.");
			return "fail";					
		}						
	}		
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)							
	public String logout(Model model, HttpServletRequest req) {							
		HttpSession session = req.getSession();						
		session.invalidate();						
		return "redirect:/index";						
	}		
	
	// 회원수정
	@RequestMapping(value="/userUpdate", method = RequestMethod.GET)
	public String userrUpdate() {      
		return "userUpdate";
	}
	
	// 회원정보수정 액션
	@RequestMapping(value="/userUpdateAction", method = RequestMethod.POST)
	public String userUpdateAction(@RequestParam Map<String, Object> map) {
		memberservice.userUpdate(map);
		return "redirect:/index"; 
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
	public String userDelete(Model model, HttpServletRequest req) {							
		return "userDelete";					
		}
	
	// 회원탈퇴 액션
	@RequestMapping(value="/userDeleteAction", method = RequestMethod.POST)
	public String userDeleteAction(@RequestParam Map<String, Object> map) {
		memberservice.userDelete(map);
		return "redirect:/index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {

		return "join";
	}
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(@RequestParam Map<String, Object> map, HttpServletResponse response ) throws IOException {
		String upw = (String) map.get("upw");
		
		String result2="";
	    try {
	        MessageDigest md5 = MessageDigest.getInstance("MD5");
	        byte[] byteValue = md5.digest(upw.getBytes());
	             
	        Base64 base64EnDe =new Base64();
	 
	        result2 = base64EnDe.encodeToString(byteValue).replaceAll("\r\n","");
	    }catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	    }
	    map.put("upw", result2);
		
		String y = (String) map.get("year");
		String m = (String) map.get("month");
		String d = (String) map.get("day");
		String p1 = (String) map.get("p1");
		String p2 = (String) map.get("p2");
		String p3 = (String) map.get("p3");
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		map.put("birth", y + m + d);
		map.put("phone", p1 + p2 + p3);
		int result = memberservice.join(map);
		if (result == 1) {
			out.println("<script language='javascript'>");
			out.println("alert('회원가입을 환영합니다!!!');");
			out.println("</script>");
			out.flush();
			return "index";
		} else {
			out.println("<script language='javascript'>");
			out.println("alert('회원가입을  다시해주세요.');");
			out.println("</script>");
			out.flush();
			return "join";
		}

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
