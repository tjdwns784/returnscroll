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
	
	// My page 자동입력
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, HttpSession httpSession) {
			if(httpSession.getAttribute("uid") == null) {
				// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
				return "redirect:login";
			}else {
				Object userId = httpSession.getAttribute("uid");
				String uid = userId.toString();
				Map<String, String> map = memberservice.mypage(uid);
				model.addAttribute("map", map);
				return "mypage";			
			}
		}
	
	// My page 닉네임 중복확인
	@RequestMapping(value = "/mpnickDup", method = RequestMethod.GET)
	@ResponseBody
	public int mpdupNick(@RequestParam Map<String, Object> map) {
			String result = memberservice.mpnickDup(map);
			int a = 0;
			if (result != null) {
				a = 1;
			}
			return a;
		}
	
	// My page EMAIL 중복확인
	@RequestMapping(value = "/mpemailDup", method = RequestMethod.GET)
	@ResponseBody
	public int mpdupEmail(@RequestParam Map<String, Object> map) {
			String result = memberservice.mpemailDup(map);
			int a = 0;
			if (result != null) {
				a = 1;
			}
			return a;
		}
		
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
	public String login(Locale locale, Model model,HttpSession httpSession) {
		if(httpSession.getAttribute("uid") == null) {
			return "login";
		}else {
			return "redirect:/index";			
		}
	}
	
	// 로그인
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
		
	    Map<String, Object> user = memberservice.login(map);				
								
		if (user != null) {						
			httpSession.setAttribute("uid", map.get("uid"));
			return "success";					
		} else {						
			model.addAttribute("msg", "다시 로그인 해주세요.");
			return "fail";					
		}						
	}	
	
	// 카카오 로그인
	@RequestMapping(value = "/loginKakao", method = RequestMethod.GET)				
	public String loginKakao(Model model, @RequestParam Map<String, Object> map, HttpServletRequest req ) {			
				
		Map<String, Object> user = memberservice.loginKakao((String) map.get("kakao"));		
		HttpSession session = req.getSession();		
		System.out.println("map");		
		System.out.println(user);		
				
		session.setAttribute("uid", user.get("uid"));		
		return "redirect:/index";		
	}			

	// 페이스북 로그인
	@RequestMapping(value = "/loginFacebook", method = RequestMethod.GET)				
	public String loginFacebook(Model model, @RequestParam Map<String, Object> map, HttpServletRequest req ) {			
				
		Map<String, Object> user = memberservice.loginFacebook((String) map.get("facebook"));		
		HttpSession session = req.getSession();		
		System.out.println("map");		
		System.out.println(user);		
				
		session.setAttribute("uid", user.get("uid"));		
		return "redirect:/index";		
	}		
	
	// 네이버 로그인
	@RequestMapping(value = "/loginNaver", method = RequestMethod.GET)				
	public String loginNaver(Model model, @RequestParam Map<String, Object> map, HttpServletRequest req ) {			
				
		Map<String, Object> user = memberservice.loginNaver((String) map.get("naver"));		
		HttpSession session = req.getSession();		
		System.out.println("map");		
		System.out.println(user);		
				
		session.setAttribute("uid", user.get("uid"));		
		return "redirect:/index";		
	}			
	
	// 구글 로그인
	@RequestMapping(value = "/loginGoogle", method = RequestMethod.GET)				
	public String loginGoogle(Model model, @RequestParam Map<String, Object> map, HttpServletRequest req ) {			
				
		Map<String, Object> user = memberservice.loginGoogle((String) map.get("google"));		
		HttpSession session = req.getSession();		
		System.out.println("map");		
		System.out.println(user);		
				
		session.setAttribute("uid", user.get("uid"));		
		return "redirect:/index";		
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
	public String userrUpdate(HttpSession session, Model model) { 
		String uid = (String) session.getAttribute("uid");
		Map<String, String> info = memberservice.mypage(uid);
		String phone = info.get("phone");
		String p1 = phone.substring(0, 3);
		String p2 = phone.substring(3, 7);
		String p3 = phone.substring(7);
		
		info.put("p1", p1);
		info.put("p2", p2);
		info.put("p3", p3);
				
		model.addAttribute("info", info);
		
		return "userUpdate";
	}
	
	// 회원정보수정 액션
	@RequestMapping(value="/userUpdateAction", method = RequestMethod.POST)
	public String userUpdateAction(@RequestParam Map<String, Object> map) {
		// 암호화
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
			    
		String p1 = (String) map.get("p1");
		String p2 = (String) map.get("p2");
		String p3 = (String) map.get("p3");
		
		map.put("phone", p1 + p2 + p3);

		memberservice.userUpdate(map);
		
		return "userUpdateAction"; 
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
	public String userDelete(Model model, HttpServletRequest req) {							
		return "userDelete";					
		}
	
	// 회원탈퇴 액션
	@RequestMapping(value="/userDeleteAction", method = RequestMethod.POST)
	@ResponseBody
	public String userDeleteAction(@RequestParam Map<String, Object> map, HttpSession httpSession) {
		// 암호화
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
		
	    // 1이면 탈퇴, 0이면 탈퇴 실패
		int result = memberservice.userDelete(map);
		String msg = "";
		if(result == 1) {
			msg = "success";
		} else {
			msg = "fail";
		}
		
		httpSession.invalidate();
		
		return msg;
	}
	

	// 회원가입 불러오기
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {

		return "join";
	}
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(@RequestParam Map<String, Object> map, HttpServletResponse response ) throws IOException {
		if(map.containsKey("kakao")) {
			String kakao = (String) map.get("kakao");
			kakao = "kakao_" + kakao;
			map.put("uid", kakao);
		}
		
		if(map.containsKey("facebook")) {
			String facebook = (String) map.get("facebook");
			facebook = "facebook_" + facebook;
			map.put("uid", facebook);
		}
		
		if(map.containsKey("google")) {
			String google = (String) map.get("google");
			google = "google_" + google;
			map.put("uid", google);
		}
		
		String upw = (String) map.get("upw");
		String result2="";
		
		if(upw != null) {
		    try {
		        MessageDigest md5 = MessageDigest.getInstance("MD5");
		        byte[] byteValue = md5.digest(upw.getBytes());
		             
		        Base64 base64EnDe =new Base64();
		 
		        result2 = base64EnDe.encodeToString(byteValue).replaceAll("\r\n","");
		    }catch (NoSuchAlgorithmException e) {
		        e.printStackTrace();
		    }
		} else { // 소셜 로그인하였을때  db에 등록되는 비밀번호 값
			result2 = "random_062411171228";
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
	
	// 카카오 중복확인
	@RequestMapping(value = "/kakaoDup", method = RequestMethod.GET)				
	@ResponseBody				
	public int dupKakao(HttpServletRequest req) {				
		String result = memberservice.kakaoDup(req.getParameter("kakao"));
		// 중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김			
		int a = 0;			
		if (result != null) {			
			a = 1;		
		}			
					
		return a;			
	}		
	
	// 페이스북 중복확인
	@RequestMapping(value = "/facebookDup", method = RequestMethod.GET)				
	@ResponseBody				
	public int dupFacebook(HttpServletRequest req) {				
		String result = memberservice.facebookDup(req.getParameter("facebook"));
		// 중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김			
		int a = 0;			
		if (result != null) {			
			a = 1;		
		}			
					
		return a;			
	}			
		
	// 네이버 중복확인
	@RequestMapping(value = "/naverDup", method = RequestMethod.GET)				
	@ResponseBody				
	public int dupNaver(HttpServletRequest req) {				
		String result = memberservice.naverDup(req.getParameter("naver"));
		// 중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김			
		int a = 0;			
		if (result != null) {			
			a = 1;		
		}			
					
		return a;			
	}			
		
	// 구글 중복확인
	@RequestMapping(value = "/googleDup", method = RequestMethod.GET)				
	@ResponseBody				
	public int dupGoogle(HttpServletRequest req) {				
		String result = memberservice.googleDup(req.getParameter("google"));
		// 중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김			
		int a = 0;			
		if (result != null) {			
			a = 1;		
		}			
					
		return a;			
	}			
		
	// ID 중복확인
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

	// 닉네임 중복확인
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

	// EMAIL 중복확인
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
