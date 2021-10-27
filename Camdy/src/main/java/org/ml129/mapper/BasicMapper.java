package org.ml129.mapper;

import java.sql.Date;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.ml129.domain.LoginVO;
import org.springframework.web.bind.annotation.RequestParam;

public interface BasicMapper {

	
	public LoginVO LoginCheck(@Param("user_id") String user_id, @Param("user_pw") String user_pw);
	
	public void Login(LoginVO vo);

	public void joinInsert(@Param("user_id") String user_id, @Param("user_pw") String user_pw, @Param("user_name") String user_name,@Param("user_nickname") String user_nickname,@Param("user_birthdate") String user_birthdate);

}

