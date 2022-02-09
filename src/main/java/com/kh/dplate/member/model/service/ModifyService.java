package com.kh.dplate.member.model.service;

import com.kh.dplate.member.model.vo.Member;

public interface ModifyService {
	
	// 로그인 멤버 조회
	Member memberModify(Member m);
	
	// 본인정보 수정
	int modifyWrite(Member m);
	
	// 닉네임체크
	int nickCheck(String memberNickname);
}
