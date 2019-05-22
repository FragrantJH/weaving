package com.weaving.biz.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

public class CommonDateParser {

	static SimpleDateFormat htmlFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	static SimpleDateFormat javaFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/***
	 * 원하는 포맷으로 파싱한다
	 * @param date 날짜 문자
	 * @param fromFormat 원본 포맷
	 * @param toFormat 변경 포맷
	 * @return 변경된 포맷의 날자 문자열
	 */
	public static String parseFormat(String date, SimpleDateFormat fromFormat, SimpleDateFormat toFormat) {
		
		try {
			//SimpleDateFormat fromFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date originalDate = fromFormat.parse(date);
			
			//SimpleDateFormat toFormat = new SimpleDateFormat("dd/MM/yyyy");
			String changedDate = toFormat.format(originalDate);
			
			return changedDate;
			
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}
	
	/***
	 * datetime-local 형식의 date를 java의 형식으로 변환한다
	 * 
	 * @param date 'yyyy-MM-dd'T'HH:mm' 형식
	 * @return 'yyyy/MM/dd HH:mm' 형식
	 */
	public static String parseToJavaFormat(String date) {

		try {
			// original
			Date originalDate = htmlFormat.parse(date);
			// to
			String changedDate = javaFormat.format(originalDate);

			System.out.println("[parseToJavaFormat] " + date + " >> " + changedDate);

			return changedDate;
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}

	/***
	 * datetime-local 형식의 date를 java의 형식으로 변환한다
	 * 
	 * @param date 'yyyy-MM-dd HH:mm:ss' 형식
	 * @return 'yyyy-MM-dd'T'HH:mm' 형식
	 */
	public static String parseToHtmlFormat(String date) {

		try {
			// original
			Date originalDate = javaFormat.parse(date);
			// to
			String changedDate = htmlFormat.format(originalDate);

			System.out.println("[parseToHtmlFormat] " + date + " >> " + changedDate);

			return changedDate;
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}

}
