package com.kh.dplate.attachment.model.vo;

import lombok.Data;

@Data
public class Attachment {
	
	private int fileNo;
	private int resNo;
	private int reviewNo;
	private String filepath;
	private String originName;
	private String changeName;
}
