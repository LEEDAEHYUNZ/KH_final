package com.kh.dplate.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dplate.business.model.vo.Business;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.vo.Qna;
import com.kh.dplate.restaurant.model.vo.Restaurant;
import com.kh.dplate.review.model.vo.Review;

public interface AdminDao {

	List<Member> selectMemberList(PageInfo pi, int sort, String keyword);

	int selectMemberListCount(int sort, String keyword);
	
	int updateMember(Map<String, Integer> param);

	List<Member> selectMemberKeyword(String keyword);

	List<Restaurant> selectRestaurantList(PageInfo pi, int sort, String keyword);
	
	int deleteRestaurantStatus(int resNo);

	int updateRestaurantStatus(Map<String, Integer> param);

	List<Business> selectBusinessList(PageInfo pi, int sort, String keyword);

	List<Review> selectReviewList(PageInfo pi, String keyword);

	int deleteReview(int reviewNo);

	int updateReview(int reviewNo);

	List<Qna> selectqnaList(PageInfo pi, int sort, String keyword);

	int updateQnaAnswer(Map<String, Object> param);

	int selectQnaListCount(int sort, String keyword);

	int selectRestaurantListCount(int sort, String keyword);

	int selectReviewListCount(String keyword);

	int selectBusinessListCount(int sort, String keyword);

	int updateBusinessStatus(int memberNo, int changeStatus, int resNo);





}
