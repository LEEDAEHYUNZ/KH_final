package com.kh.dplate.reservation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.reservation.model.dao.ReservationDao;
import com.kh.dplate.reservation.model.vo.Reservation;
import com.kh.dplate.reservationtime.model.dao.ReservationTimeDao;
import com.kh.dplate.reservationtime.model.vo.ReservationTime;
import com.kh.dplate.restaurant.model.vo.Restaurant;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	// 맛집 정보 받아오기
	@Override
	 public Restaurant select(int resNo) {
	 
		return reservationDao.select(resNo);
	   }
	
	// 맛집 예약 정보 받아오기
	@Override
	public List<ReservationTime> select2(int resNo) {
		
		return reservationDao.select2(resNo);
	}
	
	// 예약 등록
	@Override
	public int repeople(Reservation reservation) {
		
		int result = reservationDao.repeople(reservation);
		
		return result;
	}
	
	// 예약 정보 업데이트
	@Override
	public int updatep(ReservationTime reservationtime) {
		
		int result = reservationDao.updatep(reservationtime);
		
		return result;
	}
	
	// 사업자 예약 리스트
	@Override
	public List<Reservation> reservationList(PageInfo pi) {
		
		return reservationDao.reservationList(pi);
	}
	
	// 예약 삭제 전 인원수 업데이트
	@Override
	public int updatepp(ReservationTime reservationtime) {
		
		return reservationDao.updatepp(reservationtime);
	}
	
	// 예약 삭제
	@Override
	public int delete(Reservation reservation) {
		
		return reservationDao.delete(reservation);
	}
	
	// 페이징 
	@Override
	public int selectReservationListCount() {
		
		return reservationDao.selectReservationListCount();
	}
	
	// 사업자 예약 등록
	@Override
	public int insert(ReservationTime reservationtime) {
		
		return reservationDao.insert(reservationtime);
	}


	@Override
	public List<Reservation> myReservationList(PageInfo pi,int memberNo) {
		
		return reservationDao.myReservationList(pi,memberNo);
	}
	
	@Override
	public int reservationCount(int memberNo) {
	
		return reservationDao.reservationCount(memberNo);
	}
	
	// 마이 예약 삭제 전 인원수 업데이트
	@Override
	public int myUpdate(ReservationTime reservationtime) {
		
		return reservationDao.myUpdate(reservationtime);
	}
	
	// 마이 예약 삭제
	@Override
	public int myDelete(int reNo) {
		
		return reservationDao.myDelete(reNo);
	}

	// 삭제할 예약정보 받아오기
	@Override
	public List<ReservationTime> select3(int timeNo) {
		
		return reservationDao.select3(timeNo);
	}
	
	// 삭제할 예약정보 받아오기
	@Override
	public List<Reservation> select4(int reNo) {
		
		return reservationDao.select4(reNo);
	}











}
