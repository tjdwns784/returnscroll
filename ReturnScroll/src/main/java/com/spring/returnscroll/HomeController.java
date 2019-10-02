package com.spring.returnscroll;


import java.util.HashMap;

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
import com.spring.returnscroll.Service.ChatService;
import com.spring.returnscroll.Service.MemberService;


@Controller
public class HomeController  {
	
	@Autowired
	MemberService memberservice;
	@Autowired
	ArticleService articleservice;
	@Autowired
	ChatService chatService;
	  
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
	
	// 채팅주소로 들어갈때 로그인 세션이 있는지 없는 지 검사함.
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model, HttpSession httpSession) {
		// 로그인이 안돼어있으면 로그인 화면으로 가게하기
		if(httpSession.getAttribute("uid") == null) {
			return "redirect:login";
		}else {
			// 세션아이디 값 얻기
			Object userId = httpSession.getAttribute("uid");
			String uid = userId.toString();
			String nick = memberservice.userNick(uid);
			model.addAttribute("uid", uid);
			model.addAttribute("nick", nick); // chat에 nick 보내기
			
			// 채팅방 리스트 불러오기
			List<Map<String, Object>> list = chatService.selectList();
			model.addAttribute("list",chatService.selectList());
			// 채팅방 리스트 보여주기
			return "chatCreate";
		}
	}
	
	// {roomNum}번 채팅방으로 접속
	@RequestMapping(value = "/chat/{roomNum}", method = RequestMethod.GET)
	public String chatRoom(Locale locale, Model model, HttpSession httpSession
			,@PathVariable("roomNum") int roomNum) {
		// 접속자의 아이디 얻기
		Object userId = httpSession.getAttribute("uid");
		String uid = userId.toString();
		String nick = memberservice.userNick(uid);
		model.addAttribute("uid", uid);
		model.addAttribute("nick", nick); // chat에 nick 보내기
		// 디비에 접속자 추가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid",uid);
		map.put("roomId",roomNum);
		chatService.addUser(map);
		
		// room에 추가 시키기 (insert)
		model.addAttribute("RoomNum",roomNum);
		Map<String, Object> map2 = chatService.roomIn(roomNum);
		model.addAttribute("room",map2);
		
		// 룸정보를 보내줌(현재 디비는 구분되지만 소켓쪽에서 인식을 못함)
		return "chat";
	}
	// 채팅방 생성
	@RequestMapping(value = "/chat/createRoom", method = RequestMethod.GET)
	public String chatRoom(Locale locale, Model model, HttpSession httpSession) {
		// 세션아이디 값 얻기
		Object userId = httpSession.getAttribute("uid");
		String uid = userId.toString();
		String nick = memberservice.userNick(uid);
		model.addAttribute("uid", uid);
		model.addAttribute("nick", nick);
		// 채팅방 생성페이지 보여줌
		return "createRoom";
	}
	
	@RequestMapping(value = "/chat/createRoom", method = RequestMethod.POST)
	public String chatRoomPost(Locale locale, Model model, HttpSession httpSession,
			@RequestParam Map<String, Object> map) {
		// 세션아이디 값 얻기
		Object userId = httpSession.getAttribute("uid");
		String uid = userId.toString();
		model.addAttribute("uid", uid);
		// createRoom에서 보낸 map의 값을 디비에 저장
		chatService.createRoom(map);

		// 채팅방 리스트로 돌아가기
		return "redirect:/chat";
	}
	
	// 초대하는 회원 정보 불러오기
//	@RequestMapping(value = "/chat/{uid}", method = RequestMethod.POST)
//	public String chatAdd(Locale locale, Model model, @PathVariable("uid") String uid) {
//		
//		// 초대받은 회원의 닉네임 받기
//		String nick = memberservice.userNick(uid);
//		model.addAttribute("uid", uid);
//		model.addAttribute("nick", nick); // chat에 nick 보내기
//		System.out.println("초대할 회원의 닉네임 : "+nick);
//		
//		return "invite";	
//	}
	
	
	
	@RequestMapping(value = "/chat/findId", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String chatPost(@RequestParam("uid") String uid){
		
		Map<String, String> findUser = memberservice.chatInvite(uid);
		String uidFind = findUser.get("uid");
//		System.out.println("초대할 회원의 아이디 : "+uidFind);
		return uidFind;
	}
	

//	@RequestMapping(value = "/chat/addUser/{uid}", method = RequestMethod.GET)
//	public String addUser(Model model , @PathVariable("uid") String uid){
//		// url 경로를 변수화 하기. 
//		System.out.println("초대할 회원의 아이디 : "+uid);
//		// 아이디를 가지고 오는데... 이걸 어떻게 초대할건지
//		return "chat";
//	}
	 

	@RequestMapping(value = "/chat/addUser/{uid}", method = RequestMethod.GET)
	public String addUser(Model model , @PathVariable("uid") String uid){
		// url 경로를 변수화 하기. 
		System.out.println("초대할 회원의 아이디 : "+uid);
		// 아이디를 가지고 오는데... 이걸 어떻게 초대할건지
		return "chat";
	}
	
//	//마이페이지 고객 정보 수정
//	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
//	public String mypage(Locale locale, Model model, HttpSession httpSession) {
//
//		if(httpSession.getAttribute("uid") == null) {
//			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
//			return "redirect:login";
//		}else {
//			return "mypage";
//		}
//	}
	
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





















