package com.kh.dplate.review.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int reviewNo; // REVIEW_NO NUMBER PRIMARY KEY,
	private int resNo; // RES_NO NUMBER REFERENCES RESTAURANT(RES_NO) NOT NULL,
	private int memberNo; // MEMBER_NO NUMBER REFERENCES MEMBER(MEMBER_NO) NOT NULL,
	private String reviewContent; // REVIEW_CONTENT VARCHAR2(500) NOT NULL,
	private Date uploadDate; // UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
	private int reviewRate; // REVIEW_RATE NUMBER NOT NULL,
	private String warnStatus; // WARN_STATUS VARCHAR2(1) NOT NULL,
	private String warnContent; // WARN_CONTENT VARCHAR2(150)
	
	private String memberNickname;
	private String imgName;
	private String resName;
	private String memberId; 
}
