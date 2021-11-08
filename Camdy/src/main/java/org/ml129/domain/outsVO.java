package org.ml129.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class outsVO {
	public String user_id;
	public Date today_date;
	public String out_start;
	public String out_end;
	public int out_sum;
	public int out_seq;
	public int week_num;

}
