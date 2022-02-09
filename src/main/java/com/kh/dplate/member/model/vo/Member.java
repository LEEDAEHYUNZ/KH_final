package com.kh.dplate.member.model.vo;

import java.util.Date;

public class Member {

	private	int memberNo; //	   MEMBER_NO NUMBER      PRIMARY KEY,
	private int resNo;	//	   RES_NO NUMBER REFERENCES RESTAURANT(RES_NO),
	private String memberId;	//	   MEMBER_ID   VARCHAR2(20)      NOT NULL,
	private String memberPwd;	//	   MEMBER_PWD   VARCHAR2(30)      NOT NULL,
	private String memberName;	//	   MEMBER_NAME VARCHAR2(15) NOT NULL,
	private String memberNickname;	//	   MEMBER_NICKNAME   VARCHAR2(50)      NOT NULL,
	private String memberPhone;	//	   MEMBER_PHONE   VARCHAR2(15)      NOT NULL,
	private String memberEmail;	//   MEMBER_EMAIL   VARCHAR2(30)      NOT NULL,
	private String gender;	//	   GENDER   VARCHAR2(1)      NOT NULL,
	private String birth;	//	   BIRTH   VARCHAR2(6)      NOT NULL,
	private Date enrollDate;	//		ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	private String memberStatus;	//	   MEMBER_STATUS   VARCHAR2(1)   DEFAULT 1 NOT NULL
	
	public Member() {
		super();
	}

	public Member(int memberNo, int resNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String memberPhone, String memberEmail, String gender, String birth, Date enrollDate, String memberStatus) {
		super();
		this.memberNo = memberNo;
		this.resNo = resNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.gender = gender;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.memberStatus = memberStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", resNo=" + resNo + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", memberName=" + memberName + ", memberNickname=" + memberNickname + ", memberPhone="
				+ memberPhone + ", memberEmail=" + memberEmail + ", gender=" + gender + ", birth=" + birth
				+ ", enrollDate=" + enrollDate + ", memberStatus=" + memberStatus + "]";
	}
	
	

}
