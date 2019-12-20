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

import com.exe.dao.PriceDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.PriceDTO;
import com.exe.util.MyUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Controller
public class PriceController {
	
	@Autowired
	@Qualifier("priceDAO")
	PriceDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/price.action", method = RequestMethod.GET)
	public String price() throws Exception {
		return "product/price";
	}
	
	@RequestMapping(value = "/service.action", method = RequestMethod.GET)
	public String service() {
		return "product/service";
	}
	@RequestMapping(value = "/image.action", method = RequestMethod.GET)
	public String image() {
		return "product/image";
	}
	
	@RequestMapping(value = "/active.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String active(HttpServletRequest request, HttpServletResponse resqonse,String str,String order, String basic)  throws Exception  {
		
		str="desc";
		String str2="";
		
		order = request.getParameter("order");
		
		//list 정렬 
		if(order==null|| order.equals("")) {
			str2="기본";
			List<PriceDTO> lists =dao.getAsc();
			request.setAttribute("str2", str2);
			request.setAttribute("lists", lists);
		}else if(order=="low"|| order.equals("low")) {
			str2="낮은 가격순";
			List<PriceDTO> lists =dao.getAsc();
			request.setAttribute("str2", str2);
			request.setAttribute("lists", lists);
		}else if(order=="hi" || order.equals("hi")) {
			str2="높은 가격순";
			List<PriceDTO> lists =dao.getDesc();
			request.setAttribute("str2", str2);
			request.setAttribute("lists", lists);
		}
		
		//전체데이터갯수
		int dataCount = dao.getDataCount();
		
		//포워딩 될 페이지에 데이터를 넘긴다
		
		request.setAttribute("str", str);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("order", order);
	
		return "product/active";
	}
	
	@RequestMapping(value = "/list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(HttpServletRequest request, HttpServletResponse resqonse,String low, String hi,String str) throws Exception {
		
		String order = request.getParameter("order");
		
		request.setAttribute("order", order);
		
		return "product/list";
	}
	
	@RequestMapping(value = "/view.action", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(HttpServletRequest request) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		PriceDTO dto = dao.getReadData(num);
		
		HttpSession session = request.getSession(); 
		MemberDTO memdto = (MemberDTO)session.getAttribute("memDTO");
		
		String content2 = request.getParameter("content2");
		String subject = request.getParameter("subject");
		
		String xml=null;
		File file = null;
		
		if(content2.equals("5GX"))
			xml = "5gx.xml";
		else if(content2.equals("T플랜"))
			xml = "tplan.xml";
		else if(content2.equals("0플랜"))
			xml = "0plan.xml";
		else if(content2.equals("주말"))
			xml = "week.xml";
		else if(content2.equals("히어로"))
			xml = "hero.xml";
		else if(content2.equals("Tab"))
			xml = "tab.xml";
		
		file = new File(xml);
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();  
		Document document = documentBuilder.parse(file);
		document.getDocumentElement().normalize();
		Element element = document.getDocumentElement();
		
		NodeList nodeList = element.getElementsByTagName(subject);

		String xmlName[] = {"subject", "content1", "content2", "content3","info1","image","content4", "vip","free","flo","content5","image2"};
		
		Element ele = (Element)nodeList.item(0); 
 
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i<xmlName.length; i++) { 
			String[] str = xmlName[i].split("-");
			
			String result =ele.getElementsByTagName(xmlName[i]).item(0).getFirstChild().getNodeValue();
			
			map.put(xmlName[i], result);
			 
		}
		 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/product/view");
		mav.addObject("dto",dto);
		mav.addObject("hMap", map);
		mav.addObject("content2", content2);
		mav.addObject("subject",subject);
		mav.addObject("memDTO",memdto);
		return mav;
	}
	
	
	@RequestMapping(value = "/price_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String price_ok(HttpServletRequest request) throws Exception {
		
		String content2 = request.getParameter("content2");
		
		if(content2==null || content2.equals("")) {
			content2="";
		}
		
		List<PriceDTO> lists =dao.getContent2(content2);

		request.setAttribute("lists", lists);
		
		return "/product/result";	
	}
}