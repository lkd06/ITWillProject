package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.boardListDTO;

public class boardListDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("boardlistmapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(boardListDTO dto) {
		
		sessionTemplate.insert("boardlistmapper.insertData",dto);
	}
	
	public List<boardListDTO> getLists(int start, int end, String searchKey, String searchValue){

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end",end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
	
		List<boardListDTO> lists = sessionTemplate.selectList("boardlistmapper.getLists", params);
		return lists;
		
		
	}
	
	public int getDataCount(String searchKey,String searchValue) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey",searchKey);
		params.put("searchValue",searchValue);
		
		int result = sessionTemplate.selectOne("boardlistmapper.getDataCount",params);
		
		return result;
		
	}
	
	public void updateHitCount(int num){
		
		sessionTemplate.update("boardlistmapper.updateHitCount",num);
	}
	
	public boardListDTO getReadData(int num) {
		
		boardListDTO dto = sessionTemplate.selectOne("boardlistmapper.getReadData",num);
		
		return dto;
	}
	
	public void updateData(boardListDTO dto) {
		
		sessionTemplate.update("boardlistmapper.updateData",dto);
		
	}
	
	public void deleteData(int num) {
		
		sessionTemplate.update("boardlistmapper.deleteData",num);
		
		
	}




}
