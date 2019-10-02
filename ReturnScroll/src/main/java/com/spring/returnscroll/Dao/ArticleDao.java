package com.spring.returnscroll.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDao {//qna게시판 
	
	@Autowired
	SqlSessionTemplate ss;

	// int <= insert/update/delete
	// db변경하는 작업을 하면 결과값은 항상 정수
	//게시판 글쓰기
	public int insert(Map<String, Object> map) {
		return ss.insert("article.insert", map);
	}
	
	//게시판 댓글달기
	public int insertComment(Map<String, Object> map) {
		return ss.insert("article.insertComment", map);
	}
	
	//게시판 조회수 증가
	public int update(int id) {
		return ss.update("article.update", id);
	}

	//게시판 목록 불러오기
	public List<Map<String, Object>> select() {
		return ss.selectList("article.select");
	}
	
	//게시판 댓글 달기
	public List<Map<String, Object>> selectByComment(int no) {
		return ss.selectList("article.selectByComment",no);
	}

	//게시판 읽어오기
	public Map<String, Object> selectById(int no) {
		return ss.selectOne("article.selectById", no);
	}
}