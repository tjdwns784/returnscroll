package com.spring.returnscroll.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.UsersDao;

@Service
public class MemberService {

	@Autowired
	UsersDao usersDao;

	public int join(Map<String, Object> map) {
		return usersDao.join(map);

	}

	public String idDup(String id) {
		return usersDao.dup(id);

	}

	public String nickDup(String nick) {
		return usersDao.dupNick(nick);

	}

	public String emailDup(String email) {
		return usersDao.dupEmail(email);

	}

	public Map<String, Object> login(Map<String, Object> map) {
		return null;
	}

	// 채팅에 멤버초대하는 거임. 
	public Map<String, String> chatInvite(String uid) {
		return usersDao.chatInvite(uid);
		
	}

}