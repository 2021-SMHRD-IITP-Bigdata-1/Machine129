package org.ml129.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StudyVO {
	
	
	private int study_seq;
	private String study_title;
	private String study_content;
	private Date study_start_date;
	private Date study_end_date;
	private String user_id;
	private String study_pic;
	private int study_num;
	private int study_mhour;
	private String study_pw;
	private int study_now;
	private String study_cate;
	
	

}
