package com.kh.dplate.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.dao.QnaDao;
import com.kh.dplate.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public List<Qna> qnaListView(PageInfo pi,int memberNo) {
		
		return qnaDao.qnaListView(pi,memberNo);
	}
	
	@Override
	public int qnaCount(int memberNo) {
	
		return qnaDao.qnaCount(memberNo);
	}
	
	@Override
	public Qna qnaAnswer(int qnaNo) {
		
		return qnaDao.qnaAnswer(qnaNo);

	}
	
	@Override
	public int qnaWrite(Qna qna) {
		
		int result = qnaDao.qnaWrite(qna);
		
		return result;
		
	}
	
	@Override
	public int deleteQNA(int qnaNo) {
		
		int result = qnaDao.deleteQNA(qnaNo);
		
		return result;
	}
	
	@Override
	public int updateQNA(Qna qna) {
		
		int result = qnaDao.updateQNA(qna);
		
		return result;
	}
}
