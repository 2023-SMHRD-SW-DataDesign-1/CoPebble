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

public class calendarDTO {
	private int NUM;
	@NonNull private String FAMILY_KEY;
	private String ASSORT;
	private String WHO;
	@NonNull private String TITLE;
	@NonNull private String S_DATE;
	@NonNull private String E_DATE;
	@NonNull private String COLOR;
}
