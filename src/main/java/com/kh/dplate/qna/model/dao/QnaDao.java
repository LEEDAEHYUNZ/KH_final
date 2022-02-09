package com.kh.dplate.qna.model.dao;

import java.util.List;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.qna.model.vo.Qna;

public interface QnaDao {

	List<Qna> qnaListView(PageInfo pi,int memberNo);
	
	Qna qnaAnswer(int qnaNo);
	
	int qnaWrite(Qna qna);
	
	int deleteQNA(int qnaNo);
	
	int updateQNA(Qna qna);

	int qnaCount(int memberNo);
}
