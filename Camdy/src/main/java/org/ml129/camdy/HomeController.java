package org.ml129.camdy;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ml129.domain.CamdyBoard;
import org.ml129.domain.LoginVO;
import org.ml129.mapper.CamdyBoardMapper;
import org.ml129.mapper.BasicMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BasicMapper bmapper;
	
	
	@Autowired // DI(의존성주입) -> new(X)
	private CamdyBoardMapper mapper;

	public CamdyBoard vo;

	@RequestMapping("ajaxboard1")
	public String camdyAjaxboardList(HttpServletRequest request) {

		logger.info("Ajax 게시판 목록 페이지 입니다.");

		return "07ajaxboard";
	}

	@RequestMapping("board") // 클라이언의 요청을 받아서 처리하는 부분
	public String camdyboardList(HttpServletRequest request) {
		// 데이터베이스와 연동해서 게시판 전체 리스트를 가져오기 -> Model(DAO)
		logger.info("게시판 목록 페이지 입니다.");
		List<CamdyBoard> list = mapper.camdyboardList();
		request.setAttribute("list", list); // 객체바인딩(request바인딩)
		return "05board"; // boardList ->View의 논리적인이름->/WEB-INF/views/boardList.jsp
	}

	@RequestMapping("camdyboardListJson")
	public @ResponseBody List<CamdyBoard> camdyboardListJson() {

		List<CamdyBoard> list = mapper.camdyboardListJson();

		return list;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "02home";
	}

	// 소개 페이지
	@RequestMapping("intro")
	public String intro() {
		logger.info("소개 페이지 입니다.");

		return "01intro";

	}

	// 게시판의 수정 기능
	@RequestMapping("camdyboardUpdate")
	public String boardUpdate(CamdyBoard vo) {

		mapper.camdyboardUpdate(vo);

		return "redirect:/boardList.do";
	}

	// 게시판의 삭제 기능
	@RequestMapping("camdyboardDelete")
	public String boardDelete(int post_seq) {

		mapper.camdyboardDelete(post_seq);

		return "redirect:/boardList.do";
	}

	// 게시판 글 작성 페이지
	@RequestMapping("boardwrite")
	public String boardwrite() {
		logger.info("게시글 작성 페이지 입니다.");

		return "06boardwrite";

	}

	// 게시판 글 삽입
	@RequestMapping("camdyboardInsert")
	public String camdyboardInsert(CamdyBoard vo) {

		mapper.camdyboardInsert(vo);

		return "redirect:/board";
	}

	// 로그인 페이지로 이동
	@RequestMapping("login")
	public String login() {
		logger.info("로그인 페이지 입니다.");

		return "03login";

	}
		
	@RequestMapping("/login.do")
	public String logincheck(HttpServletRequest req) {
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		
		HttpSession session = req.getSession();
		
		logger.info("유저DB에 접근합니다.");
		logger.info(user_id);
		logger.info(user_pw);
		logger.info(bmapper.toString());
		
		
		LoginVO vo = bmapper.LoginCheck(user_id, user_pw);
		System.out.println(vo);
		
		
		
		if(vo==null) {
			
			return "02home";
			
		}else {
		
			session.setAttribute("user_id",user_id);
			
			return "01intro";
			
		}
		
				
	}

	
	@RequestMapping("logout") 
	public String logout(HttpServletRequest req) { 
		logger.info("회원이 로그아웃 하였습니다.");
		
		 HttpSession session = req.getSession();
	     session.invalidate();
		
		
		
		return "01intro"; 
		
	}
	
	
	@RequestMapping("join") 
	public String joinPage() { 
		logger.info("회원가입 페이지입니다.");
		
		return "04join";
		
	}
	
	
	
	@RequestMapping("/boardInsert.do")
	public String joinInsert(HttpServletRequest req) throws UnsupportedEncodingException {
		logger.info("users DB에 데이터 삽입 중 입니다.");
		
		req.setCharacterEncoding("UTF-8");
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		String user_name = req.getParameter("user_name");
		String user_nickname = req.getParameter("user_nickname");
		String user_birthdate = req.getParameter("user_birthdate");
	
		
		
		

		
		
		bmapper.joinInsert(user_id, user_pw, user_name, user_nickname,user_birthdate);
		logger.info(user_id);
		logger.info(user_pw);
		logger.info(user_name);
		logger.info(user_nickname);
		logger.info(user_birthdate);
		
		
//		bmapper.joinInsert(vo);
		
		return "redirect:/login";
				
	}
		
			

}
		

	

