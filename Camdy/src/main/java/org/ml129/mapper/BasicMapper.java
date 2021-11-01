package org.ml129.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import org.ml129.domain.LoginVO;
import org.ml129.domain.StudyVO;




public interface BasicMapper {

	
	public LoginVO LoginCheck(@Param("user_id") String user_id, @Param("user_pw") String user_pw);
	
	public String bringNickname(@Param("user_id") String user_id);
	
	public void Login(LoginVO vo);

	public void joinInsert(@Param("user_id") String user_id, @Param("user_pw") String user_pw, @Param("user_name") String user_name,@Param("user_nickname") String user_nickname,@Param("user_birthdate") String user_birthdate);
	
	@Select("select * from studies")
	public List<StudyVO> studyList();
	
	@Select("select * from studies where study_start_date = date_format(now(),'%Y-%m-%d');")
	public List<StudyVO> studyNewList();
	
	@Select("select * from studies where user_id = #{user_id}")
	public List<StudyVO> studyMyList(String user_id);
	
	@Select("select * from studies where study_cate = '어학'")
	public List<StudyVO> studylangList();
	
	@Select("select * from studies where study_cate = '취업'")
	public List<StudyVO> studyjobList();
	
	@Select("select * from studies where study_cate = '자격증'")
	public List<StudyVO> studycList();
	
	@Select("select * from studies where study_cate = '공무원'")
	public List<StudyVO> studyoList();
	
	@Select("select * from studies where study_cate = '대입 수능'")
	public List<StudyVO> studyuList();
	
	@Select("select * from studies where study_cate = '임용'")
	public List<StudyVO> studytcList();

	

	

	

	
	
	

	

	

}

