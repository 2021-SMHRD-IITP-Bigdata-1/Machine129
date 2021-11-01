package org.ml129.camdy;

import java.io.UnsupportedEncodingException;
import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ml129.domain.CamdyBoard;
import org.ml129.domain.LoginVO;
import org.ml129.domain.StudyVO;
import org.ml129.mapper.CamdyBoardMapper;
import org.ml129.mapper.BasicMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;




@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BasicMapper bmapper;
	
	
	@Autowired 
	private CamdyBoardMapper mapper;
	public CamdyBoard vo;


	
	//게시판 Controller 

	@RequestMapping("ajaxboard1")
	public String camdyAjaxboardList(HttpServletRequest request) {

		logger.info("Ajax 게시판 목록 페이지 입니다.");

		return "07ajaxboard";
	}

	@RequestMapping("board") 
	public String camdyboardList(HttpServletRequest request) {
		logger.info("게시판 목록 페이지 입니다.");
		List<CamdyBoard> list = mapper.camdyboardList();
		request.setAttribute("list", list); 
		return "05board";
	}

	@RequestMapping("camdyboardListJson")
	public @ResponseBody List<CamdyBoard> camdyboardListJson() {

		List<CamdyBoard> list = mapper.camdyboardListJson();

		return list;
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
	
		
		
		
		
	// ------------------------------------------- 	
	// ------------홈 화면 Controller----------------
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		logger.info("홈화면 입니다.");
		
	    HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		List<StudyVO> list = bmapper.studyList();
		List<StudyVO> mlist = bmapper.studyMyList(user_id);
		List<StudyVO> nlist = bmapper.studyNewList();
		List<StudyVO> lalist = bmapper.studylangList();
		List<StudyVO> jlist = bmapper.studyjobList();
		List<StudyVO> clist = bmapper.studycList();
		List<StudyVO> olist = bmapper.studyoList();
		List<StudyVO> ulist = bmapper.studyuList();
		List<StudyVO> tlist = bmapper.studytcList();
		
		request.setAttribute("slist", list);
		request.setAttribute("mlist", mlist);
		request.setAttribute("nlist", nlist);
		request.setAttribute("lalist", lalist);
		request.setAttribute("jlist", jlist);
		request.setAttribute("clist", clist);
		request.setAttribute("olist", olist);
		request.setAttribute("ulist", ulist);
		request.setAttribute("tlist", tlist);
				
		
		return "02home";
	}

	// ------------------------------------------- 	
	// ----------소개 페이지 Controller--------------
	@RequestMapping("intro")
	public String intro() {
		logger.info("소개 페이지 입니다.");

		return "01intro";

	}

	
	// ------------------------------------------- 	
	// ----------로그인 페이지 Controller------------
	@RequestMapping("login")
	public String login() {
		logger.info("로그인 페이지 입니다.");

		return "03login";

	}

	//-------------- 로그인 기능 구현 ---------------
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
		
		
		if(vo==null) {
			
			return "01intro";
			
		}else {
		
			session.setAttribute("user_id",user_id);
			session.setAttribute("user_nickname",vo.getUser_nickname());
			
			return "redirect:/";
			
		}
		
				
	}

	//-------------- 로그아웃 기능 구현 ---------------
	@RequestMapping("logout") 
	public String logout(HttpServletRequest req) { 
		logger.info("회원이 로그아웃 하였습니다.");
		
		 HttpSession session = req.getSession();
	     session.invalidate();
		
		
		
		return "01intro"; 
		
	}
	
	// -------------------------------------------
	//---------- 회원가입 페이지 Controller ----------
	@RequestMapping("join") 
	public String joinPage() { 
		logger.info("회원가입 페이지입니다.");
		
		return "04join";
		
	}
	
	
	
	//---------- 회원 DB 저장 기능 구현 ----------
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
		
		
		return "redirect:/login";
				
	}
		
			

}
		

	

