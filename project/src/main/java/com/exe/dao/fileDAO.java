package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.fileDTO;


public class fileDAO {
	
    private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("filemapper.maxNum");
		
		return maxNum;
		
	}
	
	public void insertData(fileDTO dto) {
		
		sessionTemplate.insert("filemapper.insertData",dto);
		
	}
	
	public List<fileDTO> getList(int start, int end, int num, String saveFileName){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("num", num);
		params.put("saveFileName", saveFileName);
		
		
		List<fileDTO> list = sessionTemplate.selectList("filemapper.listData",params);
		
		return list;
		
	}
	
	 public int DataCount() {
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			int result = sessionTemplate.selectOne("filemapper.DataCount",params);
			
			return result;
			
		}
	 
	 
	 public fileDTO readData(int num) {
			
			fileDTO dto2 = sessionTemplate.selectOne("filemapper.readData",num);
			
			return dto2;
		}
	 
		
	public void deleteData(int num) {
			
			sessionTemplate.delete("filemapper.deleteData",num);
			
		}
	
	
}
