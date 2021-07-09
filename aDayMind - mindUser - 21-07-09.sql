USE adaymind ;

DESC tbl_like;

SELECT * FROM tbl_like;
SELECT * FROM tbl_user;
SELECT * FROM tbl_writing;

DELETE FROM tbl_like
WHERE li_wr_seq = 18 and li_fan = 6;

UPDATE tbl_writing
SET wr_like_count = wr_like_count +1
WHERE wr_seq =1 ;

UPDATE tbl_writing
SET wr_like_count = wr_like_count -1
WHERE wr_seq =1;

ALTER table tbl_user
