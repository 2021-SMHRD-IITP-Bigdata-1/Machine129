package org.ml129.camdy;


import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ml129.mapper.StudyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DataController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private StudyMapper smapper;

	
	
	
	@RequestMapping("result")
	public String result(HttpServletRequest req,@RequestParam("study_seq") int study_seq) {
		logger.info("공부 결과 창입니다.");
		
		//아이디 세션 값 가져오기//
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		
		
		//처음시간 가져오기//
		String time_start = (String) session.getAttribute("study_now"); //Stringtype
		Temporal study_now_start = (Temporal) session.getAttribute("study_now_start"); //Timetype
		
		
		
		//나가기시간 세션에 저장하기//
		LocalTime end_for = LocalTime.now();
		System.out.println(end_for);
		DateTimeFormatter endformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String time_end = end_for.format(endformatter);

		Duration duration = Duration.between(study_now_start, end_for);
		Long longst = duration.getSeconds();
		
		int time_sum = longst.intValue();
		
		int hour = time_sum/3600;
		int minute = time_sum%3600/60;
		int seconds = time_sum%3600%60;
		
		// 값 저장하기
		smapper.addtimes(user_id,time_start,time_end,time_sum);
		
		System.out.println(hour);
		System.out.println(minute);
		System.out.println(seconds);
		
		req.setAttribute("hour", hour);
		req.setAttribute("minute", minute);
		req.setAttribute("seconds", seconds);
		
		
		
		
		session.setAttribute("study_now",time_start);
		session.setAttribute("study_end",time_end);
		session.removeAttribute("study_seq"); //세션지우기
		
		
		//스터디방 나가기
		smapper.outmystudies(user_id,study_seq);
		
		

		return "11result";

	}

}
