package com.exe.project;


import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.boardListDAO;
import com.exe.dao.fileDAO;
import com.exe.dao.replyDAO;
import com.exe.dto.boardListDTO;
import com.exe.dto.fileDTO;
import com.exe.dto.replyDTO;
import com.exe.util.FileManager;
import com.exe.util.MyUtil;

@Controller
public class boardListController {
	
	@Autowired
	@Qualifier("boardListDAO")
	boardListDAO dao;	
	
	@Autowired
	@Qualifier("replyDAO")
	replyDAO dao1;
	
	@Autowired
	@Qualifier("fileDAO")
	fileDAO dao2;
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;
	
	@Autowired
	FileManager fileManager;

	@RequestMapping(value = "/boardListCreate.action")
	public ModelAndView created() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardListCreate");
		
		return mv;
	}
	
	@RequestMapping(value = "/boardListCreate_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String create_ok(boardListDTO dto, fileDTO dto2, HttpServletRequest request,HttpServletRequest respose) throws Exception {
		
		int maxNum = dao.getMaxNum();
		dto.setNum(maxNum + 1); 
		dto.setIpAddr(request.getRemoteAddr());
		
		dao.insertData(dto);
		
	    //파일업로드
	    int maxNum1 = dao2.getMaxNum();
		MultipartFile file = ((MultipartRequest)request).getFile("upload"); 
		InputStream is = file.getInputStream();
		 
		HttpSession session = request.getSession(); 
		String savePath = session.getServletContext().getRealPath("/resources/img"); 
		
		dto2.setNum(maxNum1 + 1); 
		dto2.setSaveFileName(FileManager.doFileUpload(is,file.getOriginalFilename(), savePath));
		dto2.setOriginalFileName(file.getOriginalFilename());
		
		dao2.insertData(dto2); 
		
		return "redirect://boardList.action";
	}
	
	@RequestMapping(value = "/replyCreate_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String create1_ok(replyDTO dto1, HttpServletRequest request, HttpServletRequest response) {
		
		int maxNum = dao1.getMaxNum();
		dto1.setReplyNum(maxNum + 1);
		
		dao1.insertData(dto1);
		
		String pageNum = request.getParameter("pageNum");
		String num = request.getParameter("num");
		
		return "redirect://boardListArticle.action?pageNum="+pageNum+"&num="+num;
	

	}
	
	@RequestMapping(value = "/boardList.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(HttpServletRequest request,HttpServletResponse response) throws Exception{

		   String cp = request.getContextPath();
           
	       String pageNum = request.getParameter("pageNum");
	       

	       int currentPage = 1;
	       
	       if(pageNum !=null)
	    	   currentPage = Integer.parseInt(pageNum);
	       
	       String searchKey = request.getParameter("searchKey");
	       String searchValue = request.getParameter("searchValue");
	       
	       
	       if(searchKey == null) {
	    	   
	    	   searchKey = "subject";
	    	   searchValue = "";
	       }else {
	    	   
	    	   if(request.getMethod().equalsIgnoreCase("GET"))
	    		   searchKey = URLDecoder.decode(searchValue, "UTF-8");
	    	   
	       }
	       
	       //전체데이터 갯수
	       int dataCount = dao.getDataCount(searchKey, searchValue);
	       
	       //전체페이지수
	       int numPerPage = 5;//한페이지
	       int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	       
	       if(currentPage > totalPage)
	    	   currentPage = totalPage;
	       
	       int start = (currentPage-1)*numPerPage+1;
	       int end = currentPage*numPerPage;
			
	       
		   List<boardListDTO> lists = dao.getLists(start, end, searchKey, searchValue);   

		   
		   //페이징처리
			String param = "";
			if(!searchValue.equals("")){
				param = "searchKey=" + searchKey;
				param+= "&searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
			}
			
			String listUrl = cp + "/boardList.action";
			if(!param.equals("")){
				listUrl = listUrl + "?" + param;				
			}
			
			String pageIndexList =
				myUtil.pageIndexList(currentPage, totalPage, listUrl);
				
            String articleUrl = 
				cp + "/boardListArticle.action?pageNum=" + currentPage;
				
			if(!param.equals(""))
				articleUrl = articleUrl + "&" + param;

			
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList",pageIndexList);
			request.setAttribute("dataCount",dataCount);
			request.setAttribute("articleUrl",articleUrl);		

			return "board/boardList";
			
	}
    
	@RequestMapping(value = "/boardListArticle.action", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView article(HttpServletRequest request,HttpServletResponse response) throws Exception{
				
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String replyNum =  request.getParameter("replyNum");
		String replyPageNum = request.getParameter("replyPageNum");	
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");		   	    
		String saveFileName = request.getParameter("saveFileName");
		HttpSession session = request.getSession(); 
		String savePath = cp + "/resources/img/";
		String path = "pageNum=" + pageNum + "&num=" + num + "&replyPageNum=" + replyPageNum; 
		
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		//hitCount
		dao.updateHitCount(num);
		
		boardListDTO dto = dao.getReadData(num);
        fileDTO dto2 = dao2.readData(num);
		
		if(dto==null){	
			
		}

		int lineSu = dto.getContent().split("\n").length;
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		
	    String param = "pageNum=" + pageNum + "&num=" + num;
	    
		if(searchKey != null) {
	        param += "&searchKey=" + searchKey; 
		    param += "&searchValue=" 
	        + URLEncoder.encode(searchValue, "UTF-8");
		 
		  }
	
		int dataCount = dao1.getDataCount();
		int numPerPage = 5;	
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		int currentPage = 1;
		if(replyPageNum != null) {
			currentPage = Integer.parseInt(replyPageNum);
		}
		
		if(currentPage > totalPage)
	    	   currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage;
		int end = currentPage*numPerPage;		
		
		List<replyDTO> list = dao1.getList(start, end, num);
		List<fileDTO> listf = dao2.getList(start, end, num, saveFileName);
		
		//댓글 페이징처리
		String listUrl = cp + "/boardListArticle.action";
		if(!path.equals("")){
			listUrl = listUrl + "?" + path;				
		}
		
		String replyIndexList =
			myUtil.replyIndexList(currentPage, totalPage, listUrl);
	
		String articleUrl = 
				cp + "/boardListArticle.action?replyPageNum=" + currentPage;
		
		if(!path.equals(""))
				articleUrl = articleUrl + "&" + path;
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/boardListArticle");
		
		mv.addObject("savePath", savePath+"\\"+dto2.getSaveFileName());
		mv.addObject("list",list);
		mv.addObject("listf",listf);
		mv.addObject("dto",dto);
		mv.addObject("dto2",dto2);
		mv.addObject("params",param);
		mv.addObject("lineSu",lineSu);
		mv.addObject("dataCount",dataCount);
		mv.addObject("replyIndexList",replyIndexList);
		mv.addObject("pageNum",pageNum);
		mv.addObject("replyPageNum",replyPageNum);
		mv.addObject("articleUrl",articleUrl);
		mv.addObject("path",path);

		return mv;
	}
		 	
	@RequestMapping(value = "/boardListUpdate.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(HttpServletRequest request,HttpServletRequest response) throws Exception{
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		boardListDTO dto = dao.getReadData(num);
	
		if(dto == null) {
			return "redirect://boardList.action";
		}
		
		int currentPage = 1;
		int numPerPage = 5;
		
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<replyDTO> list = dao1.getList(start, end, num);
		
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		return "board/boardListUpdate";
	}
	
	@RequestMapping(value = "/boardListUpdate_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String update_ok(boardListDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		String num = request.getParameter("num");
		
		dao.updateData(dto);
		
		return "redirect://boardListArticle.action?pageNum=" + pageNum + "&num=" + num;
		
	}
	
	@RequestMapping(value = "/replyUpdate.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String update1(HttpServletRequest request, HttpServletRequest response) throws Exception {
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));


		boardListDTO dto = dao.getReadData(num);
		replyDTO dto1 = dao1.oneReply(replyNum);
		
		if(dto1 == null) {
			return "redirect://boardListArticle.action?pageNum=" + pageNum + "&num=" + num;			
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("dto1", dto1);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		request.setAttribute("replyNum", replyNum);
		
		return "board/boardListUpdate1";	
		
	}
	
	@RequestMapping(value = "replyUpdate_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String update1_ok(replyDTO dto1, HttpServletRequest request, HttpServletRequest response) throws Exception{
		
		String cp = request.getContextPath();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int num = Integer.parseInt(request.getParameter("num"));
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));
		
		dao.getReadData(num);
		dao1.updateData(dto1);
		
		
		return "redirect://boardListArticle.action?pageNum=" + pageNum + "&num=" + num;
		
		
		
	}
	
	@RequestMapping(value = "/boardListDelete.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String delete_ok(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));

		dao.deleteData(num);

		return "redirect://boardList.action?pageNum" + pageNum;
	}
	
	@RequestMapping(value = "/replyDelete.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String delete1_ok(HttpServletRequest request,HttpServletRequest response) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		String num = request.getParameter("num");
		System.out.println(num);
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));
		System.out.println(replyNum);


		dao1.deleteData(replyNum);
		
		return "redirect://boardListArticle.action?pageNum=" + pageNum + "&num=" + num;

	
	}
}


