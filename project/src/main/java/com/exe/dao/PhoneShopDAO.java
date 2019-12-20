package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.PhoneShopDTO;

public class PhoneShopDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("phoneshopmapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(PhoneShopDTO dto){
		
		sessionTemplate.insert("phoneshopmapper.insertData",dto);
	}

	//전체데이터
	public List<PhoneShopDTO> getList(int start, int end){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		
		List<PhoneShopDTO> lists = sessionTemplate.selectList("phoneshopmapper.getLists",params);
		
		return lists;
	}
	
	//전체 데이터수 구하기
	public int getDataCount(){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		int result = sessionTemplate.selectOne("phoneshopmapper.getDataCount",params);
		
		return result;
	}
	
	//한명의 데이터 출력
	public PhoneShopDTO getReadData(int num){

		PhoneShopDTO dto = sessionTemplate.selectOne("phoneshopmapper.getReadData",num);
		
		return dto;
	}
	
	//삭제
	public void deleteData(int num){

		sessionTemplate.update("phoneshopmapper.deleteData",num);
	}
}
