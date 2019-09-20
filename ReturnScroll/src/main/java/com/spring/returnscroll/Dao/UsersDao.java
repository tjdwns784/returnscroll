package com.spring.returnscroll.Dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDao {
	@Autowired
	SqlSessionTemplate ss;

	public int join(Map<String, Object> map) {
		return ss.insert("users.insert", map);
	}

	public String login(Map<String, Object> map) {
		return ss.selectOne("users.login", map);
	}
	
	public String dup(String uid) {
		return ss.selectOne("users.uid", uid);
	}

	public String dupNick(String nick) {
		return ss.selectOne("users.nick", nick);
	}

	public String dupEmail(String email) {
		return ss.selectOne("users.email", email);
	}
	
}