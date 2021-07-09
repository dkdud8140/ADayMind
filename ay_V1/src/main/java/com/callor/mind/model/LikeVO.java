package com.callor.mind.model;

import java.util.Date;

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
public class LikeVO {

	private Long li_seq;			// 공감번호 정수형
	private Long li_wr_seq;		// 글번호 정수형
	private Long li_fan;			// 공감한유저 정수형
	private Date li_date;			// 공감일자 TIMESTAMP

}
