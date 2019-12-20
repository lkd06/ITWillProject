package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.QnaDTO;

public class QnaDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("qnamapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(QnaDTO dto){
		
		sessionTemplate.insert("qnamapper.insertData",dto);
	}
	
	//조회수증가
	public void updateHitCount(int num){

		sessionTemplate.update("qnamapper.updateHitCount",num);
	}
	
	//전체데이터
	public List<QnaDTO> getList(String searchKey,String category,int start, int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("start", start);
		params.put("end", end);
		
		List<QnaDTO> lists = sessionTemplate.selectList("qnamapper.getLists",params);
		
		return lists;
	}
	
	//전체 데이터수 구하기
	public int getDataCount(String searchKey,String category){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		
		int result = sessionTemplate.selectOne("qnamapper.getDataCount",params);
		
		return result;
	}
	
	//한명의 데이터 출력
	public QnaDTO getReadData(String searchKey,String category,int num){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("num", num);
		
		QnaDTO dto = sessionTemplate.selectOne("qnamapper.getReadData",params);
		
		return dto;
	}
	
	//수정
	public void updateData(QnaDTO dto) {
		
		sessionTemplate.update("qnamapper.orderNoUpdate",dto);
	}
	
	//삭제
	public void deleteData(int num){
		
		sessionTemplate.update("qnamapper.deleteData",num);
	}
}
