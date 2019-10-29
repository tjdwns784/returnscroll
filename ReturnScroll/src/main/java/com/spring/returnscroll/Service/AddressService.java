package com.spring.returnscroll.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.AddressDao;

@Service
public class AddressService {//qna게시판 

	@Autowired
	AddressDao addressdao;
	
	//유저별 주소 넣기
	public void insert_Address(Map<String, Object> map) {
		addressdao.insert_Address(map);
	}
	
	//게시판 목록 불러오기
	public List<Map<String, Object>> users_Address(String unick) {
		 return addressdao.users_Address(unick);
	}
		
}