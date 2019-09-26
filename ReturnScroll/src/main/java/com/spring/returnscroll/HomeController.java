package com.spring.returnscroll;

import java.util.Locale;
import java.util.Map;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

=======
>>>>>>> branch 'master' of https://github.com/tjdwns784/returnscroll.git
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

/**
 * Handles requests for the application home page.
 */


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
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Locale locale, Model model) {

		return "map";
	}
	
	@RequestMapping(value = "/kmap", method = RequestMethod.GET)
	public String kmap(Locale locale, Model model) {

		return "kmap";
	}
	
	@RequestMapping(value = "/tmap", method = RequestMethod.GET)
	public String tmap(Locale locale, Model model) {

		return "tmap";
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model, HttpSession httpSession) {
		System.out.println("세션값은 ?"+httpSession.getAttribute("uid"));
		if(httpSession.getAttribute("uid") == null) {
			// 세션 아이디 값이 없으면 로그인 화면으로 (알림창도 띄우기)
			return "redirect:login";
		}else {
			// 채팅 들어갈때 세션아이디값을 닉네임으로 보내주도록 하여라 
			Object uid = httpSession.getAttribute("uid");
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
	 
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {

		return "mypage";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "index";
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(Locale locale, Model model) {
		model.addAttribute("list",articleservice.select());
		return "qna";
	}
	
	@RequestMapping(value = "/write", method=RequestMethod.GET)
	public String write(Model model) {

		return "write_qna";
	}
	
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public String writePost(@RequestParam Map<String,Object> map) {
		articleservice.insert(map);
		return "write_qna";
	}
	
	@RequestMapping(value = "/show/{no}")
	public String show_qna(Model model, @PathVariable("no") int no) {
		model.addAttribute("article",articleservice.selectById(no));
		return "show_qna";
	}
}
