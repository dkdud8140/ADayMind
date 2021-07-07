package com.callor.mind.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserVO {

	private Long u_seq;		// 유저번호 고정문자열(6)
	private Long u_prof;		// 사진번호 정수형
	private String u_id;		// 유저ID 가변문자열(125)
	private String u_pw;		// 유저PASSWORD 가변문자열(125)
	private String u_nick;		// 유저닉네임 가변문자열(125)
	private String u_mail;		// 유저이메일 가변문자열(125)
	private int u_warning;		// 유저경고 정수형
	private int ban ; //		// 유저 밴 , 접근제한

}
