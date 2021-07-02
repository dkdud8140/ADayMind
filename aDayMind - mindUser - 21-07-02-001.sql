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

