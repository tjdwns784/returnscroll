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
	public  List<Map<String, Object>> selectAllList() {
		return ss.selectList("chat.selectAllRoom");
	}
	
	public  Map<String, Object> roomIn(int roomNum) {
		return ss.selectOne("chat.roomIn", roomNum);
	}

	public void createRoom(Map<String, Object> map) {
		ss.insert("chat.createRoom",map);
	}
	public String roomNumber(Map<String, Object> map ) {
		return ss.selectOne("chat.roomNumber",map);
	}
	public void addUser(Map<String, Object> map) {
		ss.insert("chat.addUser",map);
	}
	public List<Map<String, Object>> roomMember(int roomNum){
		return ss.selectList("chat.roomMember",roomNum);
	}
	public String userNick(Map<String, Object> map) {
		return ss.selectOne("chat.userNick",map);
	}
	public List<Map<String, Object>> addFriend(String uid) {
		return ss.selectList("chat.addFriend", uid);
	}
	public void accept(Map<String, String> map) {
		ss.update("chat.accept", map);
	}

	// user의 친구리스트를 불러옴
	public List<Map<String, Object>> friendListCheck(String sender) {
		return ss.selectList("chat.friendListCheck", sender);
	}

	public void newFriendList(Map<String, String> map) {
		ss.insert("chat.newFriendList", map);
	}
	public List<Map<String, Object>> friendList(String uid){
		return ss.selectList("chat.friendList",uid);
	}
 
	public int deleteFriend(Map<String, String> map) {
		return ss.delete("chat.deleteFriend",map);
	}
	
	public void roomInvite(Map<String, Object> map) {
		ss.insert("chat.roomInvite",map);
	}
	
	public List<Map<String, Object>> inviteList (String uid){
		return ss.selectList("chat.inviteList",uid);
	}
	
	public void roomInviteCheck(Map<String, Object> map) {
		ss.update("chat.roomInviteCheck",map);
	}
	public Map<String, Object> userInfo(String uids){
		return ss.selectOne("chat.userInfo",uids);
	}
	public Map<String, String> getRoomInfo(String roomId) {
		return ss.selectOne("chat.getRoomInfo",roomId);
	}
}