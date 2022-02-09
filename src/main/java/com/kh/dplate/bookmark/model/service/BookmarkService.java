package com.kh.dplate.bookmark.model.service;



import java.util.List;

import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.PageInfo;

public interface BookmarkService {
	int saveheart(Bookmark to);

	int removeheart(Bookmark to);

	List<Bookmark> boselectList(Bookmark bookmark);
	
	// 전체 조회 기능 메소드
	List<Bookmark> bookmarkList(PageInfo pi, int memberNo);
	
	int myBookmarkDelete(int bookmarkNo);

	int bookmarkCount(int memberNo);
}
