package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;
import com.exe.dto.UserServiceDTO;
import com.exe.util.Cryto;

public class MemberDAO {
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public void insertData(MemberDTO dto) {
		String salt = Cryto.generateSalt();
		String pw = dto.getPw();
		
		dto.setSalt(salt);
		pw = Cryto.getEncrypt(pw, salt);
		dto.setPw(pw);
		
		StringBuffer buffer = new StringBuffer();
		
		for(int i=0;i<4;i++) {
			for(int j=0;j<2;j++) {  //4번 1자리수 4개씩 4번 	 
				buffer.append((int)(Math.random() * 90) + 10); //(0 ~ 89) + 10  
			}
			buffer.append("-");
		}	
		
		buffer.deleteCharAt(buffer.length()-1);
		
		String intval = buffer.toString();

		dto.setCardnum(intval);
		
		sessionTemplate.insert("membermapper.insertData", dto);
		sessionTemplate.insert("servicemapper.userServiceIN", dto.getPhone());
	}
	
	public String findSalt(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		String salt = sessionTemplate.selectOne("membermapper.findSalt",map);
		
		return salt;
	}
	
	public MemberDTO login(MemberDTO dto) {
		
		String salt = findSalt(dto.getPhone());
		
		if(salt==null || salt.equals("")) {
			return null;
		}
		
		String pw = dto.getPw();
		
		pw = Cryto.getEncrypt(pw, salt);
		dto.setPw(pw);
		
		MemberDTO result = sessionTemplate.selectOne("membermapper.getOneData", dto);
		
		return result;
	}
	
	public MemberDTO memInfo(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		MemberDTO result = sessionTemplate.selectOne("membermapper.findMemInfo", map);
		
		return result;
	}
	
	public void updatepriceinfo(int num,MemberDTO mem) {		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		//map.put("phone", dto.getPhone());
		map.put("mem", mem);
		
		sessionTemplate.update("membermapper.updatepriceinfo",map);			
	}
	
	public boolean pwCheck(MemberDTO dto) {
		
		String salt = findSalt(dto.getPhone());
		String inputpw = dto.getPw();
		
		inputpw = Cryto.getEncrypt(inputpw, salt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", dto.getPhone());
		MemberDTO result = sessionTemplate.selectOne("membermapper.findMemInfo", map);
	
		//비밀번호 일치할 때
		if(inputpw.equals(result.getPw())) {
			return true;
		}
		
		return false;
	}
	
	public void deleteUser(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		sessionTemplate.delete("membermapper.deleteMem", map);
	}
	
	public void update(MemberDTO dto) {
		
		String salt = Cryto.generateSalt();
		String pw = dto.getPw();
		
		dto.setSalt(salt);
		pw = Cryto.getEncrypt(pw, salt);
		dto.setPw(pw);
		
		sessionTemplate.update("membermapper.updateMem", dto);
	}
	
	public boolean phoneCh(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		int result = sessionTemplate.selectOne("membermapper.phoneCheck", map);
		
		if(result==1) {
			return false;
		}
		
		return true;
	}
	
	public void addPoint(MemberDTO dto) {
		sessionTemplate.update("addPoint", dto);
	}
	
	//전체데이터
	public List<MemberDTO> getList(){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		List<MemberDTO> lists = sessionTemplate.selectList("membermapper.getLists",params);
		
		return lists;
	}
	
	public MemberDTO getReadData(String phone) {
		
		MemberDTO dto = sessionTemplate.selectOne("membermapper.getReadData",phone);
		
		return dto;
	}
	
	public void updateGrade(MemberDTO dto) {
		sessionTemplate.update("updateGrade", dto);
	}
	
	public void updateAdmin(MemberDTO dto) {
		sessionTemplate.update("updateAdmin", dto);
	}
	
	public void updatePoint(MemberDTO dto) {
		sessionTemplate.update("updatePoint", dto);
	}
	
	public List<UserServiceDTO> serviceInfo(String phone) {
		List<UserServiceDTO> lists = sessionTemplate.selectList("membermapper.serviceInfo", phone);
		return lists;
	}
	
	public void deleteService(String str, String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("str", str);
		map.put("phone", phone);
		
		sessionTemplate.delete("membermapper.updateservice", map);
	}
	
	public MemberDTO findForPw(String phone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("phone",phone);
		MemberDTO dto = sessionTemplate.selectOne("membermapper.findForPw", map);
		return dto;
	}
}
