package com.kh.dplate.bookmark.model.dao;


import java.util.List;

import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.PageInfo;


public interface BookmarkDao {
	int saveheart(Bookmark to);

	int removeheart(Bookmark to);

	List<Bookmark> boselectList(Bookmark bookmark);
	
	// 전체조회기능
	List<Bookmark> bookmarkList(PageInfo pi, int memberNo);
	// 나의 즐찾 삭제
	int myBookmarkDelete(int bookmarkNo);
	
	int bookmarkCount(int memberNo);
}
