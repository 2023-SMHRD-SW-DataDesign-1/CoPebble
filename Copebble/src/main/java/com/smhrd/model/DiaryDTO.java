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
	@NonNull private String FAMILY_KEY;
	@NonNull private String TITLE;
	private String DIARY;
	private String FILENAME;
	@NonNull private String ALLDATE;

}
