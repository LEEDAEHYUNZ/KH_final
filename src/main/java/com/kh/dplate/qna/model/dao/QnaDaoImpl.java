package com.kh.dplate.qna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.qna.model.vo.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Qna> qnaListView(PageInfo pi,int memberNo) {
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	    int endRow = startRow + pi.getBoardLimit() - 1;
	    
	    Map<String, Integer> param = new HashMap<String, Integer>();
	    
	    param.put("startRow", startRow);
	    param.put("endRow", endRow);
	    param.put("memberNo", memberNo);
		
		return sqlSession.selectList("qna.qnaViewList", param);
	}
	
	@Override
	public Qna qnaAnswer(int qnaNo) {
		return sqlSession.selectOne("qna.qnaAnswer", qnaNo);
	}
	
	@Override
	public int qnaWrite(Qna qna) {
		return sqlSession.insert("qna.qnaWrite", qna);
	}
	
	@Override
	public int deleteQNA(int qnaNo) {
		return sqlSession.delete("qna.deleteQNA", qnaNo);
	}
	
	@Override
	public int updateQNA(Qna qna) {
		return sqlSession.update("qna.updateQNA", qna);
	}
	@Override
	public int qnaCount(int memberNo) {
		
		return sqlSession.selectOne("qna.qnaCount", memberNo);
	}
}

