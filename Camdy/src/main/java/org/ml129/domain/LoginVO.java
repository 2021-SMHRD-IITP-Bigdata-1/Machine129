package org.ml129.domain;



import lombok.AllArgsConstructor;
import lombok.Data;







@Data
@AllArgsConstructor
public class LoginVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nickname;
	private String user_birthdate;
	private String admin_yn;
	private String user_goal;

}
