package com.exe.dto;

public class MemberDTO {
	
	private String phone;
	private String pw;
	private String name;
	private String birth;
	private String salt;
	private String TmemberGrade;
	private String email;
	private int point;
	private String admin;
	
	private int priceNum;
	private String priceName;
	private String eventPoint;
	private String cardnum;
	
	
	
	
	public String getCardnum() {
		return cardnum;
	}
	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}
	public String getPriceName() {
		return priceName;
	}
	public void setPriceName(String priceName) {
		this.priceName = priceName;
	}
	public int getPriceNum() {
		return priceNum;
	}
	public void setPriceNum(int priceNum) {
		this.priceNum = priceNum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getTmemberGrade() {
		return TmemberGrade;
	}
	public void setTmemberGrade(String tmemberGrade) {
		TmemberGrade = tmemberGrade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getEventPoint() {
		return eventPoint;
	}
	public void setEventPoint(String eventPoint) {
		this.eventPoint = eventPoint;
	}
}
