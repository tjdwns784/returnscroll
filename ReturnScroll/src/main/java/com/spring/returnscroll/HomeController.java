package com.spring.returnscroll;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.returnscroll.Service.ArticleService;
import com.spring.returnscroll.Service.MemberService;


@Controller
public class HomeController  {
	
	@Autowired
	MemberService memberservice;
	@Autowired
	ArticleService articleservice;
	  
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "index";
	}
	
	//지도 기본
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Locale locale, Model model) {

		return "map";
	}
	
	//지도 카카오맵
	@RequestMapping(value = "/kmap", method = RequestMethod.GET)
	public String kmap(Locale locale, Model model) {

		return "kmap";
	}
	
	//지도 티맵 - 사용하는것
	@RequestMapping(value = "/tmap", method = RequestMethod.GET)
	public String tmap(Locale locale, Model model, HttpSession httpSession) {
		
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			return "tmap";
				
		}

	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model, HttpSession httpSession) {
//		System.out.println("세션값은 ?"+httpSession.getAttribute("uid"));
		
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			Object userId = httpSession.getAttribute("uid");
			String uid = userId.toString();
			String nick = memberservice.userNick(uid);
			System.out.println("닉네임은 ? "+nick);
			model.addAttribute("uid", uid);
			model.addAttribute("nick", nick); // chat에 uid 보내기
			return "chat";			
		}
	}
	
	@RequestMapping(value = "/chat/findId", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String chatPost(@RequestParam("uid") String uid){
		
		Map<String, String> findUser = memberservice.chatInvite(uid);
		String uidFind = findUser.get("uid");
		System.out.println(uidFind);
		
		return uidFind;
	}
	
	@RequestMapping(value = "/chat/addUser/{uid}", method = RequestMethod.GET)
	public String addUser(Model model , @PathVariable("uid") String uid){
		// url 경로를 변수화 하기. 
		System.out.println("초대할 회원의 아이디 : "+uid);
		// 아이디를 가지고 오는데... 이걸 어떻게 초대할건지
		return "chat";
	}
	
	//마이페이지 고객 정보 수정
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, HttpSession httpSession) {

		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			return "mypage";
		}
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "index";
	}
	
	//큐앤에이 게시판
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(Locale locale, Model model, HttpSession httpSession) {

		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			model.addAttribute("list",articleservice.select());
			return "qna";			
		}
		
	}
	
	//게시판에 글쓰기
	@RequestMapping(value = "/write", method=RequestMethod.GET)
	public String write(Model model, HttpSession httpSession) {
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			return "write_qna";
					
		}

	}
	
	//게시판에 글쓰기
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public String writePost(@RequestParam Map<String,Object> map) {
		articleservice.insert(map);
		return "write_qna";
	}
	
	//게시판 글쓴것 보기 
	@RequestMapping(value = "/show/{no}")
	public String show_qna(Model model, @PathVariable("no") int no, HttpSession httpSession) {
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			model.addAttribute("article",articleservice.selectById(no));
			List<Map<String, Object>> list = articleservice.selectByComment(no);
			model.addAttribute("list2", list);
			return "show_qna";
					
		}
	}
	
	//댓글입력
	@RequestMapping(value = "/addComment")
	public String addComment(@RequestParam Map<String,Object> map) {
		articleservice.insertComment(map);
		return "show_qna";
	}
}
