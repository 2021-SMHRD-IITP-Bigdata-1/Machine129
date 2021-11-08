package org.ml129.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.ml129.domain.TimeVO;
import org.ml129.domain.outsVO;
import org.ml129.domain.PhonesVO;
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

	// 시간 데이터 저장 (!)
	public void addtimes(@Param("user_id") String user_id, @Param("time_start") String time_start, @Param("time_end") String time_end, @Param("time_sum") int time_sum);


	// 어제 시간 데이터 가져오기
	public List<TimeVO> timebefore(@Param("user_id") String user_id);

	// 오늘 총 시간 가져오기
	@Select("select today_date, sum(time_sum) as time_sum from times where today_date= date_format(now(),'%Y-%m-%d') and user_id = #{user_id} group by today_date;")
	public TimeVO totalstudy(@Param("user_id") String user_id);

	// 휴대폰 총 시간 가져오기
	@Select("select today_date, sum(phone_sum) as phone_sum from phones where today_date= date_format(now(),'%Y-%m-%d') and user_id = #{user_id} and phone_start > #{time_start} group by today_date;")
	public PhonesVO phonestudy(@Param("user_id") String user_id, @Param("time_start") String time_start);

	@Select("select today_date, sum(out_sum) as out_sum from outs where today_date= date_format(now(),'%Y-%m-%d') and user_id = #{user_id} and out_start > #{time_start} group by today_date;")
	public outsVO outstudy(@Param("user_id") String user_id, @Param("time_start") String time_start);

	/////////// 마이페이지 Mapper ///////
	// 1)이번 주 평균 시간
	@Select("SELECT avg(time_sum) as time_sum FROM times where user_id= '${user_id}' and week_num = yearweek(now(),7) group by today_date;")
	public List<TimeVO> weekavg(@Param("user_id") String user_id);
	
	// 2)이번 주 총 시간
	@Select("SELECT sum(time_sum) as time_sum FROM times where user_id= '${user_id}' and week_num = yearweek(now(),7);")
	public TimeVO weektotal(@Param("user_id") String user_id);

	//3) 이번 주 순 공부시간
	@Select("SELECT sum(phone_sum) as phone_sum FROM phones where user_id= '${user_id}' and week_num = yearweek(now(),7);")
	public PhonesVO weekphone(@Param("user_id") String user_id);

	@Select("SELECT sum(out_sum) as out_sum FROM outs where user_id= '${user_id}' and week_num = yearweek(now(),7);")
	public outsVO weekout(@Param("user_id") String user_id);

	//4) 캠디와 함께한 시간
	@Select("SELECT sum(time_sum) as time_sum FROM times where user_id= '${user_id}'")
	public TimeVO totaltime(@Param("user_id") String user_id);
	
	//5) 총 시간 비율 구하기
	@Select("SELECT sum(phone_sum) as phone_sum FROM phones where user_id= '${user_id}'")
	public PhonesVO totalphone(@Param("user_id") String user_id);

	@Select("SELECT sum(out_sum) as out_sum FROM outs where user_id= '${user_id}'")
	public outsVO totalout(@Param("user_id") String user_id);

	@Select("select today_date,sum(time_sum) as time_sum from times where user_id= '${user_id}' and week_num = yearweek(now(),7) group by today_date order by today_date;")
	public List<TimeVO> weeklist(@Param("user_id") String user_id);


	
	



	
	
	
	
	
	

}
