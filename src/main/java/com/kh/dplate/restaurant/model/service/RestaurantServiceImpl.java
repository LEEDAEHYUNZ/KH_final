package com.kh.dplate.restaurant.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.dao.RestaurantDao;
import com.kh.dplate.restaurant.model.vo.Restaurant;


@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	RestaurantDao restaurantDao;

	@Override
	public  Restaurant restaurantList(int resNo) {
		return restaurantDao.restaurantList(resNo);
	}
	
	@Override
	public List<Restaurant> mainList(Restaurant restaurant) {
		return restaurantDao.mainList(restaurant);
	}
	
	@Override
	public List<Restaurant> selectMainKeyword(Map<String, Object> param) {
		return restaurantDao.selectMainKeyword(param);
	}
	
	// 식당 추가
	@Override
	public int insertRestaurant(Restaurant restaurant) {
		return  restaurantDao.insertRestarunt(restaurant);
	}
	
	// attachment 연결하기위해~
	@Override
	public int selectRestaurantNo(Restaurant restaurant) {
		return restaurantDao.selectRestaruntNo(restaurant);
	}
	
	// 식당 수정
	@Override
	public int updateRestaurant(Restaurant restaurant, List<Attachment> fileList) {
		return restaurantDao.updateRestarunt(restaurant, fileList);
	}

	// 식당 삭제
	@Override
	public int deleteRestaurant(int resNo) {
		return restaurantDao.deleteRestaurant(resNo);
	}
	
	
	// 수정, 삭제할때 값 받아오려고
	@Override
	public Restaurant select(int resNo) {
		return restaurantDao.select(resNo);
	}
	// 
	@Override
	public int business(Restaurant res) {
		
		int result = restaurantDao.business(res);
		
		return result;
	}
	// 사업자 
	@Override
	public List<Restaurant> resList() {
		
		return restaurantDao.resList();
	}
}
