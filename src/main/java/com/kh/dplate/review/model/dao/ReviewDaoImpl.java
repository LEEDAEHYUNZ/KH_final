package com.kh.dplate.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.review.model.vo.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;

	// 리뷰 목록
	@Override
	public List<Review> reviewList(PageInfo pi, int resNo, int sort) {
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String num = "";

		if (sort == 0) {
         num = "IN(1,2,3)";
      } else if (sort == 1) {
         num = "IN(1)";
      } else if (sort == 2) {
	     num = "IN(2)";
	  } else {
		 num = "IN(3)";
	  }

	      Map<String, Object> param = new HashMap<String, Object>();
	      param.put("num", num);
	      param.put("startRow", startRow);
	      param.put("endRow", endRow);
	      param.put("resNo", resNo);
		
		return sqlSession.selectList("review.reviewList", param);
	}
	
	// 리뷰 개수
	@Override
	public int reviewListCount(int resNo, int sort) {
		 String num = "";

      if (sort == 0) {
         num = "IN(1,2,3)";
      } else if (sort == 1) {
         num = "IN(1)";
      } else if (sort == 2) {
	     num = "IN(2)";
	  } else {
		 num = "IN(3)";
	  }

      Map<String, Object> param = new HashMap<String, Object>();
      param.put("num", num);
      param.put("resNo", resNo);

      return sqlSession.selectOne("review.reviewListCount", param);

	}

	// 리뷰 작성
	@Override
	public int writeReview(Review review) {
		return sqlSession.insert("review.writeReview", review);
	}

	// 리뷰 번호 조회
	@Override
	public int selectReviewNo(Review review) {
		return sqlSession.selectOne("review.selectReviewNo", review);
	}
	
	// 리뷰 수정
	@Override
	public int modifyReview(Review review) {
		return sqlSession.update("review.modifyReview", review);
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(Review review) {
		return sqlSession.delete("review.deleteReview", review);
	}
		
	// 리뷰 신고
	@Override
	public int warnReview(Review review) {
		return sqlSession.update("review.warnReview", review);
	}

	// 정렬 카운트
	@Override
	public int countRate0(int resNo) {
		return sqlSession.selectOne("review.countRate0", resNo);
	}
	
	@Override
	public int countRate1(int resNo) {
		return sqlSession.selectOne("review.countRate1", resNo);
	}

	@Override
	public int countRate2(int resNo) {
		return sqlSession.selectOne("review.countRate2", resNo);
	}

	@Override
	public int countRate3(int resNo) {
		return sqlSession.selectOne("review.countRate3", resNo);
	}

	@Override
	public List<Review> myReviewList(PageInfo pi, int memberNo) {
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	    int endRow = startRow + pi.getBoardLimit() - 1;
	    
	    Map<String, Integer> param = new HashMap<String, Integer>();
	    
	    param.put("startRow", startRow);
	    param.put("endRow", endRow);
	    param.put("memberNo", memberNo);
		
		return sqlSession.selectList("review.myReviewList", param);
	}
	
	@Override
	public int reviewCount(int memberNo) {
		
		return sqlSession.selectOne("bookmark.bookmarkCount", memberNo);
	}
	
	// 리뷰 삭제
	@Override
	public int myDelete(int reviewNo) {
		return sqlSession.delete("review.myDeleteReview", reviewNo);
	}

}
