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
	
	//게시판 글 수정하기
	public int updateArticle(Map<String, Object> map){
		return ss.update("article.updateArticle",map);
		
	}
	
	//게시판 글 삭제하기
	public int deleteArticle(int no){
		return ss.delete("article.deleteArticle", no);
			
	}
	
	//게시판 댓글달기
	public int insertComment(Map<String, Object> map) {
		return ss.insert("article.insertComment", map);
	}
	
	//게시판 댓글 삭제하기
	public int deleteComment(int cno){
			return ss.delete("article.deleteComment", cno);
				
	}
	
	//게시판 조회수 증가
	public int update(int id) {
		return ss.update("article.updateHit", id);
	}
	

	//게시판 목록 불러오기
	public List<Map<String, Object>> select(Map<String, Object> map) {
		return ss.selectList("article.select", map);
	}
	
	//닉네임 불러오기
	public String selectByNick(String useid) {
		return ss.selectOne("article.selectByNick", useid);
	}
	
	//게시판 댓글 달기
	public List<Map<String, Object>> selectByComment(Map<String, Object> map) {
		return ss.selectList("article.selectByComment",map);
	}


	//게시판 읽어오기
	public Map<String, Object> selectById(int no) {
		return ss.selectOne("article.selectById", no);
	}
	
	//게시판 갯수 찾기
	public int selectTotalCount(Map<String, Object> map) {
		return ss.selectOne("article.selectTotalCount", map);
	}
	
	//게시판 댓글수 찾기
	public int selectCommentCount(Map<String, Object> map) {
		return ss.selectOne("article.selectCommentCount", map);
	}
	
}