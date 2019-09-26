package com.spring.returnscroll.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.ArticleDao;

@Service
public class ArticleService {

	@Autowired
	ArticleDao articleDao;
	
	
	public void insert(Map<String, Object> map) {
		//articleDao.increaseOrd(map);
		int result = articleDao.insert(map);
	}
	
	public List<Map<String, Object>> select() {
		return articleDao.select();
	}
	public Map<String, Object> selectById(int no){
		articleDao.update(no);//조회수 증가
		return articleDao.selectById(no);
	}



}