package com.kh.dplate.business.model.vo;

public class Business {

	private int resNo; // RES_NO NUMBER PRIMARY KEY,
	private String categoryName; // CATEGORY_NO VARCHAR(2) REFERENCES CATEGORY(CATEGORY),
	private String resName; // RES_NAME VARCHAR2(50) NOT NULL,
	private String resPhone; // RES_PHONE VARCHAR2(15) NOT NULL,
	private String status; // STATUS VARCHAR2(1) DEFAULT 'N' NOT NULL,
	private int memberNo; // MEMBER_NO NUMBER PRIMARY KEY,
	private String memberId; // MEMBER_ID VARCHAR2(20) NOT NULL,
	private String memberStatus; // MEMBER_STATUS VARCHAR2(1) DEFAULT 1 NOT NULL
	private String resAddress;

	public Business() {
		super();
	}



	public Business(int resNo, String categoryName, String resName, String resPhone, String status, int memberNo,
			String memberId, String memberStatus, String resAddress) {
		super();
		this.resNo = resNo;
		this.categoryName = categoryName;
		this.resName = resName;
		this.resPhone = resPhone;
		this.status = status;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberStatus = memberStatus;
		this.resAddress = resAddress;
	}



	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getCategoryNo() {
		return categoryName;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryName = categoryNo;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getResAddress() {
		return resAddress;
	}



	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}



	@Override
	public String toString() {
		return "Business [resNo=" + resNo + ", categoryNo=" + categoryName + ", resName=" + resName + ", resPhone="
				+ resPhone + ", status=" + status + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", memberStatus=" + memberStatus + "]";
	}

}
