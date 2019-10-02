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
	public String qna(Locale locale, Model model, HttpSession httpSession, 
			@RequestParam(value="page", defaultValue = "1") int page,
			@RequestParam Map<String, Object> map) {

		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			int endNum = page * 10;
			int startNum = endNum - 10;
			
			map.put("page", page);
			map.put("startNum", startNum);
			
			model.addAttribute("list",articleservice.select(map));
			
			// 전체 qna 게시물 개수
			// 전체 페이지 알아내기
			int total = articleservice.selectTotalCount(map);
			model.addAttribute("total",total);
			model.addAttribute("page",page);
			String searchT = (String) map.get("searchText");
			model.addAttribute("searchText", searchT);
			
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
		return "redirect:qna";
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
	
	//게시판 글수정하기
	@RequestMapping(value = "/articleUpdate/{no}", method=RequestMethod.GET)
		public String articleUpdate(Model model, @PathVariable("no") int no, HttpSession httpSession) {
			if(httpSession.getAttribute("uid") == null) {
				// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
				return "redirect:login";
			}else {
				model.addAttribute(no);
				return "articleUpdate";		
			}
		}
	
	//게시판 글수정하기
		@RequestMapping(value = "/articleUpdate/{no}", method=RequestMethod.POST)
			public String articleUpdatePost( @PathVariable("no") int no,@RequestParam Map<String,Object> map) {
				 //System.out.println(map);
				articleservice.updateArticle(map);
				return "redirect:/show/"+ no;		
				
			}
		
	//게시판 글삭제하기
	@RequestMapping(value = "/articleDelete/{no}")
		public String articleDelete(Model model, @PathVariable("no") int no, HttpSession httpSession) {
			if(httpSession.getAttribute("uid") == null) {
				// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
				return "redirect:login";
			}else {
				
				articleservice.deleteArticle(no);
				return "redirect:/qna";
						
			}
	}
	
	//게시판 댓글삭제하기
		@RequestMapping(value = "/commentDelete/{cno}")
			public String commentDelete( 
					@PathVariable("cno") int cno, @RequestParam(value="no", required = false) int no, HttpServletRequest req) {
				
					articleservice.deleteComment(cno);
					String n = req.getParameter("no");
			
					return "redirect:/show/" + n;
	}

	//댓글입력
	@RequestMapping(value = "/addComment")
	public String addComment(@RequestParam Map<String,Object> map) {
		articleservice.insertComment(map);
		return "show_qna";
	}
}





















