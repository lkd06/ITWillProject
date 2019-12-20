package com.exe.project;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.EventPageDAO;
import com.exe.dto.EventPageDTO;
import com.exe.dto.MemberDTO;
import com.exe.util.MyUtil;

@Controller
public class EventPageController {
	
	@Autowired
	@Qualifier("eventpageDAO")
	EventPageDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/event_created.action")
	public ModelAndView event_created() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("event/event_created");
		
		return mav;
	}
	
	@RequestMapping(value = "/event_created_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String event_created_ok(MultipartHttpServletRequest request,HttpServletResponse response) {
		
		MultipartFile file = request.getFile("upload");
		MultipartFile file2 = request.getFile("upload2");
		
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String subjectImageName = file.getOriginalFilename();
		String contentImageName = file2.getOriginalFilename();

		EventPageDTO dto = new EventPageDTO();//db에 집어넣고

		int maxNum = dao.getMaxNum();

		dto.setNum(maxNum + 1);
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setSubjectImageName(subjectImageName);
		dto.setContentImageName(contentImageName);
		dto.setStartDay(startDay);
		dto.setEndDay(endDay);
		dto.setIpAddr(request.getRemoteAddr());

		dao.insertData(dto);
		
		//실제경로: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Project\resources\images\event
				Path path1 = Paths.get("D:\\sts-bundle\\work\\Project\\src\\main\\webapp\\resources\\images\\event");
				String path = request.getSession().getServletContext().getRealPath("/resources/images/event"); 
				
				if(file!=null && file.getSize()>0) { //파일이 있으면

					try {

						FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
						FileOutputStream fos1 = new FileOutputStream(path1 + "/" + file.getOriginalFilename()); //경로를 path에서 path1으로 변경!(X)
						InputStream is = file.getInputStream();

						byte[] buffer = new byte[1024];

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
		
		return "redirect:/event_list.action";
	}
	
	@RequestMapping(value = "/event_list.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String evnet_list(HttpServletRequest request,HttpServletResponse response) throws Exception {

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
		int dataCount = dao.getDataCount(searchKey, category);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<EventPageDTO> lists = dao.getList(searchKey, category, start, end);
		
		//페이징 처리
		String param = "";
		if(!category.equals("")){
			param = "searchKey=" + searchKey;
			param += "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		
		String listUrl = cp + "/event_list.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;		
		}
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = cp + "/event_article.action?pageNum=" + currentPage;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "event/event_list";
	}
	
	@RequestMapping(value = "/event_article.action")
	public ModelAndView evnet_article(HttpServletRequest request,HttpServletResponse response, EventPageDTO dto) throws Exception {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		//로그인 상태인지 확인용
		HttpSession session = request.getSession();
		MemberDTO memdto = (MemberDTO)session.getAttribute("memDTO");

		
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
		dao.updateHitCount(num);
				
		dto = dao.getReadData(searchKey,category,num); //하나의 데이터 읽어오기
		
		if(dto==null){
			//return "redirect:/list.action";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		String params = "pageNum=" + pageNum;
		if(!category.equals("")){
			params += "&searchKey=" + searchKey;
			params += "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		
		EventPageDTO preReadData = dao.getpreReadData(searchKey, category, num);
		int preBoardNum = 0;
		String preSubject = "";
		if(preReadData!=null) {
			preBoardNum = preReadData.getNum();
			preSubject = preReadData.getSubject();			
		}
		
		EventPageDTO nextReadData = dao.getnextReadData(searchKey, category, num);
		int nextBoardNum = 0;
		String nextSubject = "";
		if(nextReadData!=null) {
			nextBoardNum = nextReadData.getNum();
			nextSubject = nextReadData.getSubject();		
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("event/event_article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",params);
		mav.addObject("pageNum",pageNum);
		mav.addObject("preBoardNum", preBoardNum);
		mav.addObject("preSubject", preSubject);
		mav.addObject("nextBoardNum", nextBoardNum);
		mav.addObject("nextSubject", nextSubject);
		
		return mav;
	}
	
	@RequestMapping(value = "/event_deleted.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String event_deleted(HttpServletRequest request,HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.deleteData(num);
		
		return "redirect:/event_list.action?pageNum=" + pageNum;
	}
	
	
}