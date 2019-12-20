package com.exe.dto;

public class DateDataDTO {
	
	String year = "";
	String month = "";
	String date = "";
	String value = "";
	//스케쥴 추가시 아래처럼 
	//		1. 변수 추가
	//		2. getter/setter 추가
	//		3. 생성자 추가
	//				하여 사용하면 보다 편리하고 깨끗하게 코드를 만들 수 있다.
	String schedule = "";
	String schedule_detail = "";
	
	// 달력만 사용시 사용될 생성자
	public DateDataDTO(String year, String month, String date, String value) {
		if ((month != null && month != "") && (date != null && date != "")) {
			this.year = year;
			this.month = month;
			this.date = date;
			this.value = value;
		}
	}

	public DateDataDTO() {	}

	@Override
	public String toString() {
		return "DateData [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value + "]";
	}


	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getSchedule_detail() {
		return schedule_detail;
	}

	public void setSchedule_detail(String schedule_detail) {
		this.schedule_detail = schedule_detail;
	}
}
