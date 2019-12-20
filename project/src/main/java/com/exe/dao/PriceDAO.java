package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.PriceDTO;;

public class PriceDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getMaxNum() {
		
		int maxNum=0;
		
		maxNum = sessionTemplate.selectOne("pricemapper.getMaxNum");
		
		return maxNum;
		
	}
	
	public List<PriceDTO> getDesc(){

		List<PriceDTO> lists = sessionTemplate.selectList("pricemapper.getDesc");
		
		return lists;
	}
	
	public List<PriceDTO> getAsc(){

		List<PriceDTO> lists = sessionTemplate.selectList("pricemapper.getAsc");
		
		return lists;
	}
	
	public int getDataCount() {
		int result=sessionTemplate.selectOne("pricemapper.getDataCount");
		
		return result;
	}
	
	public PriceDTO getReadData(int num) {
		
		PriceDTO dto = sessionTemplate.selectOne("pricemapper.listOne", num);
		
		return dto;
	}
	
	public List<PriceDTO> getContent2(String content2){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		  
		params.put("content2", content2);
		
		List<PriceDTO> lists = sessionTemplate.selectList("pricemapper.content2", content2);
		
		return lists;
	}
	
}
