package com.spring.returnscroll.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.UsersDao;

@Service
public class AdminService {

	@Autowired
	UsersDao usersDao;

	// 관리자 게시판 목록 불러오기
	public List<Map<String, Object>> admin_member() {
		return usersDao.admin_member();
	}

	// 관리자 회원목록 전체 개수 찾기
	public int admin_selectTotalCount() {
		return usersDao.admin_selectTotalCount();
	}
	
	// 회원탈퇴
	public int admin_userDelete(Map<String, Object> map) {
		return usersDao.userDelete(map);
	}
	
	// 회원정보수정
	public int admin_userUpdate(Map<String, Object> map) {
		return usersDao.userUpdate(map);
	}

	// 관리자 닉네임 중복검사
	public String admin_mpnickDup(Map<String, Object> map) {
		return usersDao.mpdupNick(map);
	}
		
	// 관리자 EMAIL 중복검사
	public String admin_mpemailDup(Map<String, Object> map) {
		return usersDao.mpdupEmail(map);
	}
}