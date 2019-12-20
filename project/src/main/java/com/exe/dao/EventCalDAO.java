package com.exe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.EventCalDTO;
import com.exe.dto.MemberDTO;

public class EventCalDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public List<String> getcheckedlist(String phone,String month){
		
		List<String> lists = new ArrayList<String>();
		
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("phone",phone);
		map.put("month",month);
	
		System.out.println(phone);
		System.out.println(month);
		
		lists = sessionTemplate.selectList("calendarmapper.logincheck",map);
		
		return lists;
	}
	
	public void insertEvent(MemberDTO mem,String date,String month) {
		//id, mm,dd 입력 
		
		Map<String, Object> map = new HashMap<String, Object>();	
		
		String phone = mem.getPhone();
		System.out.println(phone+"!!!!!!!!!!!!!!!!!!!!!");
		map.put("phone",phone);
		map.put("month",month);
		map.put("date",date);
		System.out.println(map);
		// 로 만약 해당 날짜에 해당 phone(id)가 존재한다면 return false
		 sessionTemplate.insert("calendarmapper.insertData",map);
		
	}
	
	public int checkrecord(MemberDTO mem,String date,String month) {
		//로그인한 id에 이미 체크한 날짜인지 확인
		
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("mem",mem);
		map.put("month",month);
		map.put("date",date);
		
		int result =sessionTemplate.selectOne("calendarmapper.checkrecord", map);
				
		return result;	
	}
	
	//도장 갯수만큼 회원에 포인트발급해줌
	public String addeventpoint(MemberDTO dto,String month) {

		String eventPoint="";							

		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("month",month);
		map.put("dto", dto);
		//해당월에 도장날짜 수 구하기
		
		int result = sessionTemplate.selectOne("calendarmapper.countdate",map);
		
		//users 테이블에서 eventpoint 컬럼 확인하기
		String recordpoint = sessionTemplate.selectOne("calendarmapper.checkRecord",dto);
		
		System.out.println("recordpoint??" +recordpoint); //null???
	
		//10:100,20:300,30:1000 ** 총 1400포인트
		
		if(result>=10 && recordpoint.equals("0")) {		//100누적
			
			eventPoint = "100";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
		}else if(result>=20 && recordpoint.equals("0")) { // 10개일 때 포인트 발급 안받아서 100+300
			
			eventPoint = "400";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
		
		}else if(result>=20 && recordpoint.equals("100")) { //총 400 누적 
			
			eventPoint = "300";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
			
		}else if(result>=30 && (recordpoint.equals("0"))) { //포인트 발급 기록이 없으면
			
			eventPoint = "1400";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
			
		}else if(result>=30 && recordpoint=="100") { 
			
			eventPoint = "1300";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
			
		}else if(result>=30 && recordpoint=="400") { 
			eventPoint = "1000";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
		}
		
		System.out.println("dao event 포인트?" + eventPoint);
		return eventPoint;
	}
}
