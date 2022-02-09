package com.kh.dplate.attachment.model.service;

import java.util.List;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;


public interface AttachmentService {

	List<Attachment> atList(Attachment attachment);

	// 리뷰 목록
	List<Attachment> attReview(Attachment attachment);
	
	// 리뷰 작성
	int insertReivew(Attachment attachment);
	
	// 리뷰 수정
	int updateReview(List<Attachment> list);
	
	// 리뷰 삭제
	int deleteReview(int reviewNo);
	
	// 식당 추가
	int insertRestaurant(Attachment a);

	// 식당 수정
	int updateRestaurant(List<Attachment> list, Restaurant restaurant);

	// 식당 삭제
	int deleteRestaurant(List<Attachment> list, Restaurant restaurant);

}
