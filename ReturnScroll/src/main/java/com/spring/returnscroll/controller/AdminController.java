package com.spring.returnscroll.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.returnscroll.Service.AdminService;
import com.spring.returnscroll.Service.ArticleService;
import com.spring.returnscroll.Service.ChatService;
import com.spring.returnscroll.Service.MemberService;

@Controller
public class AdminController {

	@Autowired
	MemberService memberservice;
	@Autowired
	ArticleService articleservice;
	@Autowired
	ChatService chatService;
	@Autowired
	AdminService adminService;

	
	// 관리자 회원목록
	@RequestMapping(value = "/admin_member", method = RequestMethod.GET)
	public String admin_member(Model model, HttpServletRequest req, 
			@RequestParam(value="page", defaultValue = "1") int page
			/*@,RequestParam Map<String, Object> map*/) {	
		
		model.addAttribute("admin_member",adminService.admin_member());
		
		int endNum = page * 10;
		int startNum = endNum - 10;
		
//		map.put("page", page);
//		map.put("startNum", startNum);
		
		// 전체 qna 게시물 개수
		// 전체 페이지 알아내기
		int total = adminService.admin_selectTotalCount();
		model.addAttribute("total",total);
		model.addAttribute("page",page);
		
//		String searchText = (String) map.get("searchText");
//		String searchItem = (String) map.get("searchItem");
//		String searchOrd = (String) map.get("searchOrd");
		
//		model.addAttribute("searchText", searchText);
//		model.addAttribute("searchItem", searchItem);
//		model.addAttribute("searchOrd", searchOrd);
		
		
		return "/admin/admin_member";					
	}
	

	// 관리자 회원탈퇴 액션
	@RequestMapping(value="/admin_userDelete", method = RequestMethod.POST)
	@ResponseBody
	public String admin_userDeleteAction(@RequestParam Map<String, Object> map, HttpSession httpSession) {
	    // 1이면 탈퇴, 0이면 탈퇴 실패
		int result = adminService.admin_userDelete(map);
		String msg = "";
		if(result == 1) {
			msg = "success";
		} else {
			msg = "fail";
		}
		
		return msg;
	}
	
	// 관리자 회원수정
	@RequestMapping(value="/admin_userUpdate/{userid}", method = RequestMethod.GET)
	public String admin_userUpdate(HttpSession session, Model model, @PathVariable("userid") String userid) { 
		Map<String, Object> uid = (Map<String, Object>) session.getAttribute("uid");
		Map<String, String> info = memberservice.mypage(userid);
		String phone = info.get("phone");
		String p1 = phone.substring(0, 3);
		String p2 = phone.substring(3, 7);
		String p3 = phone.substring(7);
		
		info.put("p1", p1);
		info.put("p2", p2);
		info.put("p3", p3);
		
		model.addAttribute("info", info);
		
		return "/admin/admin_userUpdate";
	}
		
	// 관리자 회원정보수정 액션
	@RequestMapping(value="/admin_userUpdateAction", method = RequestMethod.POST)
	public String admin_userUpdateAction(@RequestParam Map<String, Object> map) {
		String p1 = (String) map.get("p1");
		String p2 = (String) map.get("p2");
		String p3 = (String) map.get("p3");
		
		map.put("phone", p1 + p2 + p3);

		adminService.admin_userUpdate(map);
		
		return "/admin/admin_userUpdateAction"; 
	}
	
	// 관리자 닉네임 중복확인
	@RequestMapping(value = "/admin_mpnickDup", method = RequestMethod.GET)
	@ResponseBody
	public int admin_mpnickDup(@RequestParam Map<String, Object> map) {
			String result = adminService.admin_mpnickDup(map);
			int a = 0;
			if (result != null) {
				a = 1;
			}
			return a;
		}
	
	// 관리자 EMAIL 중복확인
	@RequestMapping(value = "/admin_mpemailDup", method = RequestMethod.GET)
	@ResponseBody
	public int admin_mpemailDup(@RequestParam Map<String, Object> map) {
			String result = adminService.admin_mpemailDup(map);
			int a = 0;
			if (result != null) {
				a = 1;
			}
			return a;
		}
	
	// 관리자 큐앤에이 게시판
	@RequestMapping(value = "/admin_article", method = RequestMethod.GET)
	public String admin_article(Locale locale, Model model, HttpSession httpSession, 
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
			
		
			return "/admin/admin_article";			
		}
		
	}
	
	// 관리자 게시판 글삭제하기
	@RequestMapping(value = "/admin_articleDelete/{no}")
	@ResponseBody
	public String admin_articleDelete(Model model, @PathVariable("no") int no, HttpSession httpSession) {
		System.out.println("no : " + no + "삭제");
		articleservice.deleteArticle(no);
		return "success";
	}
}
