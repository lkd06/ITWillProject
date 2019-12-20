package com.exe.project;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.DateDataDAO;
import com.exe.dao.EventCalDAO;
import com.exe.dao.MemberDAO;
import com.exe.dto.DateDataDTO;
import com.exe.dto.EventCalDTO;
import com.exe.dto.MemberDTO;

@Controller
public class CalendarController {

	@Autowired
	@Qualifier("DateDataDAO")
	DateDataDAO caldao;

	@Autowired
	@Qualifier("eventcaldao")
	EventCalDAO eventcaldao;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memdao;

	@RequestMapping(value = "/calendar.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String calendar(Model model, HttpServletRequest request, DateDataDTO dateData) {
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");
		Calendar cal = Calendar.getInstance();
		DateDataDTO calendarData;
		
		// �˻� ��¥
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateDataDTO(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}
		
		// �˻� ��¥ end
		Map<String, Integer> today_info = caldao.today_info(dateData);
		List<DateDataDTO> dateList = new ArrayList<DateDataDTO>();
		
		// �������� �޷� ������ ����Ʈ�� ������ ���� ����
		// �ϴ� ���� �ε������� �ƹ��͵� ���� ������ ����
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateDataDTO(null, null, null, null);
			dateList.add(calendarData);
		}

		// ��¥ ����
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateDataDTO(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
			} else {
				calendarData = new DateDataDTO(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
			}
			
			dateList.add(calendarData);
		}

		// �޷� ��� �� �����ͷ� ����
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateDataDTO(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		

		//�⼮üũ ��ƼĿ ���̱� 			
		String phone=mem.getPhone();
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		
		if(request.getParameter("month")!=null) {
			int m = Integer.parseInt(request.getParameter("month"))+1;
			month = Integer.toString(m);
		}
		
		List<String> lists = eventcaldao.getcheckedlist(phone, month);// checked
		// data����..cal.jsp �� �Ѹ���..
		//System.out.println("list ������1!!"+lists.size());
		Map<String, Integer> calMap = new HashMap<String, Integer>();
		
		for(int i=0;i<lists.size();i++) {
			calMap.put(lists.get(i), 1);
		}		
		//if(lists.size()==0) lists.add("100");
		  model.addAttribute("checkedlist",lists);
		  model.addAttribute("map",calMap);
		 
		 /* for(int i=0;i<lists.size();i++) { String date = lists.get(i);
		  System.out.println(date); }
		 */

		// �迭�� ����
		model.addAttribute("dateList", dateList); // ��¥ ������ �迭
		model.addAttribute("today_info", today_info);

		return "login/calendar";
	}

	@RequestMapping(value ="/checkevent.action", method={ RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String checkdate(HttpServletRequest request, DateDataDTO dateData) {
		// session �� �ִ� phone(id)�� ���� �⼮�� ��¥ Ȯ��

		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO) session.getAttribute("memDTO");
		Calendar cal = Calendar.getInstance();
						
		//ModelAndView mav =new ModelAndView();
		
		String date = String.valueOf(cal.get(Calendar.DATE));
		String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		
		int result=eventcaldao.checkrecord(mem, date, month);
			
		String msg="";
		
		Map<String, Object> map = new HashMap<String, Object>();
	
		
		if(result==0) {
			eventcaldao.insertEvent(mem, date, month);
			msg=".";
		//	mav.addObject("msg","ok");
			//model.addAttribute("msg","ok");
			//map.put(msg, "�⼮ �Ϸ�Ǿ����ϴ�.");
		}
	//	else if(result!=0) {
			//msg="�̹� �⼮�� ��¥�Դϴ�.";
			//model.addAttribute("msg","nok");
	//	mav.addObject("msg","nok");
			//map.put(msg,"�̹� �⼮�� ��¥�Դϴ�.");
		//	mav.setViewName("redirect:/");
	//	}
		
	//  mav.setViewName("redirect:/");
		//model.addAttribute("map",map);
		//request.setAttribute("map", map);

		return msg;
	}
	@RequestMapping(value = "/addeventpoint.action",produces = "application/text; charset=utf8",
			method={ RequestMethod.GET, RequestMethod.POST })	
	public @ResponseBody String addeventpoint(HttpServletRequest request, DateDataDTO dateData) {

		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("memDTO");
	
		String phone= dto.getPhone();
		Calendar cal = Calendar.getInstance();	
		String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		
		
		String eventpoint = eventcaldao.addeventpoint(dto, month); // 100~1400���� ����Ʈ
		System.out.println("eventpoint??????"+ eventpoint);
		
 		if(eventpoint.equals("")) {
 			eventpoint="�̹� �����Ǿ����ϴ�.";
 		}else {
 			int event = Integer.parseInt(eventpoint); 
	 		 
	 		eventpoint=eventpoint+"����Ʈ�� �����Ǿ����ϴ�.";
			
			//dto.setPhone(phone);
			dto.setPoint(event); 
			memdao.addPoint(dto);
 		}
		 
 		return eventpoint;
	}
}