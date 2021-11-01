package org.ml129.camdy;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ml129.domain.StudyVO;
import org.ml129.mapper.StudyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



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
		
		 
		
		return "09detail";
				
	}
	
	
	@RequestMapping("/studygo.do")
	public String studygo(@RequestParam("study_seq") int study_seq, Model model) {
		logger.info("채팅방 입장 전 화면 입니다.");
		
		StudyVO stvo = smapper.studysVO(study_seq);	
		System.out.println(stvo);
		model.addAttribute("stvo",stvo); //객체 바인딩

		return "09detail";

	}
	
	
	


}
