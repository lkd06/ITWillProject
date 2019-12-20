package com.exe.project;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exe.dao.AcShopDAO;
import com.exe.dao.MemberDAO;
import com.exe.dao.NotiDAO;
import com.exe.dao.PhoneShopDAO;
import com.exe.dao.PriceDAO;
import com.exe.dao.QnaDAO;
import com.exe.dao.payDAO;
import com.exe.dto.AcShopDTO;
import com.exe.dto.MemberDTO;
import com.exe.dto.NotiDTO;
import com.exe.dto.PhoneShopDTO;
import com.exe.dto.PriceDTO;
import com.exe.dto.QnaDTO;
import com.exe.dto.payDTO;
import com.exe.util.MyUtil;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Autowired
	@Qualifier("phoneshopDAO")
	PhoneShopDAO dao1;
	
	@Autowired
	@Qualifier("acshopDAO")
	AcShopDAO dao2;
	
	@Autowired
	@Qualifier("qnaDAO")
	QnaDAO dao3;
	
	@Autowired
	@Qualifier("notiDAO")
	NotiDAO dao4;
	
	@Autowired
	@Qualifier("payDAO")
	payDAO dao5;
	
	@Autowired
	@Qualifier("priceDAO")
	PriceDAO dao6;

	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request,HttpServletResponse response) throws Exception {

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum"); 
		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체데이터갯수 
		int dataCount = dao1.getDataCount();
		
		//전체페이지수 
		int numPerPage = 8; 
		int totalPage = myUtil.getPageCount(numPerPage,dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<PhoneShopDTO> lists = dao1.getList(start, end);
		
		String listUrl = cp + "/phone_shop_list.action";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = cp + "/phone_shop_article.action?pageNum=" + currentPage;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		/*
		 * 메인에서 휴대폰 샵(최신순) 나타내기 끝!!!!!!
		 */
		
		String cp2 = request.getContextPath();
		
		String pageNum2 = request.getParameter("pageNum");
		int currentPage2 = 1;
		
		if(pageNum2 != null)
			currentPage2 = Integer.parseInt(pageNum2);
		
		String searchKey2 = request.getParameter("searchKey");
		String category2 = request.getParameter("category");
		
		if(searchKey2 == null){
			searchKey2 = "category";
			category2 = "";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
				category2 = URLDecoder.decode(category2, "UTF-8");
		}
		
		//전체데이터갯수
		int dataCount2 = dao4.getDataCount(searchKey2, category2);
		
		//전체페이지수
		int numPerPage2 = 1;
		int totalPage2 = myUtil.getPageCount(numPerPage2, dataCount2);
		
		if(currentPage2 > totalPage2)
			currentPage2 = totalPage2;
		
		int start2 = (currentPage2-1)*numPerPage2+1;
		int end2 = currentPage2*numPerPage2;
		
		List<NotiDTO> lists2 = dao4.getList(searchKey2, category2, start2, end2);
		
		//페이징 처리
		String param2 = "";
		if(!category2.equals("")){
			param2 = "searchKey=" + searchKey2;
			param2 += "&category=" + URLEncoder.encode(category2, "UTF-8");
		}
		
		String listUrl2 = cp2 + "/noti_list.action";
		if(!param2.equals("")){
			listUrl2 = listUrl2+ "?" + param2;		
		}
		
		String pageIndexList2 = myUtil.pageIndexList(currentPage2, totalPage2, listUrl2);
		
		//글보기 주소 정리
		String articleUrl2 = cp2 + "/noti_article.action?pageNum=" + currentPage2;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists2", lists2);
		request.setAttribute("pageIndexList2",pageIndexList2);
		request.setAttribute("dataCount2",dataCount2);
		request.setAttribute("articleUrl2",articleUrl2);
		
		/*
		 * 메인에서 공지사항 최신 1개 나타내기 끝!!!!!!
		 */
			
		return "main";
	}
	
	
	//*****************메인***********************
	
	
	@RequestMapping(value = "/phone_shop_created.action")
	public ModelAndView phone_shop_created() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("shop/phone_shop_created");
		
		return mav;
	}
	
	@RequestMapping(value = "/phone_shop_created_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String phone_shop_created_ok(MultipartHttpServletRequest request,HttpServletResponse response,String str) {
		
		MultipartFile file = request.getFile("upload");

		String subject = request.getParameter("subject");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String imageName = file.getOriginalFilename();
		
		PhoneShopDTO dto = new PhoneShopDTO();//db에 집어넣고

		int maxNum = dao1.getMaxNum();

		dto.setNum(maxNum + 1);
		dto.setSubject(subject);
		dto.setPrice(price);
		dto.setContent(content);
		dto.setImageName(imageName);

		dao1.insertData(dto);
		
		//실제경로: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Project\resources\images\phone_shop
		Path path1 = Paths.get("D:\\sts-bundle\\work\\Project\\src\\main\\webapp\\resources\\images\\phone_shop");
		String path = request.getSession().getServletContext().getRealPath("/resources/images/phone_shop"); 
		
		if(file!=null && file.getSize()>0) { //파일이 있으면

			try {

				FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
				FileOutputStream fos1 = new FileOutputStream(path1 + "/" + file.getOriginalFilename()); //경로를 path에서 path1으로 변경!(X)
				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {

					int data = is.read(buffer,0,buffer.length);

					if(data==-1) { 
						break; 
					}
					fos.write(buffer,0,data);
					fos1.write(buffer,0,data); 
				}
				is.close();
				fos1.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		return "redirect:/phone_shop_list.action";
	}
	
	@RequestMapping(value = "/phone_shop_list.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String phone_shop_list(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum"); 
		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체데이터갯수 
		int dataCount = dao1.getDataCount();
		
		//전체페이지수 
		int numPerPage = 12; 
		int totalPage = myUtil.getPageCount(numPerPage,dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<PhoneShopDTO> lists = dao1.getList(start, end);
		
		String listUrl = cp + "/phone_shop_list.action";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = cp + "/phone_shop_article.action?pageNum=" + currentPage;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "shop/phone_shop_list";
	}
	
	
	@RequestMapping(value = "/phone_shop_article.action")
	public ModelAndView phone_shop_article(HttpServletRequest request,HttpServletResponse response) throws Exception {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		//로그인 상태인지 확인용
		HttpSession session = request.getSession();
		MemberDTO memdto = (MemberDTO)session.getAttribute("memDTO");
		PriceDTO priceDTO = dao6.getReadData(num);
		
		PhoneShopDTO dto = dao1.getReadData(num); //하나의 데이터 읽어오기
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("shop/phone_shop_article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("pageNum",pageNum);
		mav.addObject("priceDTO", priceDTO);
		
		if(memdto!=null){
			mav.addObject("phone", memdto.getPhone());
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/phone_shop_deleted.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String phone_shop_deleted(HttpServletRequest request,HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		int num =Integer.parseInt(request.getParameter("num"));
		
		dao1.deleteData(num);
		
		return "redirect:/phone_shop_list.action?pageNum=" + pageNum;
	}
	
	
/*
 *
 * 휴대폰 샵 끝!!!!!!!!!
 *	
 */
	
	
	@RequestMapping(value = "/ac_shop_created.action")
	public ModelAndView ac_shop_created() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("shop/ac_shop_created");
		
		return mav;
	}
	
	@RequestMapping(value = "/ac_shop_created_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String ac_shop_created_ok(MultipartHttpServletRequest request,HttpServletResponse response,String str) {
		
		MultipartFile file = request.getFile("upload");

		String subject = request.getParameter("subject");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String imageName = file.getOriginalFilename();

		AcShopDTO dto = new AcShopDTO();//db에 집어넣고

		int maxNum = dao2.getMaxNum();

		dto.setNum(maxNum + 1);
		dto.setSubject(subject);
		dto.setPrice(price);
		dto.setContent(content);
		dto.setImageName(imageName);

		dao2.insertData(dto);
		
		//실제경로: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Project\resources\images\ac_shop
		Path path1 = Paths.get("D:\\sts-bundle\\work\\Project\\src\\main\\webapp\\resources\\images\\ac_shop");
		String path = request.getSession().getServletContext().getRealPath("/resources/images/ac_shop"); 

		if(file!=null && file.getSize()>0) { //파일이 있으면

			try {

				FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
				FileOutputStream fos1 = new FileOutputStream(path1 + "/" + file.getOriginalFilename()); //경로를 path에서 path1으로 변경!(X)
				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {

					int data = is.read(buffer,0,buffer.length);

					if(data==-1) { 
						break; 
					}
					fos.write(buffer,0,data);
					fos1.write(buffer,0,data); 
				}
				is.close();
				fos1.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		return "redirect:/ac_shop_list.action";
	}
	
	@RequestMapping(value = "/ac_shop_list.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String ac_shop_list(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum"); 
		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체데이터갯수 
		int dataCount = dao2.getDataCount();
		
		//전체페이지수 
		int numPerPage = 12; 
		int totalPage = myUtil.getPageCount(numPerPage,dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<AcShopDTO> lists = dao2.getList(start, end);
		
		String listUrl = cp + "/ac_shop_list.action";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = cp + "/ac_shop_article.action?pageNum=" + currentPage;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "shop/ac_shop_list";
	}
	
	
	@RequestMapping(value = "/ac_shop_article.action")
	public ModelAndView ac_shop_article(HttpServletRequest request,HttpServletResponse response) throws Exception {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		//로그인 상태인지 확인용
		HttpSession session = request.getSession();
		MemberDTO memdto = (MemberDTO)session.getAttribute("memDTO");
		
		AcShopDTO dto = dao2.getReadData(num); //하나의 데이터 읽어오기
		
		if(dto==null){
			//return "redirect:/list.action";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("shop/ac_shop_article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("pageNum",pageNum);
		
		if(memdto!=null){
			mav.addObject("phone", memdto.getPhone());
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/ac_shop_deleted.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String ac_shop_deleted(HttpServletRequest request,HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao2.deleteData(num);
		
		return "redirect:/ac_shop_list.action?pageNum=" + pageNum;
	}
	
	
/*
 *
 * 액세서리 샵 끝!!!!!!!!!
 *
 */	
	
	
	@RequestMapping(value = "/qna_created.action")
	public ModelAndView qna_created() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("qna/qna_created");
		
		return mav;
	}
	
	@RequestMapping(value = "/qna_created_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String qna_created_ok(HttpServletRequest request,HttpServletResponse response) {
		
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		QnaDTO dto = new QnaDTO();//db에 집어넣고

		int maxNum = dao3.getMaxNum();

		dto.setNum(maxNum + 1);
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setGroupNum(dto.getNum());
		dto.setDepth(0);
		dto.setOrderNo(0);
		dto.setParent(0);
		dto.setIpAddr(request.getRemoteAddr());

		dao3.insertData(dto);
		
		return "redirect:/qna_list.action";
	}
	
	@RequestMapping(value = "/qna_list.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String qna_list(HttpServletRequest request,HttpServletResponse response) throws Exception {

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String category = request.getParameter("category");
		
		if(searchKey == null){
			searchKey = "category";
			category = "";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
				category = URLDecoder.decode(category, "UTF-8");
		}
		
		//전체데이터갯수
		int dataCount = dao3.getDataCount(searchKey, category);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<QnaDTO> lists = dao3.getList(searchKey, category, start, end);
		
		int listNum, n=0;
		
		ListIterator<QnaDTO> it = lists.listIterator();
		while(it.hasNext()) {
			
			QnaDTO data = (QnaDTO)it.next();
			
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			
			n++;
		}
		
		//페이징 처리
		String param = "";
		if(!category.equals("")){
			param = "searchKey=" + searchKey;
			param += "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		
		String listUrl = cp + "/qna_list.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;		
		}
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = cp + "/qna_article.action?pageNum=" + currentPage;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "qna/qna_list";
	}
	
	@RequestMapping(value = "/qna_article.action")
	public ModelAndView qna_article(HttpServletRequest request,HttpServletResponse response) throws Exception {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null)
			pageNum = "1";
		
		String searchKey = request.getParameter("searchKey");
		String category = request.getParameter("category");

		if(searchKey == null){
			searchKey = "category";
			category = "";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
				category = URLDecoder.decode(category, "UTF-8");
		}
		
		//조회수 증가
		dao3.updateHitCount(num);
				
		QnaDTO dto = dao3.getReadData(searchKey,category,num); //하나의 데이터 읽어오기
		
		if(dto==null){
			//return "redirect:/list.action";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		String params = "pageNum=" + pageNum;
		if(!category.equals("")){
			params += "&searchKey=" + searchKey;
			params += "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("qna/qna_article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",params);
		mav.addObject("pageNum",pageNum);
		
		return mav;
	}
	
	@RequestMapping(value = "/qna_reply.action",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView qna_reply(QnaDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("qna/qna_reply");
		
		return mav;
	}
	
	@RequestMapping(value = "/qna_reply_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String qna_reply_ok(HttpServletRequest request,HttpServletResponse response,QnaDTO dto) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		String searchKey = request.getParameter("searchKey");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		if(searchKey == null){
			searchKey = "category";
			category = "";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
				category = URLDecoder.decode(category, "UTF-8");
		}
		
		//부모의 데이터
		dto = dao3.getReadData(searchKey,category,num); //하나의 데이터 읽어오기
		
		if(dto==null) {
			//return "read-error";
		}
		
		String temp = dto.getContent()+"\n\r-------------------------------\n\r";
		
		temp += "[답변]\n\r" + content;
		
		dto.setSubject(dto.getSubject());
		dto.setContent(temp);
		
		//답변
		//1.orderNo변경
		dto.setGroupNum(dto.getGroupNum());
		dto.setOrderNo(dto.getOrderNo());
		
		dao3.updateData(dto);
		
		//2.답변 입력
		int maxNum = dao3.getMaxNum();
		
		dto.setNum(maxNum + 1);
		dto.setDepth(dto.getDepth() + 1);
		dto.setOrderNo(dto.getOrderNo() + 1);
		
		dao3.insertData(dto);
		
		return "redirect:/qna_list.action?pageNum="+pageNum;
	}
	
	@RequestMapping(value = "/qna_deleted.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String qna_deleted(HttpServletRequest request,HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao3.deleteData(num);
		
		return "redirect:/qna_list.action?pageNum=" + pageNum;
	}
	
	
/*
 * 
 * Q&A 끝!!!!!!!!!
 * 	
 */
	
	
	@RequestMapping(value = "/s_index.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Sindex(HttpServletRequest request) {
		return "event/S_list";
	}
	
	@RequestMapping(value = "/s_agree_sel.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Sagreementselect(HttpServletRequest request) {
		return "event/S_agreement-select";
	}
	
	@RequestMapping(value = "/s_agree_fm.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Sagreementfreeagreement(HttpServletRequest request) {
		return "event/S_agreement-freeagreement";
	}
	
	@RequestMapping(value = "/s_agree_tagree.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String SagreementTagreement(HttpServletRequest request) {
		return "event/S_agreement-Tagreement";
	}
	
	@RequestMapping(value = "/s_agree_f.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Sagreementfree(HttpServletRequest request) {
		return "event/S_agreement-free";
	}
	
	@RequestMapping(value = "/s_fee_bok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Sfeebokji(HttpServletRequest request) {
		return "event/S_fee-bokji";
	}
	
	@RequestMapping(value = "/s_fee_tp.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String SfeeTplus(HttpServletRequest request) {
		return "event/S_fee-Tplus";
	}
	
	@RequestMapping(value = "/s_fee_rwp.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Sfeerainbowpoint(HttpServletRequest request) {
		return "event/S_fee-rainbowpoint";
	}
	
	@RequestMapping(value = "/s_com_wifi.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String ScombincableNwificombin(HttpServletRequest request) {
		return "event/S_combin-cableNwificombin";
	}
	
	@RequestMapping(value = "/s_com_tab.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Scombintablets(HttpServletRequest request) {
		return "event/S_combin-tablets";
	}
	
	@RequestMapping(value = "/s_all_sal.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Salliancesale(HttpServletRequest request) {
		return "event/S_alliance-sale";
	}
	
	@RequestMapping(value = "/s_all_t5.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String SallianceThigh5(HttpServletRequest request) {
		return "event/S_alliance-Thigh5";
	}
	
	@RequestMapping(value = "/s_vis_cou.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Svisceracoupon(HttpServletRequest request) {
		return "event/S_viscera_coupon";
	}
	
	@RequestMapping(value = "/s_vis_memup.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String Svisceramamverup(HttpServletRequest request) {
		return "event/S_viscera_memverup";
	}
	
	
/*
 * 
 * 할인/혜택 끝!!!!!!!!!
 * 
 */
	
	
	@RequestMapping(value = "/prize.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String prize(HttpServletRequest request) {
		return "prize/prize";
	}
	
	
/*
 * 
 * 결합상품 끝!!!!!!!!!
 * 
 */
	
	
	@RequestMapping(value = "/noti_created.action")
	public ModelAndView noti_created() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("noti/noti_created");
		
		return mav;
	}
	
	@RequestMapping(value = "/noti_created_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String noti_created_ok(HttpServletRequest request,HttpServletResponse response) {
		
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		NotiDTO dto = new NotiDTO();//db에 집어넣고

		int maxNum = dao4.getMaxNum();

		dto.setNum(maxNum + 1);
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setIpAddr(request.getRemoteAddr());

		dao4.insertData(dto);
		
		return "redirect:/noti_list.action";
	}
	
	@RequestMapping(value = "/noti_list.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String noti_list(HttpServletRequest request,HttpServletResponse response) throws Exception {

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String category = request.getParameter("category");
		
		if(searchKey == null){
			searchKey = "category";
			category = "";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
				category = URLDecoder.decode(category, "UTF-8");
		}
		
		//전체데이터갯수
		int dataCount = dao4.getDataCount(searchKey, category);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<NotiDTO> lists = dao4.getList(searchKey, category, start, end);
		
		//페이징 처리
		String param = "";
		if(!category.equals("")){
			param = "searchKey=" + searchKey;
			param += "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		
		String listUrl = cp + "/noti_list.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;		
		}
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = cp + "/noti_article.action?pageNum=" + currentPage;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "noti/noti_list";
	}
	
	@RequestMapping(value = "/noti_article.action")
	public ModelAndView noti_article(HttpServletRequest request,HttpServletResponse response) throws Exception {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null)
			pageNum = "1";
		
		String searchKey = request.getParameter("searchKey");
		String category = request.getParameter("category");

		if(searchKey == null){
			searchKey = "category";
			category = "";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
				category = URLDecoder.decode(category, "UTF-8");
		}
		
		//조회수 증가
		dao4.updateHitCount(num);
				
		NotiDTO dto = dao4.getReadData(searchKey,category,num); //하나의 데이터 읽어오기
		
		if(dto==null){
			//return "redirect:/list.action";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		String params = "pageNum=" + pageNum;
		if(!category.equals("")){
			params += "&searchKey=" + searchKey;
			params += "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("noti/noti_article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",params);
		mav.addObject("pageNum",pageNum);
		
		return mav;
	}
	
	@RequestMapping(value = "/noti_deleted.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String noti_deleted(HttpServletRequest request,HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao4.deleteData(num);
		
		return "redirect:/noti_list.action?pageNum=" + pageNum;
	}
	
	
/*
 * 
 * 공지사항 끝!!!!!!!!!
 * 
 */
	
	
	@RequestMapping(value = "/payView.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String payView (HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		//리스트 형식 수정 중
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		//수정
		String pro_type="";
		if(request.getParameter("pro_type")!=null) pro_type=request.getParameter("pro_type");
		
		int currentPage = 1;
		
		if(pageNum != null)  currentPage = Integer.parseInt(pageNum);
		
		
		//전체데이터갯수
		int dataCount = dao5.getDataCount(dto.getPhone(),"paid",pro_type);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<payDTO> buyList = dao5.buyList(dto.getPhone(),start,end,pro_type);
		
		String listUrl = cp + "/payView.action";
		if(!pro_type.equals("")) listUrl +="?pro_type="+pro_type;
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		request.setAttribute("buyList", buyList);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		
		return "pay/payView";
	}
	
	/*
	@RequestMapping(value = "/bagView.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String bagView (HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		
		//리스트 형식 수정 중
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		String pro_type="";
		
		if(request.getParameter("pro_type")!=null) pro_type=request.getParameter("pro_type");
		
		if(pageNum != null)  currentPage = Integer.parseInt(pageNum);
		
		
		//전체데이터갯수
		//int dataCount = dao5.getDataCount(searchKey, category);
		int dataCount = dao5.getDataCount(dto.getPhone(),"unpaid",pro_type);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		
		List<payDTO> buyList = dao5.bagList(dto.getPhone(),start,end,pro_type);
		
		String listUrl = cp + "/payView.action";
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		//수정 중
		request.setAttribute("buyList", buyList);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		
		return "pay/bagView";
	}
	*/
	
	//구매한 상품 정보
	@RequestMapping(value = "product.action",method = RequestMethod.GET)
	public String proContent(HttpServletRequest request) {
		
		String type = request.getParameter("type");
		String num = request.getParameter("num");
		
		if(type.equals("pshop")) {
			return "redirect:/phone_shop_article.action?num="+num;
		}else if(type.equals("acshop")) {
			return "redirect:/ac_shop_article.action?num="+num;
		}
		
		return "";
	}
	
	@RequestMapping(value = "calculate.action", method = RequestMethod.POST)
	public String cal(HttpServletRequest request) {
		
		int price = Integer.parseInt(request.getParameter("price"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		request.setAttribute("price", price*count);
		
		return "pay/calcul";
	}
	
	@RequestMapping(value = "payment.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String payment(HttpServletRequest request) {
		
		int proNum = Integer.parseInt(request.getParameter("pro_num"));
		String type = request.getParameter("pro_type");
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("memDTO");
		dto = dao.memInfo(dto.getPhone());
		
		request.setAttribute("mdto", dto);
		
		if(type.equals("pshop")) {
			//phone 상품 테이블에서 찾기
			PhoneShopDTO dto1 =  dao1.getReadData(proNum);
			request.setAttribute("dto", dto1);
		}else if(type.equals("acshop")){
			//다른 상품 테이블
			AcShopDTO acdto = dao2.getReadData(proNum);
			request.setAttribute("dto", acdto);
		}
		
		request.setAttribute("type", type);
		
		return "pay/payment";
	}
	
	//결제 >> point도 증가
	@RequestMapping(value = "/pay.action", method = {RequestMethod.POST,RequestMethod.GET})
	public void pay(HttpServletRequest request, HttpServletResponse response,payDTO dto) {
		
		//결제
		int num = Integer.parseInt(request.getParameter("pro_num"));
		//phone 인지 ac 인지 구분 필요?
		String pro_type = dto.getPro_type();
		String paid = dto.getPaid();
		int point = Integer.parseInt(request.getParameter("point"));
		String p = request.getParameter("price");
		System.out.println(p);
		p = p.replaceAll("(\r|\n|\r\n|\n\r)","");
		System.out.println(p);
		int price = Integer.parseInt(p);
		System.out.println("1");
		int pro_count = Integer.parseInt(request.getParameter("pro_count"));
		System.out.println("2");
		HttpSession session = request.getSession(); 
		MemberDTO dto2 = (MemberDTO)session.getAttribute("memDTO");
		
		if(pro_type.equals("pshop")) {//phone 제품명
			PhoneShopDTO dto1 = dao1.getReadData(num);
			dto.setSubject(dto1.getSubject());
		}else if(pro_type.equals("acshop")) {//ac 제품명
			AcShopDTO dto1 = dao2.getReadData(num);
			dto.setSubject(dto1.getSubject());
		}
		
		dto.setPrice(price);
		dto.setPro_count(pro_count);
		
		//구매인지 장바구니 인지도 구분?
		/*if(paid.equals("paid")) {
			dto2.setPoint(point);
			dao.updatePoint(dto2);
			dto2.setPoint((int)(dto.getPrice()*0.01));
			dao.addPoint(dto2);
		}*/
		
		//구매자 ID
		dto.setPhone(dto2.getPhone());
		dao5.addProduct(dto);
	}
	
	//pay(가격 넘겨주기) -> pay1(결제창) -> pay2(db insert) -> pay2_ok(결제완료)
	@RequestMapping(value = "/pay1.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView pay1(HttpServletRequest request, HttpServletResponse response,payDTO dto) {
		
		//결제
		int num = Integer.parseInt(request.getParameter("pro_num"));
		//phone 인지 ac 인지 구분 필요?
		String pro_type = dto.getPro_type();
		String paid = dto.getPaid();
		int price = Integer.parseInt(request.getParameter("price"));
		int point = Integer.parseInt(request.getParameter("point"));
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(); 
		MemberDTO dto2 = (MemberDTO)session.getAttribute("memDTO");
		
		if(pro_type.equals("pshop")) {//phone 제품명
			PhoneShopDTO dto1 = dao1.getReadData(num);
			dto.setSubject(dto1.getSubject());
		}else if(pro_type.equals("acshop")) {//ac 제품명
			AcShopDTO dto1 = dao2.getReadData(num);
			dto.setSubject(dto1.getSubject());
		}
		
		//구매인지 장바구니 인지도 구분?
		if(paid.equals("paid")) {
			dto2.setPoint(point);
			dao.updatePoint(dto2);
			dto2.setPoint((int)(dto.getPrice()*0.01));
			dao.addPoint(dto2);
		}
		
		//최종 가격
		dto.setPrice(price);
		//구매자 ID
		dto.setPhone(dto2.getPhone());
		/*
		dao5.addProduct(dto);
		*/
		
		session.setAttribute("pdto", dto);
		
		mav.addObject("pro_type", pro_type);
		mav.addObject("price", price);
		mav.addObject("email", dto2.getEmail());
		mav.addObject("name", dto2.getName());
		mav.addObject("phone", dto2.getPhone());
		mav.addObject("point", point);
		
		mav.setViewName("pay/pay");

		return mav;
	}
	
	@RequestMapping(value="/pay2.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String pay2(HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirect,HttpSession session,Model model) throws Exception {
		//결제는 완료된 상태
		
		//HttpSession session = request.getSession();
		payDTO dto2 = (payDTO)session.getAttribute("pdto");
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		
		session.removeAttribute("pdto");
		String phone = dto.getPhone();
		int price = dto2.getPrice();
		//int point = Integer.parseInt(request.getParameter("point"));

		//최종 가격
		dto2.setPrice(price);
		//구매자 ID
		dto2.setPhone(dto.getPhone());
		//insert
		dao5.addProduct(dto2);
		
		dto = dao.getReadData(phone);

		redirect.addAttribute("phone", dto.getPhone());
		redirect.addAttribute("name", dto.getName());
		redirect.addAttribute("email", dto.getEmail());
		redirect.addAttribute("price", price);
		redirect.addAttribute("subject", dto2.getSubject());
		//redirect.addAttribute("point", point);
		redirect.addAttribute("tmemberGrade", dto.getTmemberGrade());
		redirect.addAttribute("pro_count", dto2.getPro_count());
		redirect.addAttribute("pro_num", dto2.getPro_num());
		redirect.addAttribute("paid", dto2.getPaid());
		redirect.addAttribute("pro_type", dto2.getPro_type());
		
		return "redirect:/pay2_ok.action";
	}
	
	@RequestMapping(value="/pay2_ok.action",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView pay2_ok(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("phone") String phone,
			@RequestParam("name") String name,
			@RequestParam("subject") String subject,
			//@RequestParam("point") int point,
			@RequestParam("price") int price,
			@RequestParam("tmemberGrade") String tmemberGrade,
			@RequestParam("pro_count") int pro_count,
			@RequestParam("pro_num") int pro_num,
			@RequestParam("paid") String paid,
			@RequestParam("pro_type") String pro_type) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("phone", phone);
		mav.addObject("name", name);
		mav.addObject("subject", subject);
		//mav.addObject("point", point);
		mav.addObject("price", price);
		mav.addObject("tmemberGrade", tmemberGrade);
		mav.addObject("pro_count", pro_count);
		mav.addObject("pro_num", pro_num);
		mav.addObject("paid", paid);
		mav.addObject("pro_type", pro_type);
		
		mav.setViewName("pay/payOK");
		
		return mav;
	}
	
	@RequestMapping(value = "/bagView.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String bagView (HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		
		//리스트 형식 수정 중
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		String pro_type="";
		
		if(request.getParameter("pro_type")!=null) pro_type=request.getParameter("pro_type");
		
		if(pageNum != null)  currentPage = Integer.parseInt(pageNum);
		
		//	List<PhoneShopDTO> lists = dao1.getList(start, end); //imageName
		
		//전체데이터갯수
		//int dataCount = dao5.getDataCount(searchKey, category); payDAO
		int dataCount = dao5.getDataCount(dto.getPhone(),"unpaid",pro_type); //pro_type:pshop
		
		//전체페이지수
		int numPerPage = 100;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;		
		
		List<payDTO> buyList = dao5.bagList(dto.getPhone(),start,end,pro_type);
		//pro_num 상품 번호 
		 
		//수량 옵션 생성
		List<String> list = new ArrayList<String>();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		list.add("5");
		
		String listUrl = cp + "/payView.action";
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		//수정 중
		request.setAttribute("list", list); //수량 옵션 값
		request.setAttribute("buyList", buyList);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		
		return "pay/bagView";
	}
	
	@RequestMapping(value = "/procountop.action",method = {RequestMethod.GET,RequestMethod.POST})
	public  String  procountop (payDTO pdto,HttpServletRequest request, HttpServletResponse response, int pro_count , int pro_num) {
	//수정된 수량으로 옵션 새로 생성 + 장바구니 pay table 에 pro_count 수정
		
		HttpSession session = request.getSession(); 
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		//String pro_count=(String)request.getAttribute("pro_count");
		System.out.println("pro_count??"+pro_count);
		//String pro_num=(String)request.getAttribute("pro_num");
		System.out.println("pro_num??"+pro_num);
		String phone=dto.getPhone();
		
		pdto.setPro_count(pro_count);
		pdto.setPro_num(pro_num);
		pdto.setPhone(phone);
		
		dao5.updateList(pdto);
		
	
		//update 성공 후 list 가지고 
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/updatebaginfo.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String  updateBagview (@RequestParam int pro_count,@RequestParam int pro_num,payDTO pdto, HttpServletRequest request, HttpServletResponse response) {
		
		
		HttpSession session = request.getSession(); 
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		//String pro_count=(String)request.getAttribute("pro_count");
		//int pro_num=(Integer)request.getAttribute("pro_num");
		String phone=dto.getPhone();
		
		
		System.out.println("수정하자pro_num" + pro_num);
		System.out.println("수정하자" + pro_count);
		
		pdto.setPro_num(pro_num);
		pdto.setPro_count(pro_count);
		pdto.setPhone(phone);

		dao5.updateList(pdto);
		
		return "redirect:/bagView.action";
	}
	
	@RequestMapping(value="deletebaginfo.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteItemBagview (@RequestParam int pro_num,payDTO pdto,HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(); 
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		//String pro_num=(String)request.getAttribute("pro_num"); null
		//String pro_num=(String)request.getAttribute("pro_num");
		String phone=dto.getPhone();

		pdto.setPro_num(pro_num);
		pdto.setPhone(phone);
		
		int result=dao5.deleteList(pdto);
		System.out.println(result);//1
		
		//List<payDTO> newlist = dao5.updateList(phone, pro_num, pro_count);

		return "redirect:/bagView.action";
	}
	

/*
 * 
 * 장바구니/결제 끝!!!!!!!!!
 * 	
 */
	

	@RequestMapping(value = "/admin.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/a_list.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String a_list(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		List<MemberDTO> lists = dao.getList();
		
		request.setAttribute("lists", lists);
		
		return "admin/a_list";
	}
	
	@RequestMapping(value = "/updateAdmin_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String updateAdmin_ok(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws IOException {
		
		String phone = request.getParameter("phone");
		
		dto = dao.getReadData(phone);
		
		String admin = request.getParameter("admin");
		
		dto.setPhone(phone);
		dto.setAdmin(admin);
		dao.updateAdmin(dto);
		
		return "redirect:/a_list.action";
	}
	
	@RequestMapping(value = "/signout2.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String signout2(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws IOException {
		
		String phone = request.getParameter("phone");
		
		dao.deleteUser(phone);
		HttpSession session = request.getSession();
		session.removeAttribute("memDTO");
		
		return "redirect:/a_list.action";
	}
	
	@RequestMapping(value="/a_point.action",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView a_point(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		List<MemberDTO> lists = dao.getList();
		
		request.setAttribute("lists", lists);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/a_point");
		
		return mav;
	}
	
	@RequestMapping(value="/a_point_ok.action", method={RequestMethod.POST,RequestMethod.GET})
	public String a_point_ok(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws IOException {
		
		String phone = request.getParameter("phone");
		
		dto = dao.getReadData(phone);
		
		int point = Integer.parseInt(request.getParameter("point"));
		
		dto.setPhone(phone);
		dto.setPoint(point);
		dao.addPoint(dto);
		
		return "redirect:/a_point.action";
	}
	

	
	@RequestMapping(value="/a_grade.action",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView a_grade(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		List<MemberDTO> lists = dao.getList();
		
		request.setAttribute("lists", lists);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/a_grade");
		
		return mav;
	}
	
	@RequestMapping(value="/a_grade_ok.action", method={RequestMethod.POST,RequestMethod.GET})
	public String a_grade_ok(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws IOException {
		
		String phone = request.getParameter("phone");
		
		dto = dao.getReadData(phone);
		
		String tmemberGrade = request.getParameter("tmemberGrade");
		
		dto.setPhone(phone);
		dto.setTmemberGrade(tmemberGrade);
		dao.updateGrade(dto);
		
		return "redirect:/a_grade.action";
	}
	
	@RequestMapping(value = "/a_cart.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String a_cart(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//List<MemberDTO> lists = dao.getList();
		
		List<payDTO> lists = dao5.getList();
		
		request.setAttribute("lists", lists);
		
		return "admin/a_cart";
	}
	
	
/*
 * 
 * 관리자 페이지 끝!!!!!!!!!
 * 	
 */
	

	
}
