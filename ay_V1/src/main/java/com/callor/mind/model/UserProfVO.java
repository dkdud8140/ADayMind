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
public class UserProfVO {

	private String prof_seq;		// 사진번호 정수형
	private String prof_user;	// 유저번호 고정문자열(6)
	private String prof_url;		// 사진URL 가변문자열(300)

}
