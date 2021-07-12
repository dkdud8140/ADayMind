USE adaymind ;

DESC tbl_like;

SELECT * FROM tbl_like;
SELECT * FROM tbl_user;
SELECT * FROM tbl_writing;

INSERT INTO tbl_user
	(u_id, u_pw, u_nick, u_mail, u_level)
values('admin', '12345','admin','admin@admin.com',0);

UPDATE tbl_user
SET
	u_seq = 0,
    u_pw = 'admin'
WHERE u_seq = 9;

delete FROM tbl_like
WHERE li_fan = 9;

DELETE FROM tbl_like
WHERE li_wr_seq = 18 and li_fan = 6;

UPDATE tbl_writing
SET wr_like_count = wr_like_count +1
WHERE wr_seq =1 ;

UPDATE tbl_writing
SET wr_like_count = wr_like_count -1
WHERE wr_seq =1;

DESC tbl_user;
ALTER TABLE tbl_USER
ADD COLUMN u_level INT ;
