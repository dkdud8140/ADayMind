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
public class LikeListVO {

	private String li_seq;			// 공감번호 정수형
	private String li_wr_seq;		// 글번호 정수형
	private String li_fan;			// 공감한유저 정수형
	private String li_date;			// 공감일자 TIMESTAMP
	private Boolean li_check;		// 공감여부 BOOLEAN

}
