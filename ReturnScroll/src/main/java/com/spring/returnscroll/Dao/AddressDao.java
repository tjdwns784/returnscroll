package com.spring.returnscroll.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDao {//qna게시판 
	
	@Autowired
	SqlSessionTemplate ss;

	//유저별 주소 쓰기
	public int insert_Address(Map<String, Object> map) {
		return ss.insert("address.insert_Address", map);
	}
	
	//유저별 주소 목록 불러오기
	public List<Map<String, Object>> users_Address(String unick) {
		return ss.selectList("address.users_Address", unick);
	}
	
	
}