package org.ml129.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class CamdyBoard {
	private int post_seq;
	@NonNull
	private String post_title;
	@NonNull
	private String post_content;
	private String post_pic;
	@NonNull
	private String user_id;
	private Date post_date;
	private String post_type;
	
}
