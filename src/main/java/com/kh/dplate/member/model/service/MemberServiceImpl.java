package com.kh.dplate.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dplate.member.model.dao.MemberDao;
import com.kh.dplate.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	// 로그인 처리 메소드
	@Override
	public Member login(Member member) {
		
		// 로그인
		Member loginUser = memberDao.login(member);
		
		return loginUser;
	}
	
	// 아이디 중복첵크
	@Override
	public int idCheck(String memberId) {

		// 결과값을 담을 변수 초기화
		int result = 0;
		
		// DAO 단을 호출해서 진행 => MemberDao 객체 필요
		// 일단 아이디 중복체크를 하고 => SELECT 문
		result = memberDao.idCheck(memberId);
		
		return result;
	}
	// 닉네임 중복체크
	@Override
	public int nickCheck(String memberNickname) {
		
		int result2 = 0;
		
		result2 = memberDao.nickCheck(memberNickname);
		
		return result2;
	}
	
	// 회원가입
	@Override
	public int signUp(Member m) {

		int result = memberDao.signUp(m);
		
		return result;
	}
	
	

	// 사업자 전환
	@Override
	public int memStatus(int resNo, int memberNo) {
		
		return memberDao.memStatus(resNo, memberNo);
	}

	
	// 비번
	@Override
	public String getPw(Member member) {
		// TODO Auto-generated method stub
		return memberDao.getPw(member);
	}
	
	// 아이디 찾기
	@Override
	public String getId(Member member) {
		
		return memberDao.getId(member);
	}


	
	@Override
	public int updateresno(Member m) {
		return memberDao.updateresno(m);
	}
	@Override
	public int passwordVertify(Member m) {
		
		int result = memberDao.passwordVertify(m);
		
		return result;
		
		
	}

}
