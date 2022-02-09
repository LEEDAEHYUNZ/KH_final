package com.kh.dplate.member.model.dao;

import com.kh.dplate.member.model.vo.Member;

public interface ModifyDao {
	
	Member memberModify(Member m);
	
	int modifyWrite(Member m);
	
	// 닉네임체크
    int nickCheck(String memberNickname);
}
