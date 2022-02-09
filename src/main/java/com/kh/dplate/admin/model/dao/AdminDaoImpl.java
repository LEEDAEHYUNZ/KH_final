package com.kh.dplate.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.business.model.vo.Business;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.vo.Qna;
import com.kh.dplate.restaurant.model.vo.Restaurant;
import com.kh.dplate.review.model.vo.Review;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectMemberListCount(int sort, String keyword) {

		String num = "";

		if (sort == 1) {

			num = "IN(0,1,2,3)";

		} else if (sort == 2) {

			num = "IN(1,2,3)";

		} else {

			num = "IN(0)";
		}

		Map<String, String> param = new HashMap<String, String>();
		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectOne("member.aselectMemberListCount", param);

	}

	@Override
	public int selectQnaListCount(int sort, String keyword) {

		String num = "";

		if (sort == 1) {

			num = "IN('Y','N')";

		} else if (sort == 2) {

			num = "IN('Y')";

		} else {

			num = "IN('N')";
		}

		Map<String, String> param = new HashMap<String, String>();
		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectOne("qna.aselectQnaListCount", param);
	}

	@Override
	public int selectRestaurantListCount(int sort, String keyword) {

		String num = "";

		if (sort == 1) {

			num = "IN(0,1,2,3,4)";

		} else if (sort == 2) {

			num = "IN(1)";

		} else if (sort == 3) {

			num = "IN(2,3)";

		} else if (sort == 4) {

			num = "IN(4)";

		} else {

			num = "IN(0)";
		}

		Map<String, String> param = new HashMap<String, String>();
		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectOne("restaurant.aselectRestaurantListCount", param);
	}

	@Override
	public int selectBusinessListCount(int sort, String keyword) {

		String num = "";

		if (sort == 1) {

			num = "IN(2,3)";

		} else if (sort == 2) {

			num = "IN(2)";

		} else {

			num = "IN(3)";
		}

		Map<String, String> param = new HashMap<String, String>();

		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectOne("business.aselectBusinessListCount", param);
	}

	@Override
	public int selectReviewListCount(String keyword) {

		return sqlSession.selectOne("review.aselectReviewListCount", keyword);
	}

	@Override
	public List<Member> selectMemberList(PageInfo pi, int sort, String keyword) {

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		String num = "";

		if (sort == 1) {

			num = "IN(0,1,2,3)";

		} else if (sort == 2) {

			num = "IN(1,2,3)";

		} else {

			num = "IN(0)";

		}

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("keyword", keyword);
		return sqlSession.selectList("member.aselectMemberList", param);
	}

	@Override
	public List<Qna> selectqnaList(PageInfo pi, int sort, String keyword) {

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		String num = "";

		if (sort == 1) {

			num = "IN('Y','N')";

		} else if (sort == 2) {

			num = "IN('Y')";

		} else {

			num = "IN('N')";
		}

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectList("qna.aselectQnaList", param);
	}

	@Override
	public List<Business> selectBusinessList(PageInfo pi, int sort, String keyword) {

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		String num = "";

		if (sort == 1) {

			num = "IN(2,3)";

		} else if (sort == 2) {

			num = "IN(2)";

		} else {

			num = "IN(3)";
		}

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectList("business.aselectBusinessList", param);
	}

	@Override
	public List<Restaurant> selectRestaurantList(PageInfo pi, int sort, String keyword) {

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		String num = "";

		if (sort == 1) {

			num = "IN(0,1,2,3,4)";

		} else if (sort == 2) {

			num = "IN(1)";

		} else if (sort == 3) {

			num = "IN(2,3)";

		} else if (sort == 4) {

			num = "IN(4)";

		} else {

			num = "IN(0)";
		}

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("keyword", keyword);

		return sqlSession.selectList("restaurant.aselectRestaurantList", param);
	}

	@Override
	public List<Review> selectReviewList(PageInfo pi, String keyword) {

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("keyword", keyword);

		return sqlSession.selectList("review.aselectReviewList", param);
	}

	@Override
	public int updateMember(Map<String, Integer> param) {

		return sqlSession.update("member.aupdateMemberStatus", param);

	}

	@Override
	public List<Member> selectMemberKeyword(String keyword) {

		return sqlSession.selectList("member.aselectMemberKeyword", keyword);
	}

	@Override
	public int updateRestaurantStatus(Map<String, Integer> param) {

		return sqlSession.update("restaurant.aupdateRestaurantStatus", param);
	}

	@Override
	public int deleteRestaurantStatus(int resNo) {

		int result1 = sqlSession.delete("restaurant.adeleteRestaurantStatus1", resNo);

		int result3 = sqlSession.update("restaurant.adeleteRestaurantStatus3", resNo);

		int result2 = sqlSession.delete("restaurant.adeleteRestaurantStatus2", resNo);

		return result1;
	}

	@Override
	public int deleteReview(int reviewNo) {

		sqlSession.delete("attachment.deleteReview",reviewNo);
		return sqlSession.delete("review.adeleteReview", reviewNo);
	}

	@Override
	public int updateReview(int reviewNo) {

		return sqlSession.delete("review.aupdateReview", reviewNo);
	}

	@Override
	public int updateQnaAnswer(Map<String, Object> param) {

		return sqlSession.update("qna.aupdateQnaAnswer", param);
	}

	@Override
	   public int updateBusinessStatus(int memberNo, int changeStatus, int resNo) {
	      
	      Map<String, Integer> param = new HashMap<String, Integer>();
	      
	      param.put("memberNo", memberNo);
	      param.put("changeStatus", changeStatus);
	      param.put("resNo", resNo);
	      
	      if(changeStatus == 3) {
	         
	         int result = sqlSession.update("business.aupdateRestaurantStatus",param);
	      
	         return sqlSession.update("business.aupdateBusinessStatus",param);
	         
	      } else {
	         
	         return sqlSession.update("business.adeleteBusinessStatus",param);
	      
	      }
	   }

}
