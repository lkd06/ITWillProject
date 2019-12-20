package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.exe.dto.RegionDTO;

@Component
public class RegionDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//전체데이터
	public List<RegionDTO> getList(String areano){	
	
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("areano", areano);
		List<RegionDTO> lists = sessionTemplate.selectList("regionmapper.readoplist",hm);
		
		/*
		  for(int i=0;i<lists.size();i++) { 
		  String a = lists.get(i).getRegion(); // 강남,
		  홍대 System.out.println(a); }
		 */
		
		return lists;
	}
	
	
	
}
