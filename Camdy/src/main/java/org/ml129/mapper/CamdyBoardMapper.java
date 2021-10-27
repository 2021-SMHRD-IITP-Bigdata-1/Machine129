package org.ml129.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.ml129.domain.CamdyBoard;


public interface CamdyBoardMapper {
	public List<CamdyBoard> camdyboardList();
	
	public List<CamdyBoard> camdyboardListJson();
	
	public CamdyBoard boardContents(int post_seq);
	
	public void camdyboardUpdate(CamdyBoard vo);
	
	public void camdyboardDelete(int post_seq);
	
	public void camdyboardWrite(CamdyBoard vo);
	
	public void camdyboardInsert(CamdyBoard vo);

	public void ajaxcamdyUpdate(CamdyBoard vo);

	public void ajaxcamdyContents(CamdyBoard vo);
	
	
	

}
