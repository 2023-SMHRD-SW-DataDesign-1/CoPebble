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
	private String FAMILY_KEY;
	private String ASSORT;
	private String WHO;
	@NonNull private String title;
	@NonNull private String start;
	@NonNull private String end;
	@NonNull private String color;
}