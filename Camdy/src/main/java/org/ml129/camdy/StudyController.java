package org.ml129.camdy;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ml129.domain.LoginVO;
import org.ml129.domain.MystudyVO;
import org.ml129.domain.StudyVO;
import org.ml129.mapper.StudyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class StudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private StudyMapper smapper;
	
	
	
	@RequestMapping("make")
	public String make() {
		logger.info("스터디방 생성 페이지 입니다.");

		return "08make";

	}
	
	@RequestMapping("detail")
	public String detail() {
		logger.info("채팅방 입장 전 화면 입니다.");

		return "09detail";

	}
	
	
	@RequestMapping("/make.do")
	public String joinInsert(HttpServletRequest req) throws UnsupportedEncodingException, ParseException {
		logger.info("studies DB에 데이터 삽입 중 입니다.");
		
		req.setCharacterEncoding("UTF-8");
		String study_title = req.getParameter("study_title");
		String study_content = req.getParameter("study_content");
		String study_pic = req.getParameter("study_pic");
		String study_end_date_bf = req.getParameter("study_end_date");
		
		String study_mhour_bf = req.getParameter("study_mhour");
		String study_pw = req.getParameter("study_pw");
		String study_cate = req.getParameter("study_cate");
		
		//아이디 세션 값 가져오기//
		HttpSession session = req.getSession();
	    String user_id = (String) session.getAttribute("user_id");
		
		
	    logger.info(study_title);
		logger.info(study_content);
		logger.info(study_pic);
		logger.info(study_end_date_bf);
		logger.info(user_id);
		logger.info(study_mhour_bf);
		logger.info(study_cate);
		
		
		//날짜로 변환//
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date study_end_date_util = (Date) fm.parse(study_end_date_bf);
		System.out.println("utilDate :" + study_end_date_util);
		
		
	    java.sql.Date study_end_date = new java.sql.Date(study_end_date_util.getTime());
	    System.out.println("sqlDate:" + study_end_date);
		
	    //숫자로 변환//
	    int study_mhour = Integer.parseInt(study_mhour_bf);

		smapper.studyInsert(study_title, study_content, study_pic, study_end_date , study_mhour, user_id, study_pw, study_cate);
		List<StudyVO> camdylist = smapper.studyVO(study_title);
		
		
		req.setAttribute("camdylist", camdylist);
		session.setAttribute("user_id",user_id);

		 
		
		return "09preview";
				
	}
	
	
	@RequestMapping("/studygo.do")
	public String studygo(@RequestParam("study_seq") int study_seq, Model model, HttpServletRequest req) {
		logger.info("채팅방 입장 전 화면 입니다.");
		
		StudyVO stvo = smapper.studysVO(study_seq);	
		System.out.println(stvo);
		List<LoginVO> onvo = smapper.onuser(study_seq);
		System.out.println(onvo);
		
		//아이디 세션 값 가져오기//
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		model.addAttribute("stvo",stvo); //객체 바인딩
		model.addAttribute("onvo",onvo);
		session.setAttribute("user_id",user_id);

		return "09preview";

	}
	
	@RequestMapping("/index.do")
	public @ResponseBody List<StudyVO> index(@RequestParam String index) {
		logger.info("검색 내용에 대한 DB 출력합니다.");
		logger.info(index);
		
		List<StudyVO> ilist = smapper.studyindexlist(index);
		

		return ilist;

	}
	
	
	@RequestMapping("video")
	public String video(@RequestParam("study_seq") int study_seq, HttpServletRequest req) {
		logger.info("공부 화상 채팅방입니다.");
		
		//아이디 세션 값 가져오기//
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		
		System.out.println(user_id);
		System.out.println(study_seq);
		
		// 참여했던 방인지, 아닌지 확인하고 현재 참여 중으로 바꾸기.//
		List<MystudyVO> mylist = smapper.mystudy(user_id);
		
		
		int a = 0;
		for(int i=0; i<mylist.size(); i++) {
			
			if(mylist.get(i).getStudy_seq() == study_seq) {
				
				smapper.changemylist(study_seq);
				
			}else {
				a++;
			}
		}
		
		if(a == mylist.size()) {
			
			smapper.insertmylist(user_id,study_seq);
		}
		

		
		
		LocalTime now_for = LocalTime.now();
		System.out.println(now_for);
		DateTimeFormatter nowformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String study_now = now_for.format(nowformatter);

		session.setAttribute("study_now",study_now);
		session.setAttribute("study_now_start", now_for);
		session.setAttribute("study_seq", study_seq);

		return "10video";

	}
	
	
	
	
	
	
	


}
