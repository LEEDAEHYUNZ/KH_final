package com.kh.dplate.restaurant.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;

public interface RestaurantDao {

	Restaurant restaurantList(int resNo);

	List<Restaurant> mainList(Restaurant restaurant);

	List<Restaurant> selectMainKeyword(Map<String, Object> param);
	
	// 식당 등록
	int insertRestarunt(Restaurant restaurant);

	// attachment 연결하기위해~
	int selectRestaruntNo(Restaurant restaurant);

	// 식당 수정
	int updateRestarunt(Restaurant restaurant, List<Attachment> fileList);
	
	// 식당 삭제
	int deleteRestaurant(int resNo);

	// 수정, 삭제할때 값 받아오려고
	Restaurant select(int resNo);

	// 
	int business(Restaurant res);
	
	//
	List<Restaurant> resList();
	
}
