package com.exe.graph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.PackageDTO;
import com.exe.dto.payDTO;
import com.google.gson.*;

public class Graph {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public Map<String, Object> graphTest(String phone,int usingData,String ym) {
		Gson gsonObj = new Gson();
		Map<String, Object> insert = new HashMap<String, Object>();
		insert.put("usingData", usingData);
		insert.put("phone",phone);
		insert.put("ym",ym);
		sessionTemplate.update("graphmapper.dataUsing", insert);
		//insert.remove("usingData");
		GraphDTO dto = sessionTemplate.selectOne("graphmapper.totalData",insert);
		
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		//여기서 총 데이터량 구해서 map와 리스트에 주고
		//int totalData
		map = new HashMap<Object, Object>();
		if(dto.getTotalData()==-1) {
			dto.setTotalData(9999999);
		}
		map.put("y", dto.getTotalData()-dto.getUsingData());
		map.put("name", "남은 데이터");
		map.put("color", "#E7823A");
		list.add(map);
		//usingData를 빼서(update) 구한 뒤에 
		//얘도 map와 list에 준다
		map = new HashMap<Object, Object>();
		map.put("y", dto.getUsingData());
		map.put("name", "데이터 사용량");
		map.put("color", "#546BC1"); 
		list.add(map);
		
		String newVsReturningVisitorsDataPoints = gsonObj.toJson(list);
		
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("totalData",dto.getTotalData());
		result.put("usingData",dto.getUsingData());
		result.put("newVsReturningVisitorsDataPoints",newVsReturningVisitorsDataPoints);
		
		return result;
	}
	
	public List<payDTO> pay(String year,String phone){
		List<payDTO> lists = new ArrayList<payDTO>();
		//년도로 검색해서 월별로 분류
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("phone",phone);
		map.put("year",  year.substring(2));
		//확인용
		System.out.println(year.substring(2));
		
		//resultType을 어떻게 받아야 할 지 고민
		lists = sessionTemplate.selectList("graphmapper.payment", map);
		
		return lists;
	}
	
	public List<PackageDTO> monthPay(String year,String phone){
		List<PackageDTO> lists = new ArrayList<PackageDTO>();
		//년도로 검색해서 월별로 분류
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("phone",phone);
		map.put("year",  year);
		
		
		//resultType을 어떻게 받아야 할 지 고민
		lists = sessionTemplate.selectList("graphmapper.monthpay", map);
		
		return lists;
	}
}
