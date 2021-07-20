package com.callor.mind.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class UserVO {

	private Long u_seq;		//	BIGINT
	private Long u_prof;	//	BIGINT
	private String u_id;	//	VARCHAR(125)
	private String u_pw;	//	VARCHAR(125)
	private String u_nick;	//	VARCHAR(125)
	private String u_mail;	//	VARCHAR(125)
	private int u_warning;	//	INT
	private int u_level;
}
