package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.NotiDTO;

public class NotiDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("notimapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(NotiDTO dto){
		
		sessionTemplate.insert("notimapper.insertData",dto);
	}
	
	//조회수증가
	public void updateHitCount(int num){

		sessionTemplate.update("notimapper.updateHitCount",num);
	}
	
	//전체데이터
	public List<NotiDTO> getList(String searchKey,String category,int start, int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("start", start);
		params.put("end", end);
		
		List<NotiDTO> lists = sessionTemplate.selectList("notimapper.getLists",params);
		
		return lists;
	}
	
	//전체 데이터수 구하기
	public int getDataCount(String searchKey,String category){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		
		int result = sessionTemplate.selectOne("notimapper.getDataCount",params);
		
		return result;
	}
	
	//한명의 데이터 출력
	public NotiDTO getReadData(String searchKey,String category,int num){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("num", num);
		
		NotiDTO dto = sessionTemplate.selectOne("notimapper.getReadData",params);
		
		return dto;
	}
	
	//삭제
	public void deleteData(int num){
		
		sessionTemplate.update("notimapper.deleteData",num);
	}
}
