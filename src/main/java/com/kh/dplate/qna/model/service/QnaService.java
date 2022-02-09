package com.kh.dplate.qna.model.service;

import java.util.List;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.vo.Qna;

public interface QnaService {

	
	Qna qnaAnswer(int qnaNo);
	
	int qnaWrite(Qna qna);
	
	int deleteQNA(int qnaNo);
	
	int updateQNA(Qna qna);

	int qnaCount(int memberNo);

	List<Qna> qnaListView(PageInfo pi, int memberNo);


	
}
