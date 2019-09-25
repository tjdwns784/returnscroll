package com.spring.returnscroll;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.returnscroll.Service.MemberService;

/**
 * Handles requests for the application home page.
 */


@Controller

public class HomeController  {
	@Autowired
	MemberService memberservice;
	  
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
	public String chat(Locale locale, Model model) {

		return "chat";
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
	
	@RequestMapping(value = "/practice", method = RequestMethod.GET)
	public String practice(Locale locale, Model model) {

		return "practice";
	}
}
