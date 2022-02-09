package com.kh.dplate.attachment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;


@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	
	@Autowired
	private SqlSession sqlSession;

	
	
	@Override
	public List<Attachment> atList(Attachment attachment) {

		return sqlSession.selectList("atList");
	}
	// 리뷰 목록
	@Override
	public List<Attachment> attReview(Attachment attachment) {
		return sqlSession.selectList("attachment.attReview", attachment);
	}

	// 리뷰 작성
	@Override
	public int insertReview(Attachment attachment) {
		return sqlSession.insert("attachment.insertReview", attachment);
	}

	// 리뷰 수정
	@Override
	public int updateReview(List<Attachment> list) {
		int result = 0;
		
		for(Attachment attachment : list) {
			sqlSession.insert("attachment.updateReview", attachment);
			// System.out.println("포문 첨부파일" + attachment);
			result++;
		}
		
		System.out.println("dao result : " + result);
		
		return result;
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(int reviewNo) {
		return sqlSession.delete("attachment.deleteReview", reviewNo);
	}
	
	// 식당 추가
	@Override
	public int insertRestarunt(Attachment a) {
		return sqlSession.insert("attachment.insertRestaurant", a);
	}

	// 식당 수정
	@Override
	public int updateRestarunt(List<Attachment> list, Restaurant restaurant) {
		int result = 0; 
		int resNo = list.get(0).getResNo();
		
		sqlSession.update("restaurant.updateRestaurant", restaurant);
		sqlSession.delete("attachment.deletePicture", resNo);
		
		for(Attachment a : list) {
			sqlSession.insert("attachment.insertRestaurant", a);
		}
		
		return result;
	}
	
	
	// 식당 삭제
	@Override
	public int deleteRestarunt(List<Attachment> list, Restaurant restaurant) {
		int result = 0;
		int resNo = list.get(0).getResNo();
		
		for(Attachment a : list) {
			sqlSession.delete("attachment.deletePicture", resNo);
		}
		
		sqlSession.update("restaurant.deleteRestaurant", restaurant);
		
		return result;
	}
}
