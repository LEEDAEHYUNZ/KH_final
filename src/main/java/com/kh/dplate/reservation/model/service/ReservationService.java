package com.kh.dplate.reservation.model.service;

import java.util.List;

import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.reservation.model.vo.Reservation;
import com.kh.dplate.reservationtime.model.vo.ReservationTime;
import com.kh.dplate.restaurant.model.vo.Restaurant;

public interface ReservationService {

	// 맛집  정보 받아오기
	Restaurant select(int resNo);

	// 맛집 예약 정보 받아오기
	List<ReservationTime> select2(int resNo);
	
	// 예약 등록
	int repeople(Reservation reservation);

	// 예약 정보 업데이트
	int updatep(ReservationTime reservationtime);
		
	// 사업자 예약 리스트
	List<Reservation> reservationList(PageInfo pi);
	
	// 예약 삭제 전 인원수 업데이트
	int updatepp(ReservationTime reservationtime);
	
	// 예약 삭제
	int delete(Reservation reservation);
	
	// 페이징
	int selectReservationListCount();
	
	// 사업자 예약 등록
	int insert(ReservationTime reservationtime);

	
	// 전체 조회
	List<Reservation> myReservationList(PageInfo pi,int memberNo);

	// 예약 삭제 전 인원수 업데이트
	int myUpdate(ReservationTime reservationtime);
	
	// 예약 삭제
	int myDelete(int reNo);

	//
	int reservationCount(int memberNo);

	// 해당 삭제할 예약정보 받아오기
	List<ReservationTime> select3(int timeNo);
	
	// 해당 삭제할 예약정보 받아오기
	List<Reservation> select4(int reNo);
	

	











}
