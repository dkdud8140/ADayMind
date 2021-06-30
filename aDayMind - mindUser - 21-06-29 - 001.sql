CREATE DATABASE aDayMind ;

USE aDayMind;

CREATE TABLE tbl_user (
	u_seq	BIGINT	auto_increment	PRIMARY KEY,
	u_prof	BIGINT	NOT NULL	,
	u_id	VARCHAR(125)	NOT NULL	UNIQUE,
	u_pw	VARCHAR(125)	NOT NULL	,
	u_nick	VARCHAR(125)	NOT NULL	UNIQUE,
	u_mail	VARCHAR(125)	NOT NULL	UNIQUE,
	u_warning	INT		
);

CREATE TABLE tbl_writing (
	wr_seq				BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wr_user				BIGINT	NOT NULL	,
	wr_content			VARCHAR(3000)	NOT NULL	,
	wr_like_count		INT		,
	wr_warning_count	INT		,
	wr_write_date		TIMESTAMP DEFAULT NOW(),
	wr_last_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `tbl_warning` (
	wa_seq		BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wa_writing	BIGINT	NOT NULL	,
	wa_user		BIGINT	NOT NULL	,
	wa_content	VARCHAR(3000)	NOT NULL	,
	wa_check	TINYINT(2)		,
	`wa_date`	TIMESTAMP DEFAULT NOW()
);

CREATE TABLE `tbl_like` (
	li_seq		BIGINT	AUTO_INCREMENT PRIMARY KEY,
	li_wr_seq	BIGINT	NOT NULL,
	li_fan		BIGINT	NOT NULL,
	li_date		TIMESTAMP DEFAULT NOW(),
	li_check	TINYINT(2)	
);

CREATE TABLE `tbl_userProf` (
	prof_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	prof_user	CHAR(6)	NOT NULL	,
	prof_url	VARCHAR(300)		
);

DROP TABLE tbl_user;
DROP TABLE tbl_userprof;
DROP TABLE tbl_warning;
DROP TABLE tbl_writing;
DROP TABLE tbl_like;


ALTER TABLE `tbl_user` ADD CONSTRAINT `FK_tbl_userProf_TO_tbl_user_1` FOREIGN KEY (
	`prof_seq`
)
REFERENCES `tbl_userProf` (
	`prof_seq`
);

ALTER TABLE `tbl_writing` ADD CONSTRAINT `FK_tbl_user_TO_tbl_writing_1` FOREIGN KEY (
	`wr_user`
)
REFERENCES `tbl_user` (
	`u_seq`
);

ALTER TABLE `tbl_warning` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_warning_1` FOREIGN KEY (
	`wa_writing`
)
REFERENCES `tbl_writing` (
	`wr_seq`
);

ALTER TABLE `tbl_warning` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_warning_2` FOREIGN KEY (
	`wa_user`
)
REFERENCES `tbl_writing` (
	`wr_user`
);

ALTER TABLE `tbl_like` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_like_1` FOREIGN KEY (
	`wr_seq`
)
REFERENCES `tbl_writing` (
	`wr_seq`
);

ALTER TABLE `tbl_like` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_like_2` FOREIGN KEY (
	`wr_user`
)
REFERENCES `tbl_writing` (
	`wr_user`
);


