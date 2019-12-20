package com.exe.dto;

public class EventPageDTO {
	
	private int num; //번호
	private String category; //카테고리
	private String subject; //제목
	private String content; //내용
	private String ipAddr; //ip
	private String startDay; //이벤트 시작날짜
	private String endDay; //이벤트 끝나는 날짜
	private String subjectImageName; //이미지이름
	private String contentImageName; //이미지이름
	private int hitCount; //조회수
	private String created; //날짜
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getSubjectImageName() {
		return subjectImageName;
	}
	public void setSubjectImageName(String subjectImageName) {
		this.subjectImageName = subjectImageName;
	}
	public String getContentImageName() {
		return contentImageName;
	}
	public void setContentImageName(String contentImageName) {
		this.contentImageName = contentImageName;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	

	
}
