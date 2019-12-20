package com.exe.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.EventPageDTO;


public class EventPageDAO {
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("eventpagemapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(EventPageDTO dto){
		
		sessionTemplate.insert("eventpagemapper.insertData",dto);
	}
	
	//조회수증가
	public void updateHitCount(int num){

		sessionTemplate.update("eventpagemapper.hitCount",num);
	}
	
	//전체데이터
	public List<EventPageDTO> getList(String searchKey,String category,int start, int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("start", start);
		params.put("end", end);
		
		List<EventPageDTO> lists = sessionTemplate.selectList("eventpagemapper.getLists",params);
		
		return lists;
	}
	
	//전체 데이터수 구하기
	public int getDataCount(String searchKey,String category){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		
		
		int result = sessionTemplate.selectOne("eventpagemapper.getDataCount",params);
		
		return result;
	}
	
	//한명의 데이터 출력
	public EventPageDTO getReadData(String searchKey,String category,int num){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("num", num);
		
		EventPageDTO dto = sessionTemplate.selectOne("eventpagemapper.getReadData", params);
		
		return dto;
	}
	
	public EventPageDTO getpreReadData(String searchKey,String category,int num){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("num", num);
		
		EventPageDTO dto = sessionTemplate.selectOne("eventpagemapper.preReadData", params);
		
		return dto;
	}

	public EventPageDTO getnextReadData(String searchKey,String category,int num){
	
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("num", num);
		
		EventPageDTO dto = sessionTemplate.selectOne("eventpagemapper.nextReadData", params);
		
		return dto;
}
	
	//삭제
	public void deleteData(int num){
		
		sessionTemplate.update("eventpagemapper.deleteData",num);
	}
	


}
