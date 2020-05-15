package com.exe.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.PackageDTO;

public class packageDAO {
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum() {
		return sessionTemplate.selectOne("packmapper.maxNum");
	}
	
	public void existCheck(String phone,String ym,int priceNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone",phone);
		map.put("ym",ym);
		int ch = sessionTemplate.selectOne("packmapper.findDataC",map);
		if(ch==0) {
			
			insertData(phone, ym,priceNum);
		}
	}
	
	public void insertData(String phone,String ym,int priceNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("ym", ym);
		map.put("priceNum", priceNum);
		//PK
		int num = getMaxNum()+1;
		map.put("num",num);
		
		//������ DATA�� (MB��������)
		String Data = sessionTemplate.selectOne("packmapper.totalData", priceNum);
		int price = sessionTemplate.selectOne("packmapper.monthPrice", priceNum);
		int totalData=1;
		
		if(Data.contains("GB")) {
			totalData*=1024;
		}
		if(Data.equals("������")) {
			//������ �϶� �ϴ� -1������ ��
			totalData=-1;
		}else {
			Data = Data.substring(0,Data.length()-2);
			totalData*=Double.parseDouble(Data);
		}
		map.put("totalData", totalData);
		
		//������
		Map<String,Integer> fSer = sessionTemplate.selectOne("packmapper.getProNum", map);
		//�ƿ� ������ ��ǰ�� ���� �� ������ 0���� �� ����
		//���߿� ȸ�� �����ϸ� �ڵ��� �����ϴ� �͵� ���� ��
		if(fSer==null) {
			fSer = new HashMap<String, Integer>();
			fSer.put("FLO", 0);
			fSer.put("WAVVE", 0);
			fSer.put("FIND", 0);
		}
		
		int p = sessionTemplate.selectOne("packmapper.getPrice",fSer);
		price +=p;
		map.put("price", price);
		
		sessionTemplate.insert("packmapper.insertData",map);
	}
	
	public PackageDTO info(String phone,String ym) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("ym", ym);
		PackageDTO dto=sessionTemplate.selectOne("packmapper.info",map);
		return dto;
	}
	
	public void senderData(String phone,int data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("data", data);
		
		sessionTemplate.update("packmapper.senderData", map);
	}
	
	public void receiverData(String phone,int data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("data", data);
		
		sessionTemplate.update("packmapper.receiverData", map);
	}
}