package com.kh.dplate.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.admin.model.dao.AdminDao;
import com.kh.dplate.business.model.vo.Business;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.vo.Qna;
import com.kh.dplate.restaurant.model.vo.Restaurant;
import com.kh.dplate.review.model.vo.Review;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public int selectMemberListCount(int sort, String keyword) {
		return adminDao.selectMemberListCount(sort, keyword);
	}
	
	@Override
	public List<Member> selectMemberList(PageInfo pi,int sort, String keyword) {
		return adminDao.selectMemberList(pi, sort, keyword);
	}

	@Override
	public int memberUpdate(Map<String, Integer> param) {
		return adminDao.updateMember(param);
	}

	@Override
	public List<Member> selectMemberKeyword(String keyword) {
		return adminDao.selectMemberKeyword(keyword);
	}

	@Override
	public List<Restaurant> selectRestaurantList(PageInfo pi,int sort, String keyword) {
		return adminDao.selectRestaurantList(pi, sort, keyword);
	}

	@Override
	public int deleteRestaurantStatus(int resNo) {
		return adminDao.deleteRestaurantStatus(resNo);
	}
	
	@Override
	public int updateRestaurantStatus(Map<String, Integer> param) {
		return adminDao.updateRestaurantStatus(param);
	}

	@Override
	public List<Business> selectBusinessList(PageInfo pi, int sort, String keyword) {
		return adminDao.selectBusinessList(pi,sort,keyword);
	}

	@Override
	public List<Review> selectReviewList(PageInfo pi,String keyword) {
		return adminDao.selectReviewList(pi,keyword);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return adminDao.deleteReview(reviewNo);
	}

	@Override
	public int updateReview(int reviewNo) {
		return adminDao.updateReview(reviewNo);
	}

	@Override
	public List<Qna> selectQnaList(PageInfo pi, int sort, String keyword) {
		return adminDao.selectqnaList(pi,sort,keyword);
	}

	@Override
	public int updateQnaAnswer(Map<String, Object> param) {
		return adminDao.updateQnaAnswer(param);
	}

	@Override
	public int selectQnaListCount(int sort, String keyword) {
		return adminDao.selectQnaListCount(sort,keyword);
	}

	@Override
	public int selectRestaurantListCount(int sort, String keyword) {
		return adminDao.selectRestaurantListCount(sort,keyword);
	}

	@Override
	public int selectReviewListCount(String keyword) {
		return adminDao.selectReviewListCount(keyword);
	}

	@Override
	public int selectBusinessListCount(int sort, String keyword) {
		return adminDao.selectBusinessListCount(sort, keyword);
	}

	@Override
	public int updateBusinessStatus(int memberNo, int changeStatus,int resNo) {
		return adminDao.updateBusinessStatus(memberNo,changeStatus, resNo);
	}





	

	


}
