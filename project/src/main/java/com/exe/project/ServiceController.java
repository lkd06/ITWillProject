package com.exe.project;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.exe.dao.ServiceDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.ServiceDTO;
import com.exe.dto.UserServiceDTO;
import com.exe.util.MyUtil;

@Controller
public class ServiceController {
	
	@Autowired
	@Qualifier("serviceDAO")
	ServiceDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/slider.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String slider(HttpServletRequest request, HttpServletResponse resqonse)  throws Exception  {
		return "service/slider";
	}
	
	@RequestMapping(value = "/service_main.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String service_main(HttpServletRequest request, HttpServletResponse resqonse)  throws Exception  {
	
		List<ServiceDTO> lists = dao.getMain();
		
		request.setAttribute("lists", lists);
		
		return "service/service_main";
	}
	
	@RequestMapping(value = "/service_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String service_list(HttpServletRequest request, HttpServletResponse resqonse)  throws Exception  {
		return "service/service_list";
	}
	
	@RequestMapping(value = "/service_list_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String service_list_ok(HttpServletRequest request, HttpServletResponse resqonse)  throws Exception  {
		
		int dataCount = dao.getDataCount();
		System.out.println(dataCount);
		
		String order = request.getParameter("order");
		String str2 = "";
		
		if(order == null || order.equals("")) {
			str2 = "기본";
			List<ServiceDTO> lists = dao.getList();
			request.setAttribute("lists", lists);
		}else if(order =="low" || order.equals("low")) {
			str2 = "낮은 가격순";
			List<ServiceDTO> lists = dao.getAsc();
			request.setAttribute("lists", lists);
		}else if(order == "hi" || order.equals("hi")) {
			str2 = "높은 가격순";
			List<ServiceDTO> lists = dao.getDesc();
			request.setAttribute("lists", lists);
		}
		
		request.setAttribute("str2", str2);
		request.setAttribute("dataCount", dataCount);
		
		return "service/service_list_ok";
	}
	
	@RequestMapping(value = "/service_view.action", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView service_view(HttpServletRequest request, HttpServletResponse resqonse)  throws Exception  {
		
		int num = Integer.parseInt(request.getParameter("num"));
		ServiceDTO dto = dao.getReadData(num);
		
		String list = request.getParameter("list");
		System.out.println("list="+list);
		
		String xml="wavve.xml";
		File file = null;
		
		file = new File(xml);
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();  
		Document document = documentBuilder.parse(file);
		document.getDocumentElement().normalize();
		Element element = document.getDocumentElement();
		
		NodeList nodeList = element.getElementsByTagName(list);
		
		String xmlName[] = {"list", "content1", "content2", "content3","image0", "image1", "info1", "image2", "image3", "info2", "info3", "content4", "content5", "content6", "content7", "image4"};
		System.out.println(xmlName);
		Element ele = (Element)nodeList.item(0); 
		 
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i<xmlName.length; i++) { 
			String[] str = xmlName[i].split("-");
			
			String result =ele.getElementsByTagName(xmlName[i]).item(0).getFirstChild().getNodeValue();
			
			map.put(xmlName[i], result);
		}
		 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/service/service_view");
		mav.addObject("dto",dto);
		mav.addObject("hMap", map);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/serviceinsert.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String serviceinsert(HttpServletRequest request, HttpServletResponse resqonse, UserServiceDTO dto)  throws Exception  {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");		

		dto.setPhone(mem.getPhone());

		if(num==1 || num==2 || num==3) { 
			dto.setWavve(num);
			dao.updateData2(dto);
		}else if(num==4 || num==5) {
			dto.setFlo(num); 
			dao.updateData(dto);
		}else if(num==6) { 
			dto.setFind(num);
			dao.updateData3(dto);
		}
		
		return "redirect:/userinfo.action";
	}
}
