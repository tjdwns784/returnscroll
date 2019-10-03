package com.spring.returnscroll.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.ArticleDao;

@Service
public class ArticleService {//qna게시판 

	@Autowired
	ArticleDao articleDao;
	
	//게시판 글쓰기
	public void insert(Map<String, Object> map) {
		int result = articleDao.insert(map);
	}
	
	//게시판 글 수정하기
	public void updateArticle(Map<String, Object> map) {
		articleDao.updateArticle(map);
	}
	
	//게시판 글 삭제하기
	public void deleteArticle(int no) {
			articleDao.deleteArticle(no);
	}
	
	//게시판 댓글달기
	public void insertComment(Map<String, Object> map) {
		articleDao.insertComment(map);
	}
	
	//게시판 댓글 삭제하기
	public void deleteComment(int cno) {
				articleDao.deleteComment(cno);
	}
	
	//게시판 목록 불러오기
	public List<Map<String, Object>> select(Map<String, Object> map) {
		return articleDao.select(map);
	}
	
	//게시판 댓글 불러오기
	public List<Map<String, Object>> selectByComment(Map<String, Object> map) {
		return articleDao.selectByComment(map);
	}
	
	//닉네임 불러오기
	public String selectByNick(String useid) {
		return articleDao.selectByNick(useid);
	}

	//게시판 읽어오기
	public Map<String, Object> selectById(int no){
		articleDao.update(no);//조회수 증가
		return articleDao.selectById(no);
	}
	
	//게시판 전체 개수 찾기
	public int selectTotalCount(Map<String, Object> map) {
		return articleDao.selectTotalCount(map);
	}
	
	//게시판 댓글 개수 찾기
		public int selectCommentCount(Map<String, Object> map) {
			return articleDao.selectCommentCount(map);
		}
	

}