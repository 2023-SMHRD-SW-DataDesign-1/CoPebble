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
public class HouseholdDTO {

	private int NUM;
	@NonNull
	private String FAMILY_KEY;
	@NonNull
	private String WORK;
}