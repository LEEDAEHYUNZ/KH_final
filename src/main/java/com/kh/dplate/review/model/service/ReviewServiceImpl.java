package com.kh.dplate.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.review.model.dao.ReviewDao;
import com.kh.dplate.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;
	
	// 리뷰 목록
	@Override
	public List<Review> reviewList(PageInfo pi, int resNo, int sort) {
		return reviewDao.reviewList(pi, resNo, sort);
	}
	
	// 리뷰 개수
	@Override
	public int reviewListCount(int resNo, int sort) {
		return reviewDao.reviewListCount(resNo, sort);
	}
	
	// 리뷰 작성
	@Override
	public int writeReview(Review review) {
		return reviewDao.writeReview(review);
	}
	
	// 리뷰 번호 조회
	@Override
	public int selectReviewNo(Review review) {
		return reviewDao.selectReviewNo(review);
	}
	
	// 리뷰 수정
	@Override
	public int modifyReview(Review review) {
		return reviewDao.modifyReview(review);
	}
	
	// 리뷰 삭제
	@Override
	public int deleteReview(Review review) {
		return reviewDao.deleteReview(review);
	}
	
	// 리뷰 신고
	@Override
	public int warnReview(Review review) {
		return reviewDao.warnReview(review);
	}

	// 정렬 카운트
	@Override
	public int countRate0(int resNo) {
		return reviewDao.countRate0(resNo);
	}
	
	@Override
	public int countRate1(int resNo) {
		return reviewDao.countRate1(resNo);
	}

	@Override
	public int countRate2(int resNo) {
		return reviewDao.countRate2(resNo);
	}

	@Override
	public int countRate3(int resNo) {
		return reviewDao.countRate3(resNo);
	}
	@Override
	public List<Review> myReviewList(PageInfo pi,int memberNo) {
		
		return reviewDao.myReviewList(pi,memberNo);
	}
	
	@Override
	public int reviewCount(int memberNo) {
	
		return reviewDao.reviewCount(memberNo);
	}
	
	// 마이 리뷰 삭제
	@Override
	public int myDelete(int reviewNo) {
		return reviewDao.myDelete(reviewNo);
	}

	

}
