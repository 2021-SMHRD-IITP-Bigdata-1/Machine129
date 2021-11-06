package org.ml129.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.ml129.domain.LoginVO;
import org.ml129.domain.MystudyVO;
import org.ml129.domain.StudyVO;



public interface StudyMapper {

	public void studyInsert(@Param("study_title") String study_title, @Param("study_content") String study_content, @Param("study_pic") String study_pic, @Param("study_end_date") Date study_end_date,
			@Param("study_mhour") int study_mhour, @Param("user_id") String user_id, @Param("study_pw") String study_pw,  @Param("study_cate") String study_cate);
    
	
	@Select("select * from studies where study_title = #{study_title}")
	public List<StudyVO> studyVO(@Param("study_title") String study_title);
	
	@Select("select * from studies where study_seq = #{study_seq}")
	public StudyVO studysVO(@Param("study_seq") int study_seq);

	public List<StudyVO> studyindexlist(String index);	
	
	@Select("select * from users where user_id in (select user_id from mystudies where study_seq=#{study_seq} and my_now =1);")
	public List<LoginVO> onuser(@Param("study_seq") int study_seq);

	
	@Select("select * from mystudies where user_id = #{user_id}")
	public List<MystudyVO> mystudy(@Param("user_id") String user_id);

    
	public void changemylist(@Param("study_seq") int study_seq);

	
	public void insertmylist(@Param("user_id") String user_id,@Param("study_seq") int study_seq);


	public void outmystudies(@Param("user_id") String user_id,@Param("study_seq") int study_seq);

	// 시간 데이터 저장
	public void addtimes(@Param("user_id") String user_id, @Param("time_start") String time_start, @Param("time_end") String time_end, @Param("time_sum") int time_sum);



	
	
	
	
	
	

}
