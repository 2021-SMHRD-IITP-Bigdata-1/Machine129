package org.ml129.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TimeVO {
	
	public String user_id;
	public Date today_date;
	public String time_start;
	public String time_end;
	public int time_sum;
	public int week_num;
	

}
