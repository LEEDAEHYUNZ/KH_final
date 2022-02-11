package com.kh.dplate.member.model.service;

import com.kh.dplate.member.model.vo.Member;

public interface MemberService {

	// 로그인기능 메소드 틀
	Member login(Member member);
	
	// 아이디체크
	int idCheck(String memberId);
	
	// 닉네임체크
	int nickCheck(String memberNickname);
	
	// 회원가입
	int signUp(Member m);
	

	// 비번찾기
	public String getPw(Member member);


	// 사업자 전환
	int memStatus(int resNo, int memberNo);

	// 아이디찾기
	public String getId(Member member);
	
	//대현
	int updateresno(Member m);

	// 메뉴바 개인정보 패스워드 확인
	int  passwordVertify(Member m);
	
}
