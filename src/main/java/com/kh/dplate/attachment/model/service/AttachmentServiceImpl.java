package com.kh.dplate.attachment.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.attachment.model.dao.AttachmentDao;
import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;


@Service
public class AttachmentServiceImpl implements AttachmentService {
	
	@Autowired
	private AttachmentDao attachmentDao;
	

	// 식당 추가
	@Override
	public int insertRestaurant(Attachment a) {
		return  attachmentDao.insertRestarunt(a);
	}

	// 식당 수정
	@Override
	public int updateRestaurant(List<Attachment> list, Restaurant restaurant) {
		return  attachmentDao.updateRestarunt(list, restaurant);
	}
	
	// 식당 삭제
	@Override
	public int deleteRestaurant(List<Attachment> list, Restaurant restaurant) {
		return attachmentDao.deleteRestarunt(list, restaurant);
	}
	
	@Override
	public List<Attachment> atList(Attachment attachment) {
		return attachmentDao.atList(attachment);
	}
	
	// 리뷰 목록
	@Override
	public List<Attachment> attReview(Attachment attachment) {
		return attachmentDao.attReview(attachment);
	}	

	// 리뷰 작성
	@Override
	public int insertReivew(Attachment attachment) {
		return attachmentDao.insertReview(attachment);
	}
	
	// 리뷰 수정
	@Override
	public int updateReview(List<Attachment> list) {
		return attachmentDao.updateReview(list);
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(int reviewNo) {
		return attachmentDao.deleteReview(reviewNo);
	}
}
