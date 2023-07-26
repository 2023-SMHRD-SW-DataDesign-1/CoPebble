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

public class MemoDTO {	
	private String num;
	@NonNull private String FAMILY_KEY;
	@NonNull private String WRITER;
	@NonNull private String B_CONTENT;
}
