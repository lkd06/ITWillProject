package com.exe.dto;

public class DateDataDTO {
	
	String year = "";
	String month = "";
	String date = "";
	String value = "";
	//������ �߰��� �Ʒ�ó�� 
	//		1. ���� �߰�
	//		2. getter/setter �߰�
	//		3. ������ �߰�
	//				�Ͽ� ����ϸ� ���� ���ϰ� �����ϰ� �ڵ带 ���� �� �ִ�.
	String schedule = "";
	String schedule_detail = "";
	
	// �޷¸� ���� ���� ������
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
