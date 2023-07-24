package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class MemberDTO {

	@NonNull private String ID;
	private String FAMILY_KEY;
	@NonNull private String PW;
	private String NAME;
	
	
}
