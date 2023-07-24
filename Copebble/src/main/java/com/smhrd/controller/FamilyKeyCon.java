package com.smhrd.controller;

import java.util.Random;

public class FamilyKeyCon {
	    private static final String ALLOWED_CHARS = "abcdefghijklmnopqrstuvwxyz0123456789";
	    private static final int RANDOM_STRING_LENGTH = 10; // 생성할 랜덤 문자열의 길이

	    public static String generateRandomString() {
	        Random random = new Random();
	        StringBuilder sb = new StringBuilder(RANDOM_STRING_LENGTH);

	        for (int i = 0; i < RANDOM_STRING_LENGTH; i++) {
	            int randomIndex = random.nextInt(ALLOWED_CHARS.length());
	            char randomChar = ALLOWED_CHARS.charAt(randomIndex);
	            sb.append(randomChar);
	        }

	        return sb.toString();
	    }
	}
	
	
	
	
	

