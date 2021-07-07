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
public class WarningVO {
	
	private Long wa_seq;			// 신고번호 정수형
	private Long wa_writing;		// 글번호 정수형
	private Long wa_user;			// 유저번호 정수형
	private String wa_content;		// 신고내용 가변문자열(3000)
	private int wa_check;			// 신고처리여부 BOOLEAN
	private Date wa_date;			// 신고일자 TIMESTAMP

}
