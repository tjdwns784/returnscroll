package com.spring.returnscroll.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDao {
	
	@Autowired
	SqlSessionTemplate ss;

	public void increaseOrd(Map<String, Object> map) {
		ss.update("article.increaseOrd", map);
	}

	// int <= insert/update/delete
	// db변경하는 작업을 하면 결과값은 항상 정수
	public int insert(Map<String, Object> map) {
		return ss.insert("article.insert", map);
	}
	
	//댓글
	public int insertComment(Map<String, Object> map) {
		return ss.insert("article.insertComment", map);
	}

	public int update(int id) {
		return ss.update("article.update", id);
	}

	public List<Map<String, Object>> select() {
		return ss.selectList("article.select");
	}
	
	public List<Map<String, Object>> selectByComment(int no) {
		return ss.selectList("article.selectByComment",no);
	}

	public Map<String, Object> selectById(int no) {
		return ss.selectOne("article.selectById", no);
	}
}