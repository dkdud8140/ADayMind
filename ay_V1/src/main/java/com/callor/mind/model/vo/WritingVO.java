package com.callor.mind.model.vo;
import java.sql.Date;

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
public class WritingVO {

	private String wr_seq;			// 글번호 정수형
	private String wr_user;			// 유저번호 정수형
	
	private String wr_nick;			// 작성자
	
	private String wr_content;		// 글내용 가변문자열(3000)
	private int wr_like_count;		// 글공감 정수형
	private int wr_warning_count;	// 글신고 정수형
	
	private Date wr_write_date;	// 작성일자 TIMESTAMP
	private Date wr_last_date;	// 수정일자 TIMESTAMP
	private String wr_origin;		// 글 출처 한글가변문자열(50)

}
