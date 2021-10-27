package org.ml129.camdy;

import java.util.List;

import org.ml129.domain.CamdyBoard;
import org.ml129.mapper.CamdyBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;






@RestController
public class AjaxCamdyBoardController {

	@Autowired
	private CamdyBoardMapper mapper;
	public CamdyBoard vo;
	
	@RequestMapping("ajaxboard") //게시판 리스트 보기
	public List<CamdyBoard> ajaxcamdyList(){
		List<CamdyBoard> list = mapper.camdyboardList();
		return list;
	}
	
	@RequestMapping("ajaxInsert") //게시판 리스트 보기
	public void ajaxInsert(CamdyBoard vo){
		mapper.camdyboardInsert(vo);
	}
	
	@RequestMapping("ajaxDelete") //게시글 삭제
	public void ajaxcamdyDelete(@RequestParam("post_seq") int post_seq){
		mapper.camdyboardDelete(post_seq);
	}
	
	@RequestMapping("ajaxUpdate") //게시글 제목과 작성자 수정
	public void ajaxcamdyUpdate(CamdyBoard vo){
		mapper.ajaxcamdyUpdate(vo);
	}
	
	@RequestMapping("ajaxContents") //게시글 내용 수정
	public void ajaxcamdyContents(CamdyBoard vo){
		mapper.ajaxcamdyContents(vo);
	}
	
	
	
}
