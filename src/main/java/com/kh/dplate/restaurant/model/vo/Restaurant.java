package com.kh.dplate.restaurant.model.vo;



import lombok.Data;

@Data
public class Restaurant {

	private int resNo; // RES_NO NUMBER      PRIMARY KEY,
	private String category; // CATEGORY_NO   VARCHAR(2)   REFERENCES CATEGORY(CATEGORY),
	private String resName; // RES_NAME   VARCHAR2(50)      NOT NULL,
	private String resPhone; // RES_PHONE   VARCHAR2(15)      NOT NULL,
	private String resAddress; // RES_ADDRESS VARCHAR2(150) NOT NULL,
	private String resBest; // RES_BEST   VARCHAR2(50)      NOT NULL,
	private String resContent; // RES_CONTENT   VARCHAR2(500)      NOT NULL,
	private String resStatus; // RES_STATUS   VARCHAR2(1)      NOT NULL,
	private String imgName;
	private String categoryNo;
	private String categoryName;
	
}
