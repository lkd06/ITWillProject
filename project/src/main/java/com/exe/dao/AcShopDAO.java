package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.AcShopDTO;

public class AcShopDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("acshopmapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(AcShopDTO dto){
		
		sessionTemplate.insert("acshopmapper.insertData",dto);
	}

	//전체데이터
	public List<AcShopDTO> getList(int start, int end){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		
		List<AcShopDTO> lists = sessionTemplate.selectList("acshopmapper.getLists",params);
		
		return lists;
	}
	
	//전체 데이터수 구하기
	public int getDataCount(){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		int result = sessionTemplate.selectOne("acshopmapper.getDataCount",params);
		
		return result;
	}
	
	//한명의 데이터 출력
	public AcShopDTO getReadData(int num){

		AcShopDTO dto = sessionTemplate.selectOne("acshopmapper.getReadData",num);
		
		return dto;
	}
	
	//삭제
	public void deleteData(int num){

		sessionTemplate.update("acshopmapper.deleteData",num);
	}
}
