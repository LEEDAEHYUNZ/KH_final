package com.kh.dplate.bookmark.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.PageInfo;



@Repository
public class BookmarkDaoImpl implements BookmarkDao{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public int saveheart(Bookmark to) {

		return sqlSession.insert("bookmark.saveheart", to);
		
	}


	@Override
	public int removeheart(Bookmark to) {
		return sqlSession.delete("bookmark.removeheart", to);
	}


	@Override
	public List<Bookmark> boselectList(Bookmark bookmark) {
		return sqlSession.selectList("bookmark.boselectList");
	}
	
	// 전체 조회기능
	@Override
	public List<Bookmark> bookmarkList(PageInfo pi,int memberNo) {
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	    int endRow = startRow + pi.getBoardLimit() - 1;
	    
	    Map<String, Integer> param = new HashMap<String, Integer>();
	    
	    param.put("startRow", startRow);
	    param.put("endRow", endRow);
	    param.put("memberNo", memberNo);
	    
		return sqlSession.selectList("bookmark.bookmarkList", param);
	}
	
	@Override
	public int myBookmarkDelete(int bookmarkNo) {
		return sqlSession.delete("bookmark.myBookmarkDelete", bookmarkNo);
	}

	@Override
	public int bookmarkCount(int memberNo) {
		
		return sqlSession.selectOne("bookmark.bookmarkCount", memberNo);
	}
}
