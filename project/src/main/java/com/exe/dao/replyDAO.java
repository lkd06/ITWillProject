package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.replyDTO;


public class replyDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("replymapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(replyDTO dto1) {
		
		sessionTemplate.insert("replymapper.insertReply",dto1);
	}
	
	public List<replyDTO> getList(int start, int end, int num){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("num", num);
	
		
		List<replyDTO> list = sessionTemplate.selectList("replymapper.getReplyList",params);
		
	    return list;	
	
	}
	
    public int getDataCount() {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		

		int result = sessionTemplate.selectOne("replymapper.getDataCount",params);
		
		return result;
		
	}
	public replyDTO oneReply(int replyNum) {
		
		replyDTO dto1 = sessionTemplate.selectOne("replymapper.oneReply",replyNum);
		
		return dto1;
	}
	
	public void updateData(replyDTO dto1) {
		
		sessionTemplate.update("replymapper.updateReply",dto1);
	}
	
	public void deleteData(int replyNum) {
		
		sessionTemplate.delete("replymapper.deleteReply",replyNum);
		
	}
	

}
