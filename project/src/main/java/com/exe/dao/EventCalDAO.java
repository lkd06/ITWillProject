package com.exe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.EventCalDTO;
import com.exe.dto.MemberDTO;

public class EventCalDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public List<String> getcheckedlist(String phone,String month){
		
		List<String> lists = new ArrayList<String>();
		
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("phone",phone);
		map.put("month",month);
	
		System.out.println(phone);
		System.out.println(month);
		
		lists = sessionTemplate.selectList("calendarmapper.logincheck",map);
		
		return lists;
	}
	
	public void insertEvent(MemberDTO mem,String date,String month) {
		//id, mm,dd �Է� 
		
		Map<String, Object> map = new HashMap<String, Object>();	
		
		String phone = mem.getPhone();
		System.out.println(phone+"!!!!!!!!!!!!!!!!!!!!!");
		map.put("phone",phone);
		map.put("month",month);
		map.put("date",date);
		System.out.println(map);
		// �� ���� �ش� ��¥�� �ش� phone(id)�� �����Ѵٸ� return false
		 sessionTemplate.insert("calendarmapper.insertData",map);
		
	}
	
	public int checkrecord(MemberDTO mem,String date,String month) {
		//�α����� id�� �̹� üũ�� ��¥���� Ȯ��
		
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("mem",mem);
		map.put("month",month);
		map.put("date",date);
		
		int result =sessionTemplate.selectOne("calendarmapper.checkrecord", map);
				
		return result;	
	}
	
	//���� ������ŭ ȸ���� ����Ʈ�߱�����
	public String addeventpoint(MemberDTO dto,String month) {

		String eventPoint="";							

		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("month",month);
		map.put("dto", dto);
		//�ش���� ���峯¥ �� ���ϱ�
		
		int result = sessionTemplate.selectOne("calendarmapper.countdate",map);
		
		//users ���̺��� eventpoint �÷� Ȯ���ϱ�
		String recordpoint = sessionTemplate.selectOne("calendarmapper.checkRecord",dto);
		
		System.out.println("recordpoint??" +recordpoint); //null???
	
		//10:100,20:300,30:1000 ** �� 1400����Ʈ
		
		if(result>=10 && recordpoint.equals("0")) {		//100����
			
			eventPoint = "100";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
		}else if(result>=20 && recordpoint.equals("0")) { // 10���� �� ����Ʈ �߱� �ȹ޾Ƽ� 100+300
			
			eventPoint = "400";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
		
		}else if(result>=20 && recordpoint.equals("100")) { //�� 400 ���� 
			
			eventPoint = "300";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
			
		}else if(result>=30 && (recordpoint.equals("0"))) { //����Ʈ �߱� ����� ������
			
			eventPoint = "1400";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
			
		}else if(result>=30 && recordpoint=="100") { 
			
			eventPoint = "1300";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
			
		}else if(result>=30 && recordpoint=="400") { 
			eventPoint = "1000";
			dto.setEventPoint(eventPoint);
			map.put("dto", dto);
			sessionTemplate.update("calendarmapper.updateRecord",map);
		}
		
		System.out.println("dao event ����Ʈ?" + eventPoint);
		return eventPoint;
	}
}
