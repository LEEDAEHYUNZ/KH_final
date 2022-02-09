package com.kh.dplate.restaurant.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.restaurant.model.vo.Restaurant;


@Repository
public class RestaurantDaoImpl implements RestaurantDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public Restaurant restaurantList(int resNo) {

		return sqlSession.selectOne("restaurantList", resNo);
	}
	
	@Override
	public List<Restaurant> mainList(Restaurant restaurant) {

		return sqlSession.selectList("mainList");
	}
	
	@Override
	public List<Restaurant> selectMainKeyword(Map<String, Object> param){
		return sqlSession.selectList("selectMainKeyword",param);
	}
	
	// 식당 추가
	@Override
	public int insertRestarunt(Restaurant restaurant) {
		return sqlSession.insert("restaurant.insertRestaurant", restaurant);
	}

	// ResNo select
	@Override
	public int selectRestaruntNo(Restaurant restaurant) {
		return sqlSession.selectOne("restaurant.selectRestaurantNo", restaurant);
	}

	// 식당 수정
	@Override
	public int updateRestarunt(Restaurant restaurant , List<Attachment> fileList)  {
		int result = 0;
		
		sqlSession.update("restaurant.updateRestaurant",restaurant);
		sqlSession.delete("restaurant.deletePicture", restaurant);
		
		for(Attachment a : fileList) {
			result += sqlSession.insert("restaurant.insertRestaurant", restaurant);
		}
		
		return result;
	}
	

	// 식당 삭제
	@Override
	public int deleteRestaurant(int resNo) {
			   sqlSession.delete("attachment.deletePicture", resNo);
			   sqlSession.update("member.updateMemberResNo", resNo);
		return sqlSession.update("restaurant.deleteRestaurant", resNo);
	}
	

	@Override
	public Restaurant select(int resNo) {
		return sqlSession.selectOne("restaurant.select", resNo);
	}
	
	// 
	@Override
	public int business(Restaurant res) {
		return sqlSession.insert("restaurant.insertBusiness", res);
	}
	// 
	@Override
	public List<Restaurant> resList() {

		return sqlSession.selectList("restaurant.addressList");
	}
}
