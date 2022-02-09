package com.kh.dplate.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.member.model.dao.ModifyDao;
import com.kh.dplate.member.model.vo.Member;

@Service
public class ModifyServiceImpl implements ModifyService {

	@Autowired
	private ModifyDao modifyDao;
	
	// 본인 조회
	@Override
	public Member memberModify(Member m) {
		
		Member member = modifyDao.memberModify(m);
		return member;
	}
	
	// 개인정보 수정
	@Override
	public int modifyWrite(Member m) {
		
		int result = modifyDao.modifyWrite(m);
		
		return result;
	}
	
	// 닉네임 중복체크
	   @Override
	   public int nickCheck(String memberNickname) {
	      
	      int result2 = 0;
	      
	      result2 = modifyDao.nickCheck(memberNickname);
	      
	      return result2;
	   }
}
