package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class DiaryDTO {
	
	private int NUM;
	private String FAMILY_KEY;
	private String TITLE;
	private String DIARY;
	private String FILENAME;
	@NonNull private String ALLDATE;
	
	public DiaryDTO (String TITLE, String DIARY, String FILENAME,int NUM) {
		this.NUM = NUM;
		this.TITLE = TITLE;
		this.DIARY = DIARY;
		this.FILENAME = FILENAME;
	}

	
}
