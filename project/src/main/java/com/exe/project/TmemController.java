package com.exe.project;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
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

import com.exe.dao.RegionDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.RegionDTO;

@Controller
public class TmemController {

	@Autowired
	@Qualifier("RegionDAO")
	RegionDAO region;
	
	@RequestMapping(value="tmem.action",method= {RequestMethod.GET})
	public String Tmem() {
		return "tmem/tmem";
	}
	
	@RequestMapping(value="tjoin.action",method= {RequestMethod.GET})
	public String Tjoin() {
		return "tmem/tjoin";
	}
	
	@RequestMapping(value="appcard",method= {RequestMethod.GET})
	public String appcard(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");
		
		request.setAttribute("mdto", mem);
		return "tmem/appcard";
	}
	
	@RequestMapping(value="cardissue.action")
	public String cardissue(HttpServletRequest request, HttpServletResponse response) {
		//memberdto, phone,name,cardlevel,cardnum 정보 제공 
	
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");

		request.setAttribute("mdto", mem);
		return "tmem/cardissue";
	}
	
	@RequestMapping(value="kmap.action")
	public String kmap(HttpServletRequest request, HttpServletResponse response) {
		return "tmem/kmap";
	}
	@RequestMapping(value="lomap.action")
	public String lomap(HttpServletRequest request, HttpServletResponse response) {
		return "tmem/lomap";
	}
	
	
	@RequestMapping(value="kmaptest.action")
	public String kmaptest(HttpServletRequest request, HttpServletResponse response) {
		return "tmem/kmaptest";
	}
	
	@RequestMapping(value="tevent.action")
	public ModelAndView tevent(HttpServletRequest request, HttpServletResponse response) {
		
		String eventName= request.getParameter("eventName");
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventName",eventName);
		mav.setViewName("tmem/tevent");

		return mav;
	}
	

	@RequestMapping(value="tpack.action",method={RequestMethod.POST,RequestMethod.GET})
	public String tpack(String eventName,HttpServletRequest request, HttpServletResponse response) {
		
		//eventName =jeju 가지고 와서 jeju.jsp 가져가서 뿌림 
		
		String url=null;
		
		if(eventName.equals("jeju")) url="tmem/tjeju";
		else if(eventName.equals("thappy")) url="tmem/happypass";
		else if(eventName.equals("jcard")) url="tmem/jcard";
		else if(eventName.equals("tableevent")) url="tmem/tableevent";
		return url;		
	}

	@RequestMapping(value="regionop.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String regionop(HttpServletRequest request, HttpServletResponse response) {
		
		String areano=request.getParameter("areaop");
		
		List<RegionDTO> lists = region.getList(areano); //1번 서울로 서울 지역 찾아와 lists 에 담기 
			
		/*for(int i=0;i<lists.size();i++) {
			String a = lists.get(i).getRegion(); // 강남, 홍대
			System.out.println(a);
		}
		*/
		request.setAttribute("areaop", areano);
		request.setAttribute("lists", lists);
		
		return "tmem/regionop"; //option 생성하기 홍대 강남 
	}
	
	
	@RequestMapping(value="coupon.action",method={RequestMethod.GET,RequestMethod.POST})
	public String CouponGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String brandName= request.getParameter("brandName");//lotte	
		String brandCate= request.getParameter("brandCate");//1
		
		//System.out.println("coupon에서 "+brandName );
		return "redirect:/tcoupon.action?brandCate="+brandCate+ "&brandName="+brandName;
		
	}						//coupon1
	
	@RequestMapping(value="tcoupon.action",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView Coupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String brandName= request.getParameter("brandName");//lotte
		//System.out.println("test"+brandName);
		String brandCate= request.getParameter("brandCate");//1
		
		String xmlName = null;
		File xmlfile = null;
		
		if(brandCate.equals("1")) 	xmlName = "tmovie.xml"; //DOM 파싱을 위한 객체 생성 
		else if(brandCate.equals("2")) 	xmlName="tbakery.xml"; 
		else if(brandCate.equals("3")) 	xmlName="tconvie.xml"; 	
		else if(brandCate.equals("4"))	xmlName="tcafe.xml"; 
	
		xmlfile = new File(xmlName);
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();  
		Document doc = documentBuilder.parse(xmlfile);
		doc.getDocumentElement().normalize();
		Element root = doc.getDocumentElement();
		
		NodeList nList = root.getElementsByTagName(brandName); //영화관 이름 brandName=megabox

		//System.out.println(nList);
		String XmlName[]= {"brandName","info1","info2","benefit","note","tel","image"};
		
		Element child = (Element)nList.item(0); //첫번째 메가박스
	
		
		Map<String, String> m = new HashMap<String, String>();
		
			for(int i=0;i<XmlName.length;i++) {
				String result =child.getElementsByTagName(XmlName[i]).item(0).getFirstChild().getNodeValue();		
				m.put(XmlName[i], result);
				
			}

		ModelAndView mav = new ModelAndView();
	
		//mav.addObject("brandN",nList); //megabox ..
		mav.addObject("Hmap",m);
		mav.addObject("brandCate",brandCate);
		mav.addObject("brandName",brandName);	
		mav.setViewName("tmem/tcoupon");// coupontest
		
		return mav;
	 
	}

	
	@RequestMapping(value="select.action",method={RequestMethod.POST,RequestMethod.GET})
	public String Couponselect(HttpServletRequest request, HttpServletResponse response,String brandName,String brandCate) throws Exception {
	
		Map<String, String> selectmap = new HashMap<String, String>();
		
		if(brandCate.equals("1")) {		
			
			selectmap.put("megabox", "메가박스");
			selectmap.put("lotte", "롯데시네마");
			selectmap.put("cgv", "CGV");	
		}
		else if(brandCate.equals("2")) {		
			selectmap.put("pariscroissant", "파리크라상");
			selectmap.put("parisbage", "파리바게트");
			selectmap.put("toure", "뚜레쥬르");			
		}
		else if(brandCate.equals("3")) {	
			
			selectmap.put("ministop", "미니스톱");
			selectmap.put("cu", "CU");
			selectmap.put("seven", "7eleven");						
		}		
		else if(brandCate.equals("4")) {
			
			selectmap.put("droptop", "드롭탑");
			selectmap.put("smoothieKing", "스무디킹");
			selectmap.put("angelInus", "엔젤리너스");			
		}
		
		Iterator<String> it = selectmap.keySet().iterator();
			
		request.setAttribute("it", it); //영문이름 담겨있음 option value=megabox
		request.setAttribute("selectmap", selectmap); //한글이름 추출 용도 option.text
		request.setAttribute("brandName", brandName);
		return "tmem/selectBox";		
	}
	
/*	@RequestMapping(value="/context.action",method=RequestMethod.POST)
	public String context(HttpServletRequest request, HttpServletResponse response) throws ParserConfigurationException, SAXException, IOException {
		
		String brandName= request.getParameter("brandName");//lotte
		
		String brandCate= request.getParameter("brandCate");//1
		
		String xmlName = null;	
		File xmlfile = null;
		
		if(brandCate.equals("1")) 	xmlName = "tmovie.xml"; //DOM 파싱을 위한 객체 생성 
		else if(brandCate.equals("2")) 	xmlName="tbakery.xml"; 
		else if(brandCate.equals("3")) 	xmlName="tconvie.xml"; 	
		else if(brandCate.equals("4"))	xmlName="tcafe.xml"; 
	
		xmlfile = new File(xmlName);
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();  
		Document doc = documentBuilder.parse(xmlfile);
		doc.getDocumentElement().normalize();
		Element root = doc.getDocumentElement();
		
		NodeList nList = root.getElementsByTagName(brandName); //영화관 이름 brandName=megabox

		//System.out.println(nList);
		String XmlName[]= {"brandName","info1","info2","benefit","note","tel","image"};
		
		Element child = (Element)nList.item(0); //첫번째 메가박스
		
		Element sub_el=null;
		
		Map<String, String> m = new HashMap<String, String>();
		
		for(int i=0;i<XmlName.length;i++) {
			String result =child.getElementsByTagName(XmlName[i]).item(0).getFirstChild().getNodeValue();		
			m.put(XmlName[i], result);
		}
	
		request.setAttribute("Hmap", m);
		request.setAttribute("brandName", brandName);
		return "tmem/context";
	}

	*/
	
	@RequestMapping(value="/eventpopup.action")
	public String eventpopup(HttpServletRequest request, HttpServletResponse response) {
		return "eventpopup";
	}
}
