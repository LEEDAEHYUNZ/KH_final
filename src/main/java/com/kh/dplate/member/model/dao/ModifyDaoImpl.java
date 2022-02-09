package com.kh.dplate.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.member.model.vo.Member;

@Repository
public class ModifyDaoImpl implements ModifyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Member memberModify(Member m) {
		return sqlSession.selectOne("member.memberModify", m);
	}
	
	@Override
	public int modifyWrite(Member m) {
		return sqlSession.update("member.modifyWrite", m);
	}
	
	// 닉네임 중복체크
	   @Override
	   public int nickCheck(String memberNickname) {
	      
	      return sqlSession.selectOne("member.nickCheck", memberNickname);
	   }
}
