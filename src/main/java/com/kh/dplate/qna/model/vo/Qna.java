package com.kh.dplate.qna.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {

	private int qnaNo;
	private int memberNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaType;
	private Date qnaDate;
	private String qnaAnswer;
	private String qnaStatus;
	private String memberId;
}