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
	public String roomNumber(Map<String, Object> map ) {
		return chatDao.roomNumber(map);
	}
	public void addUser(Map<String, Object> map) {
		chatDao.addUser(map);
	}
	public List<Map<String, Object>> roomMember(int roomNum){
		return chatDao.roomMember(roomNum);
	}
	public List<Map<String, Object>> addFriend(String uid) {
		return chatDao.addFriend(uid);
	}
	// 친구 요청을 받아 들였을 때, 수신상태를 1로 만들어줌,
	public void accept(Map<String, String> map) {
		chatDao.accept(map);
	}

	public List<Map<String, Object>> friendListCheck(String sender) {
		return chatDao.friendListCheck(sender);
	}

	public void newFriendList(Map<String, String> map) {
		chatDao.newFriendList(map);
	}
	
	public List<Map<String, Object>> friendList(String uid){
		return chatDao.friendList(uid);
	}
	public int deleteFriend(Map<String, String> map) {
		return chatDao.deleteFriend(map);
	}
	public void roomInvite(Map<String, Object> map) {
		chatDao.roomInvite(map);
	}
	
	public List<Map<String, Object>> inviteList (String uid){
		return chatDao.inviteList(uid);
	}
	public void roomInviteCheck(Map<String, Object> map) {
		chatDao.roomInviteCheck(map);
	}
	public Map<String, Object> userInfo(String uids){
		return chatDao.userInfo(uids);
	}

}