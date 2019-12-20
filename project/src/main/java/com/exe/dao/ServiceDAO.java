package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;
import com.exe.dto.PriceDTO;
import com.exe.dto.ServiceDTO;
import com.exe.dto.UserServiceDTO;;

public class ServiceDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getMaxNum() {
		
		int maxNum=0;
		
		maxNum = sessionTemplate.selectOne("servicemapper.getMaxNum");
		
		return maxNum;
		
	}
	
	public List<ServiceDTO> getList(){

		List<ServiceDTO> lists = sessionTemplate.selectList("servicemapper.getList");
		
		return lists;
	}
	
	public List<ServiceDTO> getDesc(){

		List<ServiceDTO> lists = sessionTemplate.selectList("servicemapper.getDesc");
		
		return lists;
	}
	
	public List<ServiceDTO> getAsc(){

		List<ServiceDTO> lists = sessionTemplate.selectList("servicemapper.getAsc");
		
		return lists;
	}
	
	public List<ServiceDTO> getMain(){

		List<ServiceDTO> lists = sessionTemplate.selectList("servicemapper.getMain");
		
		return lists;
	}
	
	public int getDataCount() {
		int result=sessionTemplate.selectOne("servicemapper.getDataCount");
		
		return result;
	}
	
	public ServiceDTO getReadData(int num) {
		
		ServiceDTO dto = sessionTemplate.selectOne("servicemapper.listOne", num);
		
		return dto;
	}
	
	public void insertData(UserServiceDTO dto,MemberDTO mem) {
		sessionTemplate.insert("servicemapper.userServiceIN", dto);	
	}
	
	public void updateData(UserServiceDTO dto) {
		sessionTemplate.update("servicemapper.updateflo", dto);
	}
	
	public void updateData2(UserServiceDTO dto) {
		sessionTemplate.update("servicemapper.updatewavve", dto);
	}
	
	public void updateData3(UserServiceDTO dto) {
		sessionTemplate.update("servicemapper.updatefind", dto);
	}
}
