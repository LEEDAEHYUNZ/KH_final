package com.kh.dplate.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dplate.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	// 로그인 진행 메소드 => SELECT
	@Override
	public Member login(Member member) {
		return sqlSession.selectOne("member.loginMember", member);
	}
	
	// 아이디 중복체크
	@Override
	public int idCheck(String memberId) {
		return sqlSession.selectOne("member.idCheck", memberId);
	}
	
	// 닉네임 중복체크
	@Override
	public int nickCheck(String memberNickname) {
		
		return sqlSession.selectOne("member.nickCheck", memberNickname);
	}

	// 회원가입 진행 => INSERT
	@Override
	public int signUp(Member m) {
		return sqlSession.insert("member.signUp", m);
	}
	
	// 아이디 찾기 => 이름 전화번호 비교
	public Member findId(Member m) {
		
		return sqlSession.selectOne("member.findId", m);
	}
	
	

	// 사업자 전환
	@Override
	public int memStatus(int resNo, int memberNo) {
		
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		param.put("resNo", resNo);
		param.put("memberNo", memberNo);
		
		
		
		return sqlSession.update("member.memStatus", param);
	}

	// 비번 찾기
	@Override
	public String getPw(Member member) {
		
		return sqlSession.selectOne("member.getPw", member);
	}

	
	// 아이디 찾기
	@Override
	public String getId(Member member) {
		
		return sqlSession.selectOne("member.findId", member);
	}
	
	@Override
	public int updateresno(Member m) {
		return sqlSession.update("member.updateresno", m);
	}
	
	// 개인정보 비밀번호 비교
	@Override
	public int passwordVertify(Member m) {
		return sqlSession.selectOne("member.passwordVertify", m);
	}
}
