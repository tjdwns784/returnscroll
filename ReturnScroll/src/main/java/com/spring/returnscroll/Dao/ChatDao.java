package com.spring.returnscroll.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
	@Autowired
	SqlSessionTemplate ss;
	
	public  List<Map<String, Object>> selectList() {
		return ss.selectList("chat.selectRoom");
	}
	
	public  Map<String, Object> roomIn(int roomNum) {
		return ss.selectOne("chat.roomIn", roomNum);
	}

	public void createRoom(Map<String, Object> map) {
		ss.insert("chat.createRoom",map);
	}
	
	public void addUser(Map<String, Object> map) {
		ss.insert("chat.addUser",map);
	}
}