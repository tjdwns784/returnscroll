package com.spring.returnscroll;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.returnscroll.Service.ArticleService;
import com.spring.returnscroll.Service.ChatService;
import com.spring.returnscroll.Service.MemberService;
import com.spring.returnscroll.listener.LoginSessionListener;


@Controller
public class HomeController  {
	
	@Autowired
	MemberService memberservice;
	@Autowired
	ArticleService articleservice;
	@Autowired
	ChatService chatService;
	  
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession httpSession) {
		if(httpSession.getAttribute("uid") == null) {
			return "index";
		}else {
			// 초대가 왔다는 것을 알림
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String uid = (String) userId.get("uid");
			
			return "index";
		}
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
	public String tmap(Locale locale, Model model, HttpSession httpSession, @RequestHeader(required = false, value="user-agent") String userAgent) {
				
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:/login";
		}else {
			
			System.out.println(userAgent);
			
//			if(userAgent != null) {
//				if(userAgent.indexOf("Android") > -1 && userAgent.indexOf("Mobile") > -1) {
//					System.out.println("안드로이드");
//					return "tmap_app";
//				}
//			}
//			System.out.println("웹");
			return "tmap";
				
		}

	}
	
	// 채팅주소로 들어갈때 로그인 세션이 있는지 없는 지 검사 & 세션있으면 채팅방 리스트를 볼 수 있음
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model, HttpSession httpSession) {
		// 로그인이 안돼어있으면 로그인 화면으로 가게하기
		if(httpSession.getAttribute("uid") == null) {
			return "redirect:/login";
		}else {
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String uid = (String) userId.get("uid");
			
	         List<Map<String, Object>> inviteList = chatService.inviteList(uid);
			if(inviteList.isEmpty()) {
	            // 리스트가 비어있으면 model에 저장 안함.
				
	         }else {
	            // 리스트가 비어있지 않으면 ==> 친구요청이 있으면 !
	        	 model.addAttribute("inviteList",inviteList);
	         }
	
			// 채팅방 리스트 불러오기
			List<Map<String, Object>> list = chatService.selectList();
			model.addAttribute("list",chatService.selectList());
			
			// 채팅방 리스트 보여주기
			return "chatList";
		}
	}
	
	// 현재 채팅방에 아무도 입장하지 않은 방들을 보여줌
	@RequestMapping(value = "/chat/allRoom", method = RequestMethod.GET)
	public String chatAllRoom(Locale locale, Model model, HttpSession httpSession) {
		// 로그인이 안돼어있으면 로그인 화면으로 가게하기
		if(httpSession.getAttribute("uid") == null) {
			return "redirect:/login";
		}else {

			// 채팅방 리스트 불러오기
			List<Map<String, Object>> list = chatService.selectAllList();
			model.addAttribute("list",chatService.selectAllList());
			
			// 채팅방 리스트 보여주기
			return "chatAllList";
		}
	}
	
	
	// {roomNum}번 채팅방으로 접속
	@RequestMapping(value = "/chat/{roomNum}", method = RequestMethod.GET)
	public String chatRoom(Locale locale, Model model, HttpSession httpSession
			,@PathVariable("roomNum") int roomNum) {
		
		// 접속자의 아이디 얻기
		Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
		String uid = (String) userId.get("uid");
		
		// 디비에 접속자 추가 (접속한 사람의 세션 값으로 ) if-else
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("uid",uid);
//		map.put("roomId",roomNum);
//		chatService.addUser(map);
		
		// room에 입장한 회원추가 시키기 (insert)
		model.addAttribute("RoomNum",roomNum);
		Map<String, Object> map2 = chatService.roomIn(roomNum);
		model.addAttribute("room",map2);
		
		// 현재 여기 접속중인 회원의 정보를 보내줌,
		List<Map<String, Object>> userList = chatService.roomMember(roomNum);
		model.addAttribute("roomUser",userList);

		// 룸정보를 보내줌(현재 디비는 구분되지만 소켓쪽에서 인식을 못함)
		return "chat";
	}
	
	// 현재 채팅방에 접속한 회원들 리스트를 보내줌 (Ajax통신)
	@RequestMapping(value = "/chat/roomData", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Map<String, Object>> roomData(Model model, @RequestParam("roomId") int roomId){		
		List<Map<String, Object>> userList = chatService.roomMember(roomId);
		return userList;
	}
	
	// 채팅방 생성 페이지 보여줌
	@RequestMapping(value = "/chat/createRoom", method = RequestMethod.GET)
	public String chatRoom(Locale locale, Model model, HttpSession httpSession) {

		// 채팅방 생성페이지 보여줌
		return "createRoom";
	}
	
	// 새로운 채팅방 만들어서 DB저장(POST방식) 한 후 ch-at리스트로 돌아가기 
	@RequestMapping(value = "/chat/createRoom", method = RequestMethod.POST)
	public String chatRoomPost(Locale locale, Model model, HttpSession httpSession,
			@RequestParam Map<String, Object> map) {
		
		// createRoom에서 보낸 map의 값을 디비에 저장
		chatService.createRoom(map);

		// 채팅방 리스트로 돌아가기
		return "redirect:/chat";
	}
	
	// 친구 추가할 때 회원의 아이디를 찾는거 (Ajax 통신)
	@RequestMapping(value = "/chat/findId", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, String> chatPost(@RequestParam("uid") String uid){
		
		Map<String, String> findUser = memberservice.chatInvite(uid);
		String uidFind = findUser.get("UID");
		String nick = memberservice.userNick(uidFind);
		System.out.println("초대할 회원의 아이디 : "+uidFind);
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid",uidFind);
		map.put("nick", nick);
		return map;
	}
	
	// 친구 추가할 때 회원의 아이디를 찾는거 (Ajax 통신)
	@RequestMapping(value = "/chat/getRoomInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, String> getRoomInfo(@RequestParam("roomId") String roomId){
		System.out.println("여기 들어옹니?");
		Map<String, String> maps = chatService.getRoomInfo(roomId);
		System.out.println("maps의 값 "+maps);
		return maps;
	}
		
		
	// 친구요청 수락 후 서로 친구 리스트에 추가
	@RequestMapping(value = "/chat/addfriend", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String addFriend(@RequestParam("sender") String sender,
			@RequestParam("recipient") String recipient) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sender", sender);
		map.put("recipient", recipient);
		chatService.accept(map); // 요청 확인 con값을 1로 변경

		// 친구리스트에 추가
		chatService.newFriendList(map);

		// INSERT 및 UPDATE를 진행한 후, 결과를 다시 들고옴
		List<Map<String, Object>> senderList = chatService.friendListCheck(sender);
		List<Map<String, Object>> recipientList = chatService.friendListCheck(recipient);

		return sender;
	}
	// 친구 요청을 거절
	@RequestMapping(value = "/chat/addfriendReject", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String addFriendReject(@RequestParam("sender") String sender,
			@RequestParam("recipient") String recipient) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sender", sender);
		map.put("recipient", recipient);
		chatService.accept(map); // 요청 확인 con값을 1로 변경

		return sender;
	}
	
	@RequestMapping(value = "/chat/deleteFriend", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String deleteFriend(@RequestParam("userId") String userId,
			@RequestParam("friendId") String friendId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("friendId", friendId);
		int result = chatService.deleteFriend(map);

		return friendId;
	}


	// 회원검색 후 초대하기 누르면 접속할 링크. 
	@RequestMapping(value = "/chat/{roomId}/{uid}", method = RequestMethod.GET)
	public String addUser(Model model ,HttpSession httpSession,
			@PathVariable("roomId") String roomId, @PathVariable("uid") String uid){
		
//		Object userId = httpSession.getAttribute("uid");
//		String nowUser = userId.toString(); // 지금 접속중인 사람의 아이디

		String userNick = memberservice.userNick(uid);
		model.addAttribute("uid", uid);
		model.addAttribute("nick", userNick);
		
		return "redirect:/chat/"+roomId;
	}
	
	@RequestMapping(value = "/friend", method = RequestMethod.GET)
	public String friend(Model model ,HttpSession httpSession){
		if(httpSession.getAttribute("uid") == null) {
			return "redirect:/login";
		}else {
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String uid = (String) userId.get("uid");
			
			 // 친구요청이 왔는지 안왔는지를 알아내는 코드 .
	         List<Map<String, Object>> addFriend = chatService.addFriend(uid);
	         if(addFriend.isEmpty()) {
	            // 리스트가 비어있으면 model에 저장 안함.
	         }else {
	            // 리스트가 비어있지 않으면 ==> 친구요청이 있으면 !
	            model.addAttribute("addFriend",addFriend);
	         }
	         
			// user의 친구 리스트 불러오기
			List<Map<String, Object>> friendList = chatService.friendList(uid);
			model.addAttribute("friendList",friendList);
			
			Map<String, HttpSession> sessionList = LoginSessionListener.map;
			Set<String> keySet = sessionList.keySet();
			
			System.out.println("세션리스트 값 : "+sessionList);
			model.addAttribute("sessionList", keySet);
			
			return "friend";
		}	
	}
	
	@RequestMapping(value = "/friend/{uid2}", method = RequestMethod.GET)
	public String friendView(Model model ,HttpSession httpSession,@PathVariable("uid2") String uids){
		if(httpSession.getAttribute("uid") == null) {
			return "redirect:/login";
		}else {
			// user정보불러오기
			Map<String, Object> friendInfo = chatService.userInfo(uids);
			model.addAttribute("friendInfo",friendInfo);
			
			
			Map<String, HttpSession> sessionList = LoginSessionListener.map;
			Set<String> keySet = sessionList.keySet();
			
			model.addAttribute("sessionList", keySet);
			
			System.out.println(httpSession.getAttribute("uid"));
			System.out.println(friendInfo);
			System.out.println("세션리스트 값 : "+sessionList);
			return "friendView";
		}	
	}
	
	@RequestMapping(value = "/friend/friendChatRoom", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String friendChatRoom(Locale locale, Model model, HttpSession httpSession,
			@RequestParam("roomName") String roomName, @RequestParam("createUser") String createUser,
			@RequestParam("friendId") String friendId) {
		
		// 세션아이디 값 얻기
		Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
		String uid = (String) userId.get("uid");
		
		// createRoom에서 보낸 map의 값을 디비에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("roomName은"+roomName);
		map.put("roomName",roomName);
		map.put("createUser",createUser);
		chatService.createRoom(map); // 방생성
		
		String roomNumber = chatService.roomNumber(map);
		System.out.println("roomNumber는 ? "+roomNumber);
		// 채팅방 리스트로 돌아가기
		return roomNumber;
	}
	
	@RequestMapping(value = "/friend/friendInviteRoom", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String friendInviteRoom(Locale locale, Model model, HttpSession httpSession,
			@RequestParam("roomNumber") String roomNumber, @RequestParam("sender") String sender,
			@RequestParam("recipient") String recipient) {
		
		// createRoom에서 보낸 map의 값을 디비에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roomNumber",roomNumber);
		map.put("sender",sender);
		map.put("recipient",recipient);
		
		// 채팅방에 초대
		chatService.roomInvite(map);
		System.out.println("roomNumber는 ? "+roomNumber);
		// 채팅방 리스트로 돌아가기
		return roomNumber;
	}
	
	@RequestMapping(value = "/friend/friendInviteCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String friendInviteCheck(Locale locale, Model model, HttpSession httpSession,
			@RequestParam("roomNumber") String roomNumber, @RequestParam("sender") String sender,
			@RequestParam("recipient") String recipient) {
		
		// createRoom에서 보낸 map의 값을 디비에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roomNumber",roomNumber);
		map.put("sender",sender);
		map.put("recipient",recipient);
		
		// 채팅 초대 알림 확인 처리,
		chatService.roomInviteCheck(map);
		
		System.out.println("초대받은 곳의 roomNumber는 ? "+roomNumber);
		// 채팅방 리스트로 돌아가기
		return roomNumber;
	}
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model,HttpSession httpSession) {
		if(httpSession.getAttribute("uid") == null) {
			return "index";
		}else {
			// 초대가 왔다는 것을 알림
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String uid = (String) userId.get("uid");
			
			List<Map<String, Object>> inviteList = chatService.inviteList(uid);
			if(inviteList.isEmpty()) {
	            // 리스트가 비어있으면 model에 저장 안함.
				
	         }else {
	            // 리스트가 비어있지 않으면 ==> 친구요청이 있으면 !
	        	 model.addAttribute("inviteList",inviteList);
	         }
			
			return "index";
		}
	}
	
	//큐앤에이 게시판
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(Locale locale, Model model, HttpSession httpSession, 
			@RequestParam(value="page", defaultValue = "1") int page,
			@RequestParam Map<String, Object> map) {

		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:/login";
		}else {
			int endNum = page * 10;
			int startNum = endNum - 10;
			
			map.put("page", page);
			map.put("startNum", startNum);
			
			model.addAttribute("list",articleservice.select(map));
			
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String useid = (String) userId.get("uid");
			String unick = (String) userId.get("nick");
			model.addAttribute("unick",unick);
			
			// 전체 qna 게시물 개수
			// 전체 페이지 알아내기
			int total = articleservice.selectTotalCount(map);
			model.addAttribute("total",total);
			model.addAttribute("page",page);
			
			String searchText = (String) map.get("searchText");
			String searchItem = (String) map.get("searchItem");
			String searchOrd = (String) map.get("searchOrd");
			
			model.addAttribute("searchText", searchText);
			model.addAttribute("searchItem", searchItem);
			model.addAttribute("searchOrd", searchOrd);
			
		
	
		
			return "qna";			
		}
		
	}
	
	
	//게시판에 글쓰기
	@RequestMapping(value = "/write", method=RequestMethod.GET)
	public String write(Model model, HttpSession httpSession) {
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:/login";
		}else {
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String useid = (String) userId.get("uid");
			String unick = (String) userId.get("nick");
			model.addAttribute("unick",unick);
						
			return "write_qna";
					
		}

	}
	
	//게시판에 글쓰기
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public String writePost(@RequestParam Map<String,Object> map) {
		
		articleservice.insert(map);
		System.out.println(map);
		
		return "redirect:qna";
	}
	//게시판에 글쓰기
	@RequestMapping(value = "/write2", method=RequestMethod.POST)
	@ResponseBody
	public String writePost2(MultipartHttpServletRequest mReq) {
		List<MultipartFile> mFiles = mReq.getFiles("file");
		
		// C:\dev\workspace-sts\.metadata\.plugins\org.eclipse.wst.server.core\tmp4\wtpwebapps\ReturnScroll\WEB-INF\classes
		String webAppPath = this.getClass().getClassLoader().getResource("").getPath();
		webAppPath = webAppPath.substring(0, webAppPath.indexOf("WEB-INF")) + "/resources/save_img";
		
		File saveDir = new File(webAppPath);
		if(!saveDir.isDirectory()) {
			saveDir.mkdirs();
		}
		
		String oFileName = "";
		for(MultipartFile mFile : mFiles) {
			// C:\dev\workspace-sts\.metadata\.plugins\org.eclipse.wst.server.core\tmp4\wtpwebapps\ReturnScroll\resources\save_img
			oFileName = mFile.getOriginalFilename();
			try {
				mFile.transferTo(new File(webAppPath + "/" + oFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		System.out.println("controller write2");
		
		return "/returnscroll/resources/save_img/" + oFileName;
	}
	

	
	//게시판 글쓴것 보기 
	@RequestMapping(value = "/show/{no}")
	public String show_qna(Model model, @PathVariable("no") int no, HttpSession httpSession,
			@RequestParam(value="page", defaultValue = "1") int page,
			@RequestParam Map<String, Object> map) {
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:/login";
		}else {
			
			model.addAttribute("article",articleservice.selectById(no));
			
			int endNum = page * 10;
			int startNum = endNum - 10;
			
			map.put("page", page);
			map.put("startNum", startNum);
			map.put("no",no);
		
			List<Map<String, Object>> list = articleservice.selectByComment(map);
			model.addAttribute("list2", list);
			
			
			// 세션아이디 값 얻기
			Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
			String useid = (String) userId.get("uid");
			String unick = (String) userId.get("nick");
			model.addAttribute("unick",unick);
						
			// 전체 qna 게시물 개수
			// 전체 페이지 알아내기
			int cTotal = articleservice.selectCommentCount(map);
			//System.out.println(cTotal);
			model.addAttribute("cTotal",cTotal);
			model.addAttribute("page",page);
			
			
			return "show_qna";
					
		}
	}
	
	//게시판 글수정하기
	@RequestMapping(value = "/articleUpdate/{no}", method=RequestMethod.GET)
		public String articleUpdate(Model model, @PathVariable("no") int no, HttpSession httpSession) {
			if(httpSession.getAttribute("uid") == null) {
				// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
				return "redirect:/login";
			}else {
				model.addAttribute("article",articleservice.selectById(no));
				//model.addAttribute(no);
				// 세션아이디 값 얻기
				Map<String, Object> userId = (Map<String, Object>) httpSession.getAttribute("uid");
				String useid = (String) userId.get("uid");
				String unick = (String) userId.get("nick");
				model.addAttribute("unick",unick);
				
				//System.out.println(unick);
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
				return "redirect:/login";
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
	@ResponseBody
	public String addComment(@RequestParam Map<String,Object> map) {
		articleservice.insertComment(map);
		return "ok";
	}
	
	@RequestMapping(value = "/gps")
	public String gps(Locale locale) {
		
		return "gps_socket";
	}
}