package com.spring.returnscroll.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.ChatDao;

@Service
public class ChatService {

	@Autowired
	ChatDao chatDao;
	
	public List<Map<String, Object>> selectList() {
		 return chatDao.selectList();
	}
	public List<Map<String, Object>> selectAllList() {
		 return chatDao.selectAllList();
	}
	public Map<String, Object> roomIn(int roomNum) {
		 return chatDao.roomIn(roomNum);
	}
	public void createRoom(Map<String, Object> map) {
		chatDao.createRoom(map);
	}
	public void addUser(Map<String, Object> map) {
		chatDao.addUser(map);
	}
	public List<Map<String, Object>> roomMember(int roomNum){
		return chatDao.roomMember(roomNum);
	}

}