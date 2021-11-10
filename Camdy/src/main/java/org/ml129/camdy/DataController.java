package org.ml129.camdy;


import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ml129.domain.PhonesVO;
import org.ml129.domain.StudyVO;
import org.ml129.domain.TimeVO;
import org.ml129.domain.outsVO;
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
		
		//닉네임 세션 값 가져오기//
		String user_nickname = (String) session.getAttribute("user_nickname");
		
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
		

		//어제 공부한 시간 가져오기//
		List<TimeVO> tbeforelist = smapper.timebefore(user_id);
		int bftime_sum = 0;
		
	    for (int i = 0; i < tbeforelist.size(); i++) {
	    	
	    	bftime_sum += tbeforelist.get(i).getTime_sum();
			
		}
	    
	    int bhour = bftime_sum/3600;
		int bminute = bftime_sum%3600/60;
		
		
		//총 공부시간 가져오기//
		TimeVO totalstudy = smapper.totalstudy(user_id);
		
		int total_sum = totalstudy.getTime_sum();
		
		int thour = total_sum/3600;
		int tminute = total_sum%3600/60;
		
		//휴대폰 사용시간 가져오기//
		PhonesVO phonestudy = smapper.phonestudy(user_id,time_start);
		
		int phone_sum = 0;
		int phour = 0;
		int pminute = 0;
		int pseconds = 0;
		
		if(phonestudy != null) {
		phone_sum = phonestudy.getPhone_sum();
		
		phour = phone_sum/3600;
		pminute = phone_sum%3600/60;
		pseconds = phone_sum%3600%60;
		}
		
		//이탈시간 가져오기//
		outsVO outstudy = smapper.outstudy(user_id,time_start);
		
		int out_sum = 0;

		int ohour = 0;
		int ominute = 0;
		int oseconds = 0;
		
		if(outstudy != null) {
		out_sum = outstudy.getOut_sum();
		
		ohour = out_sum/3600;
		ominute = out_sum%3600/60;
		oseconds = out_sum%3600%60;
		}
		
		// 순 공부시간 //
		
		int purestu = time_sum - (phone_sum + out_sum);
		
		int puhour = purestu/3600;
		int puminute = purestu%3600/60;
		int puseconds = purestu%3600%60;
		
		double pupercent = (double) purestu/ (double) time_sum *100.0;
		System.out.println(pupercent);
		System.out.println(purestu);
		System.out.println(time_sum);
		
		// 목표시간 //
		StudyVO goaltime = smapper.studysVO(study_seq);
		
		int gtime = goaltime.getStudy_mhour()*3600;
		int dotime = gtime - total_sum;
		
		int dohour = dotime/3600;
		int dominute = dotime%3600/60;
		
		
		
		//방금
		req.setAttribute("hour", hour);
		req.setAttribute("minute", minute);
		req.setAttribute("seconds", seconds);
		
		//어제
		if(tbeforelist.size() > 0) {
		req.setAttribute("bhour", bhour);
		req.setAttribute("bminute", bminute);
		}
		
		//오늘 총
		req.setAttribute("thour", thour);
		req.setAttribute("tminute", tminute);
		
		//휴대폰
		if(phonestudy != null) {
		req.setAttribute("phour", phour);
		req.setAttribute("pminute", pminute);
		req.setAttribute("pseconds", pseconds);
		}
		
		//이탈
		if(outstudy != null) {
		req.setAttribute("ohour", ohour);
		req.setAttribute("ominute", ominute);
		req.setAttribute("oseconds", oseconds);
		}
		
		//순공부시간
		
		
		req.setAttribute("puhour", puhour);
		req.setAttribute("puminute", puminute);
		req.setAttribute("puseconds", puseconds);
		
		//순공부시간 %
		req.setAttribute("pupercent", (int)pupercent);
		
		//목표시간
		req.setAttribute("dohour", dohour);
		req.setAttribute("dominute", dominute);
		
		
		session.setAttribute("study_now",time_start);
		session.setAttribute("study_end",time_end);
		session.setAttribute("user_id",user_id);
		session.setAttribute("user_nickname",user_nickname);
		session.removeAttribute("study_seq"); //세션지우기
		
		
		//스터디방 나가기
		smapper.outmystudies(user_id,study_seq);
		
		
		
		

		return "11result";

	}
	
	
	@RequestMapping("mypage")
	public String mypage(HttpServletRequest req) {
		logger.info("마이페이지 입니다.");
		
		//아이디 세션 값 가져오기//
		HttpSession session = req.getSession();
	    String user_id = (String) session.getAttribute("user_id");
				
		//닉네임 세션 값 가져오기//
		String user_nickname = (String) session.getAttribute("user_nickname");
		
		
		//이번주//
		//1)이번주 평균 시간//
		List<TimeVO> weekavg = smapper.weekavg(user_id);
		
		int weeksum = 0;
		
		for (int i = 0; i < weekavg.size(); i++) {
			
			weeksum += 	weekavg.get(i).getTime_sum();
			
		}
		
		weeksum = weeksum/weekavg.size();
		
		System.out.println(weeksum);
		
		int wavghour = weeksum/3600;
		int wavgminute = weeksum%3600/60;
		
		req.setAttribute("wavghour", wavghour);
		req.setAttribute("wavgminute", wavgminute);

		//2)이번주 총 시간//
		TimeVO weektotal = smapper.weektotal(user_id);
		
		int weektsum = weektotal.getTime_sum();
		
		int wthour = weektsum/3600;
		int wtminute = weektsum%3600/60;
		int wtseconds = weektsum%3600%60;
		
		req.setAttribute("wthour", wthour);
		req.setAttribute("wtminute", wtminute);
		req.setAttribute("wtseconds", wtseconds);
		
		//3) 이번주 순 공부시간 구하기.
		PhonesVO weekphone = smapper.weekphone(user_id);
		outsVO weekout = smapper.weekout(user_id);
		
		int weekpsum = weekphone.getPhone_sum();
		int weekosum = weekout.getOut_sum();
		
		int weekpure = weektsum - (weekpsum + weekosum);
		
		int wpuhour = weekpure/3600;
		int wpuminute = weekpure%3600/60;
		int wpuseconds = weekpure%3600%60;
		
		req.setAttribute("wpuhour", wpuhour);
		req.setAttribute("wpuminute", wpuminute);
		req.setAttribute("wpuseconds", wpuseconds);
		
		//4. 캠디와 같이 공부한 시간
		TimeVO totaltime = smapper.totaltime(user_id);
		
		int alltime = totaltime.getTime_sum();
		
		int allhour = alltime/3600;
		
		req.setAttribute("allhour", allhour);
		
		//5.이번주 순 공부시간 비율
		
		double weekppercent = (double) weekpure/ (double) weektsum *100.0;
		
		req.setAttribute("weekppercent", (int) weekppercent);
		
		//6. 총 순 공부시간 비율
		
		PhonesVO totalphone = smapper.totalphone(user_id);
		outsVO totalout = smapper.totalout(user_id);
		
		int allphone = totalphone.getPhone_sum();
		int allout = totalout.getOut_sum();
		
		double allpercent = (double) (alltime - allphone - allout ) / (double) alltime *100.0;
		
		req.setAttribute("allpercent", (int) allpercent);
		
		//7. 이번 주 이탈/휴대폰 사용 시간 비율
		
		double weekphpercent = (double) weekpsum / (double) weektsum *100.0;
		double weekoutpercent = (double) weekosum / (double) weektsum *100.0;
		
		req.setAttribute("weekphpercent", (int) weekphpercent);
		req.setAttribute("weekoutpercent", (int) weekoutpercent);
		
		//8. 총 이탈/휴대폰 비율

		double allphpercent = (double) allphone / (double) alltime *100.0;
		double alloutpercent = (double) allout / (double) alltime *100.0;
		
		req.setAttribute("allphpercent", (int) allphpercent);
		req.setAttribute("alloutpercent", (int) alloutpercent);
		
		//세션 보내기//
		session.setAttribute("user_id",user_id);
		session.setAttribute("user_nickname",user_nickname);
		
		//9. 이번주 공부 시간
		List<TimeVO> weeklist = smapper.weeklist(user_id);
		
		int mon = (weeklist.get(0).getTime_sum())/3600;
		int tue = (weeklist.get(1).getTime_sum())/3600;
		
		req.setAttribute("mon", mon);
		req.setAttribute("tue", tue);
		
		System.out.println(mon);
		System.out.println(tue);

		
	
		
		

		return "12mypage";

	}

}
