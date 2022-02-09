package com.kh.dplate.review.model.service;

import java.util.List;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.review.model.vo.Review;

public interface ReviewService {

	// 리뷰 목록
	List<Review> reviewList(PageInfo pi, int resNo, int sort);

	// 리뷰 개수
	int reviewListCount(int resNo, int sort);
	
	// 리뷰 작성 
	int writeReview(Review review);
	
	// 리뷰 번호 조회
	int selectReviewNo(Review review);	
	
	// 리뷰 수정
	int modifyReview(Review review);
	
	// 리뷰 삭제
	int deleteReview(Review review);
	
	// 리뷰 신고
	int warnReview(Review review);

	// 정렬 카운트
	int countRate0(int resNo);

	int countRate1(int resNo);

	int countRate2(int resNo);
	
	int countRate3(int resNo);

	List<Review> myReviewList(PageInfo pi, int memberNo);

	int reviewCount(int memberNo);
	
	// 마이 리뷰 삭제
	int myDelete(int reviewNo);
}
