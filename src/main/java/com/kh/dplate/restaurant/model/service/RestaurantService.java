package com.kh.dplate.restaurant.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;

public interface RestaurantService {


	List<Restaurant> mainList(Restaurant restaurant);

	Restaurant restaurantList(int resNo);

	List<Restaurant> selectMainKeyword(Map<String, Object> param);
	
	// 식당 등록
	int insertRestaurant(Restaurant restaurant);

	// attachment 연결하기위해~
	int selectRestaurantNo(Restaurant restaurant);
	
	// 식당 수정
	int updateRestaurant(Restaurant restaurant, List<Attachment> fileList);
	
	// 식당 삭제
	int deleteRestaurant(int resNo);
	
	// 식당 수정 리스트 뽑아오기
	Restaurant select(int resNo);

	// 사업자 등록
	int business(Restaurant res);
	// 사업자
	List<Restaurant> resList();
}
