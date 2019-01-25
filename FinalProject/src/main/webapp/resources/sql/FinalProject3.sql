select rnum, mycp_idx,fk_cpcode,cpname,cpexpire,dcmoney,fk_userid,usedate
    from
    (    
    select rownum AS rnum, mycp_idx,fk_cpcode,cpname,cpexpire,dcmoney,fk_userid,usedate
    from
        (
        select mycp_idx,fk_cpcode,cpname,cpexpire,dcmoney,fk_userid,nvl(to_char(usedate,'yyyy-mm-dd'),-9999) AS usedate
		from myCoupon A join coupon B
		on A.fk_cpcode = B.cpcode
		where fk_userid= 'leess'
        order by cpexpire
        )V
         where not usedate = '-9999'
    )F
     where rnum between 1 and 10;
-------------------------------------------------
	select count(*)
	from
	(
		select nvl(to_char(usedate,'yyyy-mm-dd'),-99) AS usedate
		from mycoupon
		where fk_userid = 'leess'
	)
	where not usedate = '-99';