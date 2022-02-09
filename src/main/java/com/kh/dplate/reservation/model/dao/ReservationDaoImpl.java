package com.kh.dplate.reservation.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.reservation.model.vo.Reservation;
import com.kh.dplate.reservationtime.model.vo.ReservationTime;
import com.kh.dplate.restaurant.model.vo.Restaurant;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 맛집 정보 받아오기
	@Override
	public Restaurant select(int resNo) {
	 
		return sqlSession.selectOne("restaurant.select", resNo);
	}

	
	// 맛집 예약 정보 받아오기
	@Override
	public List<ReservationTime> select2(int resNo) {
		
		return sqlSession.selectList("reservation.select2", resNo);
	}
	
	// 예약 등록
	@Override
	public int repeople(Reservation reservation) {
		
		return sqlSession.insert("reservation.repeople", reservation);
	}
	
	// 예약 정보 업데이트
	@Override
	public int updatep(ReservationTime reservationtime) {
		
		return sqlSession.update("reservation.updatep", reservationtime);
	}
	
	// 사업자 예약 리스트
	@Override
	public List<Reservation> reservationList(PageInfo pi) {
		
		 int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	     int endRow = startRow + pi.getBoardLimit() - 1;

	      Map<String, Integer> param = new HashMap<String, Integer>();

	      param.put("startRow", startRow);
	      param.put("endRow", endRow);
	      return sqlSession.selectList("reservation.reservationList", param);
	}
	
	// 예약 삭제 전 인원수 업데이트
	@Override
	public int updatepp(ReservationTime reservationtime) {
		
		return sqlSession.update("reservation.updatepp", reservationtime);
	}

	// 예약 삭제
	@Override
	public int delete(Reservation reservation) {
		
		return sqlSession.delete("reservation.delete", reservation);
	}
	
	// 페이징
	@Override
	public int selectReservationListCount() {
		
		return sqlSession.selectOne("reservation.selectReservationListCount");
	}
	
	// 사업자 예약 등록
	@Override
	public int insert(ReservationTime reservationtime) {
		
		return sqlSession.insert("reservation.insert", reservationtime);
	}

	// my예약 리스트
	@Override
	public List<Reservation> myReservationList(PageInfo pi,int memberNo) {
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	    int endRow = startRow + pi.getBoardLimit() - 1;
	    
	    Map<String, Integer> param = new HashMap<String, Integer>();
	    
	    param.put("startRow", startRow);
	    param.put("endRow", endRow);
	    param.put("memberNo", memberNo);
		
		return sqlSession.selectList("reservation.myReservationList", param);
	}
	
	@Override
	public int reservationCount(int memberNo) {
		
		return sqlSession.selectOne("reservation.reservationCount", memberNo);
	}
	
	// 예약 삭제 전 인원수 업데이트
	@Override
	public int myUpdate(ReservationTime reservationtime) {
		
		return sqlSession.update("reservation.myUpdate", reservationtime);
	}

	// 예약 삭제
	@Override
	public int myDelete(int reNo) {
		
		return sqlSession.delete("reservation.myDelete", reNo);
	}

	// 삭제할 예약 정보 받아오기
	@Override
	public List<ReservationTime> select3(int timeNo) {
		
		return sqlSession.selectList("reservation.select3", timeNo);
	}
	
	// 삭제할 예약 정보 받아오기
	@Override
	public List<Reservation> select4(int reNo) {
		
		return sqlSession.selectList("reservation.select4", reNo);
	}





}
