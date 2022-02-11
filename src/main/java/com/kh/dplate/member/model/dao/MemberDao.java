package com.kh.dplate.member.model.dao;

import com.kh.dplate.member.model.vo.Member;

public interface MemberDao {

	// 로그인기능 메소드 틀
	Member login(Member member);
	
	// 아이디 중복 체크 메소드 틀
	int idCheck(String memberId);
	
	// 닉네임 중복체크
	int nickCheck(String memberNickname);
	
	// 회원가입 진행 메소드 틀
	int signUp(Member m);	

	// 비번
	public String getPw(Member member);

	// 사업자 전환
	int memStatus(int resNo, int memberNo);

	// 아이디 찾기
	public String getId(Member member);
	
	int updateresno(Member m);
	
	// 개인정보 수정 패스워드 확인
	int passwordVertify(Member m);
}
