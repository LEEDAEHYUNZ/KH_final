package com.kh.dplate.bookmark.model.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.bookmark.model.dao.BookmarkDao;
import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.PageInfo;



@Service
public class BookmarkServiceImpl implements BookmarkService {
	
	@Autowired
	private BookmarkDao bookmarkDao;

	@Override
	public  int saveheart(Bookmark to) {
		return bookmarkDao.saveheart(to);
	}
	
	@Override
	public int removeheart(Bookmark to) {
		return bookmarkDao.removeheart(to);
	}

	@Override
	public List<Bookmark> boselectList(Bookmark bookmark) {
		return bookmarkDao.boselectList(bookmark);
	}
	
	// 4단계
	// 전체 조회 기능
	@Override
	public List<Bookmark> bookmarkList(PageInfo pi,int memberNo) {
		return bookmarkDao.bookmarkList(pi,memberNo);
	}
	
	@Override
	public int myBookmarkDelete(int bookmarkNo) {
		int result = bookmarkDao.myBookmarkDelete(bookmarkNo);
		return result;
	}

	@Override
	public int bookmarkCount(int memberNo) {
		return bookmarkDao.bookmarkCount(memberNo);
	}
}
