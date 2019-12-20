package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.payDTO;

public class payDAO {
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int MaxNum() {
		int max=sessionTemplate.selectOne("paymapper.maxNum");
		return max+1;
	}
	
	//�������� �� ���̺� �߰�
	public void addProduct(payDTO dto) {
		int num = MaxNum();
		dto.setNum(num);
		
		//���� ������ ��ǰ�� �̹� �����Ѵٸ� ����update �� , ���ٸ� insert
		List<Integer>lists=sessionTemplate.selectList("paymapper.bagListcheck", dto);
		
		for(int i=0;i<lists.size();i++) {
			int idd = lists.get(i);
			//System.out.println(idd);
		}
		
		if(lists.contains(dto.getPro_num())) {
			sessionTemplate.update("paymapper.updateProduct", dto);			
		}else {
			sessionTemplate.insert("paymapper.buyProduct", dto);	
		}

	}
	
	//������ ��ǰ ��¿�
	//���� phone�� ��µǴ� ��
	//ac�� ���Ŵ� �Ǵµ� ����� �� ��
	/*
	 * public List<payDTO> buyList(String phone) { Map<String , String> hm = new
	 * HashMap<String, String>(); hm.put("phone", phone); List<payDTO> lists =
	 * sessionTemplate.selectList("paymapper.buyList", hm);
	 * 
	 * return lists; }
	 */
	
	public List<payDTO> buyList(String phone,int start,int end,String pro_type) {
		
		Map<String , Object> hm = new HashMap<String,  Object>();
		
		hm.put("phone", phone);
		hm.put("start", start);
		hm.put("end", end);
		hm.put("pro_type",pro_type);
		hm.put("paid", "paid");
		List<payDTO> lists = sessionTemplate.selectList("paymapper.buyListSel", hm);
		
		return lists;
	}
	
	
	
	public int updateList(payDTO pdto) {

		int result = sessionTemplate.update("paymapper.updateBagList",pdto);

		return result;
	}
	
	public int deleteList(payDTO pdto) {
		
		int result = sessionTemplate.delete("paymapper.deleteBagList",pdto);

		return result;
	}
	
	
	
	//��Ƶ� ��ǰ ��¿�
	public List<payDTO> bagList(String phone,int start,int end,String pro_type) {
		Map<String , Object> hm = new HashMap<String, Object>();
		hm.put("phone", phone);
		hm.put("start", start);
		hm.put("end", end);
		hm.put("pro_type",pro_type);
		hm.put("paid", "unpaid");
		List<payDTO> lists = sessionTemplate.selectList("paymapper.buyListSel", hm);
		
		return lists;
	}
	
	public int getDataCount(String phone,String paid,String pro_type) {
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("phone", phone);
		hm.put("paid", paid);
		hm.put("pro_type",pro_type);
		return sessionTemplate.selectOne("paymapper.getDataCount", hm);
	}
	
	//��ü������
	public List<payDTO> getList(){

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<payDTO> lists = sessionTemplate.selectList("paymapper.getLists",map);
		
		return lists;
	}
}
