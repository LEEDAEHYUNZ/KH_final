package com.kh.dplate.attachment.model.dao;


import java.util.List;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;

public interface AttachmentDao {

	
	// 식당 추가
	int insertRestarunt(Attachment a);

	// 식당 수정
	int updateRestarunt(List<Attachment> list, Restaurant restaurant);

	// 식당 삭제
	int deleteRestarunt(List<Attachment> list, Restaurant restaurant);

	List<Attachment> atList(Attachment attachment);
	
	// 리뷰 목록
	List<Attachment> attReview(Attachment attachment);
		
	// 리뷰 작성
	int insertReview(Attachment attachment);
		
	// 리뷰 수정
	int updateReview(List<Attachment> list);
		
	// 리뷰 삭제
	int deleteReview(int reviewNo);
	
}
