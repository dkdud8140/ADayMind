package com.callor.mind.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WritingVO {

	private Long wr_seq;			// 글번호 정수형
	private Long wr_user;			// 유저번호 정수형
	
	private String wr_nick;			// 유저 닉네임
	
	private String wr_content;		// 글내용 가변문자열(3000)
	private int wr_like_count;		// 글공감 정수형
	private int wr_warning_count;	// 글신고 정수형
	
	private Date wr_write_date;	// 작성일자 TIMESTAMP
	private Date wr_last_date;	// 수정일자 TIMESTAMP
	private String wr_origin;		// 글 출처 한글가변문자열(50)

	public Date getWr_write_date() {
		return wr_write_date;
	}
	public void setWr_write_date(Date wr_write_date) {
		this.wr_write_date = wr_write_date;
	}
	public Date getWr_last_date() {
		return wr_last_date;
	}
	public void setWr_last_date(Date wr_last_date) {
		this.wr_last_date = wr_last_date;
	}
	
	
	
	public Long getWr_seq() {
		return wr_seq;
	}
	public void setWr_seq(Long wr_seq) {
		this.wr_seq = wr_seq;
	}
	public Long getWr_user() {
		return wr_user;
	}
	public void setWr_user(Long wr_user) {
		this.wr_user = wr_user;
	}
	public String getWr_nick() {
		return wr_nick;
	}
	public void setWr_nick(String wr_nick) {
		this.wr_nick = wr_nick;
	}
	public String getWr_content() {
		return wr_content;
	}
	public void setWr_content(String wr_content) {
		this.wr_content = wr_content;
	}
	public int getWr_like_count() {
		return wr_like_count;
	}
	public void setWr_like_count(int wr_like_count) {
		this.wr_like_count = wr_like_count;
	}
	public int getWr_warning_count() {
		return wr_warning_count;
	}
	public void setWr_warning_count(int wr_warning_count) {
		this.wr_warning_count = wr_warning_count;
	}
	
	public String getWr_origin() {
		return wr_origin;
	}
	public void setWr_origin(String wr_origin) {
		this.wr_origin = wr_origin;
	}

	
	
}
