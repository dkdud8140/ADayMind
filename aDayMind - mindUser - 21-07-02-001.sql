USE aDayMind;


SELECT
	W.wr_content AS vl_content,
    W.wr_origin AS vl_origin,
    U.u_nick AS vl_user,
	L.li_date AS vl_like_date,
    W.wr_like_count AS vl_like_count
FROM tbl_like L
	LEFT JOIN tbl_writing W
		ON L.li_wr_seq = W.wr_seq
    LEFT JOIN tbl_user U
		ON W.wr_user = U.u_seq
        
WHERE L.li_fan = 4;


SELECT * from tbl_like;
SELECT * from tbl_writing;
SELECT * from tbl_user;

DROP TABlE tbl_like;

delete from tbl_like
WHERE 1=1;

SELECT * FROM tbl_writing;

SELECT 
			W.wr_seq AS vw_seq,
		    U.u_seq AS vw_user_seq,
			U.u_nick AS vw_nick,
			W.wr_content AS vw_content,
			W.wr_like_count AS vw_like_conunt,
			W.wr_warning_count AS vw_warning_conunt,
			W.wr_write_date AS vw_write_date,
			W.wr_last_date AS vw_last_date,
			W.wr_origin AS wv_origin
		FROM tbl_writing W
			LEFT JOIN tbl_user U
				ON W.wr_user = U.u_seq ;



