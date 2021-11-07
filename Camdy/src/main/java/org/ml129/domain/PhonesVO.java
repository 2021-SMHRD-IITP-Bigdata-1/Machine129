package org.ml129.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhonesVO {
	public String user_id;
	public Date today_date;
	public String phone_start;
	public String phone_end;
	public int phone_sum;
	public int phone_seq;
}
