package com.exe.project;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.MemberDAO;
import com.exe.dao.packageDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.UserServiceDTO;

@Controller
public class memberController {

	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Autowired
	@Qualifier("packDAO")
	packageDAO packDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/login.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String login(MemberDTO dto,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		//미입력시
		if(dto.getPhone().equals("")) {
			session.setAttribute("message","Phone 미입력");
		}else if(dto.getPw().equals("")) {
			session.setAttribute("message","Pw 미입력");
		}else { //입력시 확인
			//나중에 phone,pw 구분해서 할까하는중
			dto = dao.login(dto);
			  
			if(dto==null) {
				session.setAttribute("message","로그인 실패"); 
			}else {
				session.setAttribute("memDTO", dto);
				Calendar calen = new GregorianCalendar();
				int year = calen.get(Calendar.YEAR);
				int month = calen.get(Calendar.MONTH)+1;
				String ym=Integer.toString(year)+Integer.toString(month);
				//여기서 package 테이블에 phone와 yd로 탐색하여 있으면 그냥 두고
				//없으면 package 테이블에 insert해서 필요할 때마다 불러서 사용 가능하도록
				packDAO.existCheck(dto.getPhone(), ym,dto.getPriceNum());
			}
		}
		
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/logout.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memDTO");
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/signup.action", method = RequestMethod.GET)
	public String joinView() {
		return "login/signup";
	}
	
	@RequestMapping(value = "/signupview.action", method = RequestMethod.GET)
	public String joinViewIm() {
		return "login/signView";
	}
	
	@RequestMapping(value = "/signup.action", method = RequestMethod.POST)
	public String joinUser(MemberDTO dto) {
		dao.insertData(dto);
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/userinfo.action", method = RequestMethod.GET )
	public String userInfoView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");
		if(mem==null) {
			//로그인 상태가 아닐 때 일단 main으로 보냄
			//나중에 에러 메세지 같은 거 있음 좋겠음
			return "redirect:/#";
		}
		
		String phone = mem.getPhone();
		String admin = mem.getAdmin();
		
		List<UserServiceDTO> lists = dao.serviceInfo(phone);				
		model.addAttribute("lists",lists);
		
		mem = dao.memInfo(mem.getPhone());
		model.addAttribute("dto",mem);
		model.addAttribute("dto2", admin);
		
		return "login/userInfo";
	}
	
	@RequestMapping(value = "/signout.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String signout(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws IOException {
		
		dao.deleteUser(dto.getPhone());
		HttpSession session = request.getSession();
		session.removeAttribute("memDTO");
		
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/checkpw.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String checkpw(HttpServletRequest request,HttpServletResponse response, MemberDTO dto,Model model) throws IOException {
		
		boolean pwCheck = dao.pwCheck(dto);
		
		if(!pwCheck) {
			//메세지 안 뜬다
			model.addAttribute("message", "PW불일치");
			return "redirect:/userinfo.action";
		}
		
		request.setAttribute("dto", dto);
		
		return "login/update";
	}
	
	@RequestMapping(value = "/update.action")
	public ModelAndView update() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login/update");
		
		return mav;
	}
	
	@RequestMapping(value = "/update_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String update_ok(HttpServletRequest request,HttpServletResponse response, MemberDTO dto) {

		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));

		dao.update(dto);
		
		request.setAttribute("dto", dto);
		
		return "redirect:/userinfo.action";
	}
	
	@RequestMapping(value = "/idCh.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String idCheck(HttpServletRequest request) {
		
		String phone = request.getParameter("phone");
		
		if(dao.phoneCh(phone)==false) {
			request.setAttribute("message", "중복된 ID 입니다.");
		}else {
			request.setAttribute("message", "사용가능한 ID 입니다.");
		}
		
		request.setAttribute("phone", phone);
		
		return "login/idCheck";
	}
	
	@RequestMapping(value = "/pwCh.action", method = RequestMethod.GET)
	public String pwCheck(HttpServletRequest request) {
		String pw = request.getParameter("pw");
		String pwCheck = request.getParameter("pwCheck");
		request.removeAttribute("pwChMess");
		if(pw.equals(pwCheck)) {
			request.setAttribute("pwChMess", "PW 일치");
		}else {
			request.setAttribute("pwChMess", "PW 불일치");
		}
		return "login/pwmess";
	}
	
	@RequestMapping(value="updatepriceN.action",method = {RequestMethod.POST,RequestMethod.GET})
	public String updatepriceinfo(HttpServletRequest request,HttpServletResponse response,int num) throws Exception{
		//view.action 에서 새로운 요금제 num를 받아서 
		//dto 에 update 하고 userinfo (내정보)로 보내기 
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");
		
		//String phone = dto.getPhone();
		//System.out.println("homecontroll + " + dto.getPhone());
		
		dao.updatepriceinfo(num, mem);
		
		request.setAttribute("mem", mem); //session 정보를 다시 
		
		return "redirect:/userinfo.action";
	}
	
	@RequestMapping(value="deleteservice.action",method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteservice(HttpServletRequest request,HttpServletResponse response,UserServiceDTO dto) throws Exception{
		
		int servicename=Integer.parseInt(request.getParameter("servicename"));
		String str="";
		if(servicename==1 || servicename==2 || servicename==3) {
			str="wavve";
		}else if(servicename==4 || servicename==5) {
			str="flo";
		}else if(servicename==6) {
			
			str="find";
		}
		
		System.out.println(str);
		
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");
		
		String phone=mem.getPhone();
		
		dao.deleteService(str, phone);
		
		return "redirect:/userinfo.action";
	}
	
	@RequestMapping(value = "/findPw", method = { RequestMethod.POST, RequestMethod.GET})
		public String findPwView() {
		return "login/findpw";
	}
		
	@RequestMapping(value = "/findInfo", method = RequestMethod.POST)
	@ResponseBody
	public List<String> checkInfo(HttpServletRequest request) {
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		MemberDTO dto = dao.findForPw(phone);
		
		List<String> lists = new ArrayList<String>();
		if(dto==null) {
			lists.add("가입하지 않은 번호입니다.");
		}else if(!dto.getEmail().equals(email)) {
			lists.add("잘못된 이메일 입니다.");
		}else {
			//phone, email 일치
			//비밀번호 재생성 및 메일 보내기
			Random r_num = new Random();
			String newPw="";
			for(int i=0;i<6;i++) {
				newPw+=Integer.toString(r_num.nextInt(9));
			}
			System.out.println(newPw);
			//PW 변경은 나중에
			//일단 메일 전송부터
			String senderEmail="lkd9361@naver.com";
			String receiverEmail=email;
			String title="비밀번호 변경 신청(포트폴리오)";
			String content=newPw;
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,"UTF-8");
				messageHelper.setFrom(senderEmail);
				messageHelper.setTo(receiverEmail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				mailSender.send(message);
				//PW 변경 실시
				//salt는 일단 전에 있던거 그대로 사용
				dto.setPw(newPw);
				dao.update(dto);
			} catch (Exception e) {
				System.out.println(e);
				lists.add("변경실패");
			}
		}
		return lists;
	}
}
