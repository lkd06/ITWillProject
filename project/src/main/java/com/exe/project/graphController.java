package com.exe.project;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exe.dao.MemberDAO;
import com.exe.dao.packageDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.PackageDTO;
import com.exe.dto.payDTO;
import com.exe.graph.Graph;

@Controller
public class graphController {
	
	@Autowired
	@Qualifier("graphDAO")
	Graph dao;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memDao;
	
	@Autowired
	@Qualifier("packDAO")
	packageDAO packDAO;
	
	@RequestMapping(value = "/graph_test.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String graph_test(HttpServletRequest request) {
		Calendar calen = new GregorianCalendar();
		String year = Integer.toString(calen.get(Calendar.YEAR));
		String month = Integer.toString(calen.get(Calendar.MONTH)+1);

		if(request.getParameter("year")!=null) {
			year = request.getParameter("year");
			month = request.getParameter("month");
		}
		
		String ym = year+month;
		
		HttpSession session = request.getSession();
		MemberDTO memdto = (MemberDTO)session.getAttribute("memDTO");
		
		String phone=memdto.getPhone();
		int usingData=0;

		if(request.getParameter("usingData")!=null) {
			usingData = Integer.parseInt(request.getParameter("usingData"));
		}
		Map<String, Object> map = null;
		try {
			//딴 package 테이블 이용
			map = dao.graphTest(phone, usingData,ym);
			String newVsReturningVisitorsDataPoints=(String)map.get("newVsReturningVisitorsDataPoints");
			int totalData=(Integer)map.get("totalData");
			usingData = (Integer)map.get("usingData");
			request.setAttribute("newVsReturningVisitorsDataPoints", newVsReturningVisitorsDataPoints);
			request.setAttribute("totalData", totalData);
			request.setAttribute("usingData", usingData);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		

		
		return "graph/graphtest";
	}
	
	@RequestMapping(value = "/graphview.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String view(HttpServletRequest request) {
		Calendar calen = new GregorianCalendar();
		String year = Integer.toString(calen.get(Calendar.YEAR));
		String month = Integer.toString(calen.get(Calendar.MONTH)+1);
		if(request.getParameter("year")!=null) {
			year = request.getParameter("year");
			month = request.getParameter("month");
		}
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		return "graph/graphView";
	}
	
	@RequestMapping(value = "/paygraph.action", method = RequestMethod.GET)
	public String payGraph(HttpServletRequest request) {
		Calendar calen = new GregorianCalendar();
		String year = Integer.toString(calen.get(Calendar.YEAR));
		if(request.getParameter("year")!=null) {
			year = request.getParameter("year");
		}
		request.setAttribute("year", year);
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		String phone= dto.getPhone();
		//월 구매량
		List<payDTO> lists = dao.pay(year, phone);
		int price[]=new int[13];
		
		for(int i=0;i<lists.size();i++) {
			payDTO pdto = lists.get(i);
			int month = Integer.parseInt(pdto.getPay_day());
			price[month] = pdto.getPrice();
		}
		
		
		//월정액량
		//package 테이블의 price 이용 예정
		
		int monthPay[]= new int[13];
		List<PackageDTO> plists = dao.monthPay(year, phone);
		for(int i=0;i<plists.size();i++) {
			PackageDTO pdto = plists.get(i);
			String ym = pdto.getYm();
			int month =Integer.parseInt(ym.substring(4));
			monthPay[month]=pdto.getPrice();
		}
		
		request.setAttribute("price", price);
		request.setAttribute("monthPay", monthPay);
		
		return "graph/paygraph";
	}
	
	@RequestMapping(value = "sendData", method = {RequestMethod.POST})
	@ResponseBody
	public List<String> sendDataView(HttpServletRequest request) {
		//상태확인 메세지
		List<String> message = new ArrayList<String>();
		
		String receivePhone = request.getParameter("receivePhone");
		int sendData = Integer.parseInt(request.getParameter("sendData"));
		
		//존재 여부 획인
		MemberDTO receiverDto=memDao.memInfo(receivePhone);
		if(receiverDto==null) {
			message.add("존재하지 않는 번호 입니다.");
			return message;
		}
		//가능한 데이터 량인지 확인
		
		HttpSession session = request.getSession();
		MemberDTO senderDTO = (MemberDTO)session.getAttribute("memDTO");
		
		Calendar calen = new GregorianCalendar();
		int year = calen.get(Calendar.YEAR);
		int month = calen.get(Calendar.MONTH)+1;
		String ym=Integer.toString(year)+Integer.toString(month);
		
		PackageDTO packDTO = packDAO.info(senderDTO.getPhone(), ym);
		if(packDTO.getTotalData()!=-1 && packDTO.getTotalData()-packDTO.getUsingData()<sendData) {
			message.add("데이터 사용량 초과입니다.");
			return message;
		}
		//
		packDAO.existCheck(receivePhone, ym, receiverDto.getPriceNum());
		
		//전송자 사용량 증가
		packDAO.senderData(senderDTO.getPhone(), sendData);
		
		//수신자 총 데이터량 증가
		packDAO.receiverData(receivePhone, sendData);
		
		message.add(receivePhone + "에게 선물완료하였습니다.");
		
		//senderDTO;
		return message;
	}
}
