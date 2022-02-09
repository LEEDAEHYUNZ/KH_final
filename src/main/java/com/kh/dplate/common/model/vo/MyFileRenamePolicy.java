package com.kh.dplate.common.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyFileRenamePolicy {

	public String rename(String originName) {
		
		// 수정파일명 : 파일이 업로드 된 시간(년원일시분초) + 5자리 랜덤값(10000 ~ 99999)
		// => 최대한 이름이 겹치지 않게 하기 위해서
		// 완성된 파일명에 마지막으로 확장자명까지 붙여줘야함 (원본의 것 그대로)
		
		// 1. 파일이 업로드 된 시간 => SimpleDateFormat
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		return changeName;
	}
	
}
