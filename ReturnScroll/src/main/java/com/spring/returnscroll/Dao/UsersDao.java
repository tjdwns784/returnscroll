package com.spring.returnscroll.Dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDao {
	@Autowired
	SqlSessionTemplate ss;

	// 메일에 가입한 이름 뜨게 하는거
	public String mailId(String uid, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("email", email);
		return ss.selectOne("users.mailId", map);
	}

	// 아이디 찾기
	public String searchId(String uname, String phone) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uname", uname);
		map.put("phone", phone);
		return ss.selectOne("users.searchId", map);
	}
	
	// 비번 찾기
	public String searchPassword(String uid, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("email", email);
		return ss.selectOne("users.searchPassword", map);
	}

	// 회원가입
	public int join(Map<String, Object> map) {
		return ss.insert("users.insert", map);
	}
	
	// 카카오 로그인
	public Map<String, Object> loginKakao(String kakao) {				
		return ss.selectOne("users.loginKakao", kakao);		
	}	
	
	// 페이스북 로그인
	public Map<String, Object> loginFacebook(String facebook) {				
		return ss.selectOne("users.loginFacebook", facebook);		
	}	
		
	// 네이버 로그인
	public Map<String, Object> loginNaver(String naver) {				
		return ss.selectOne("users.loginNaver", naver);		
	}	
		
	// 구글 로그인
	public Map<String, Object> loginGoogle(String google) {				
		return ss.selectOne("users.loginGoogle", google);		
	}	
		
	// 로그인
	public Map<String, Object> login(Map<String, Object> map) {
		return ss.selectOne("users.login", map);
	}
	
	// 회원 수정
	public int userUpdate(Map<String, Object> map) {
		return ss.update("users.update", map);
	}
	
	// 회원 탈퇴
	public int userDelete(Map<String, Object> map) {
		return ss.delete("users.delete", map);
	}
	
	// 카카오 아이디 중복
	public String dupKakao(String kakao) {
		return ss.selectOne("users.kakao", kakao);
	}
		
	// 페이스북 아이디 중복
	public String dupFacebook(String facebook) {
		return ss.selectOne("users.facebook", facebook);
	}
		
	// 네이버 아이디 중복
	public String dupNaver(String naver) {
		return ss.selectOne("users.naver", naver);
	}
	
	// 구글 아이디 중복
	public String dupGoogle(String google) {
		return ss.selectOne("users.google", google);
	}
	
	// 아이디 중복
	public String dup(String uid) {
		return ss.selectOne("users.uid", uid);
	}
	
	// 닉네임 중복
	public String dupNick(String nick) {
		return ss.selectOne("users.nick", nick);
	}

	// 이메일 중복
	public String dupEmail(String email) {
		return ss.selectOne("users.email", email);
	}

	public Map<String, String> chatInvite(String uid) {

		return ss.selectOne("users.invite",uid);	
	}
	
	
	public String userNick(String uid) {
		return ss.selectOne("users.userNick",uid);
	}
	
	// 마이 페이지 자동입력
	public Map<String, String> mypage(String uid) {
		return ss.selectOne("users.mypage",uid);
	}
	
	// 마이 페이지 닉네임 중복확인
	public String mpdupNick(Map<String, Object> map) {
		return ss.selectOne("users.nick2", map);
	}

	// 마이 페이지 이메일 중복확인
	public String mpdupEmail(Map<String, Object> map) {
		return ss.selectOne("users.email2", map);
	}
	
	// 패스워드 변경
	public int passwordUpdate(Map<String, Object> map) {
		return ss.update("users.passwordUpdate", map);
	}	

}