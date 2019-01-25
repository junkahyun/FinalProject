show user;

select *
from member;

-- ROOMTYPE(숙소 유형)
comment on table ROOMTYPE
is '숙소 유형 테이블';

comment on column ROOMTYPE.ROOMTYPE_IDX
is '숙소 유형 인덱스 번호';

comment on column ROOMTYPE.ROOMTYPE_NAME
is '숙소 유형 명';

-- BUILDTYPE(건물유형)
comment on table BUILDTYPE
is '건물 유형 테이블';

comment on column BUILDTYPE.BUILDTYPE_IDX
is '건물 유형 인덱스 번호';

comment on column BUILDTYPE.BUILDTYPE
is '건물 유형 명';

-- BUILDTYPE_DETAIL(건물세부유형)
comment on table BUILDTYPE_DETAIL
is '건물 세부 유형 테이블';

comment on column BUILDTYPE_DETAIL.BUILDTYPE_DETAIL_IDX
is '건물 세부 유형 인덱스 번호';

comment on column BUILDTYPE_DETAIL.FK_BUILDTYPE_IDX
is '건물 유형 인덱스 번호(외래키)';

comment on column BUILDTYPE_DETAIL.BUILDTYPE_DETAIL
is '건물 세부 유형 명';

-- 신고 테이블(Report)
comment on table REPORT
is '신고 테이블';

comment on column REPORT.REPORT_IDX
is '신고 컬럼 인덱스 번호';

comment on column REPORT.FK_USERID
is '신고 글 작성자 아이디(외래키)';

comment on column REPORT.REPORTTYPE
is '신고 유형';

comment on column REPORT.REPORT_CONTENT
is '신고 내용';

comment on column REPORT.REPORT_DATE
is '신고 글 작성 날짜';

comment on column REPORT.REPORT_STATUS
is '신고 글 처리 상태';


ALTER TABLE REPORT RENAME COLUMN REPORT_WARNCOUNT TO REPORT_STATUS;
commit;

select *
from user_sequences;
select *
from user_tab_comments;



select *
from options;

desc room;

select *
from member;



desc mycoupon;

SELECT data_default
FROM user_tab_cols 
WHERE table_name = UPPER('mycoupon')  
AND column_name = UPPER('usedate');

ALTER TABLE mycoupon add (useDate date);
commit;
select *
from mycoupon;

desc mycoupon;



select ROOMCODE, FK_USERID, FK_ROOMTYPE_IDX, ROOMNAME, ROOMMAINIMG, ROOMTEL, ROOMPOST, ROOMSIGUNGU, ROOMSIDO, ROOMBNAME, ROOMPRICE, PEAKPER,
       CLEANPAY, BASIC_PERSON, MAX_PERSON, PERSON_ADDPAY, ROOMCOUNT, BATHCOUNT, CHECKINTIME, CHECKOUTTIME, LATITUDE, LONGITUDE, VIEWCOUNT,
       ROOMSTATUS, ROOM_WARNCOUNT, FK_BUILDTYPE_DETAIL_IDX, ROOMINFO            
from room
order by roomcode desc;


select *
from room;

select *
from reservation;

-- 메인페이지에서 추천 숙소 보여줄 7개 설정
select ROOMCODE, SCORE, ROOMMAINIMG, ROOMNAME, PROFILEIMG, ROOMPRICE, RNO 
from(
    select distinct(roomcode) AS ROOMCODE, avg((correct+communicate+clean+position+checkin+value)) AS SCORE, roomMainImg, roomname, C.profileImg as profileImg, roomprice, rownum as RNO
    from room A JOIN review B
    on A.roomcode = B.fk_roomcode
    join member C
    on B.fk_userid = C.userid 
    group by roomcode, (roomcode), roomcode, roomcode, roomcode, 
    roomcode, roomname, C.profileImg, roomprice, roomMainImg, 
    rownum
)V
where RNO between 1 and 7;

select *
from review;

select *
from room A join member B
on A.fk_userid = B.userid;

select ROWNUM, ROOMCODE, ROOMNAME, ROOMMAINIMG, ROOMPRICE, PROFILEIMG
	from(
		select ROOMCODE, FK_USERID, FK_ROOMTYPE_IDX, ROOMNAME, ROOMMAINIMG, ROOMTEL, ROOMPOST, ROOMSIGUNGU, ROOMSIDO, ROOMBNAME, ROOMPRICE, PEAKPER,
	       	   CLEANPAY, BASIC_PERSON, MAX_PERSON, PERSON_ADDPAY, ROOMCOUNT, BATHCOUNT, CHECKINTIME, CHECKOUTTIME, LATITUDE, LONGITUDE, VIEWCOUNT,
	           ROOMSTATUS, ROOM_WARNCOUNT, FK_BUILDTYPE_DETAIL_IDX, ROOMINFO, ROWNUM, PROFILEIMG         
		from room A JOIN member B
		on A.fk_userid = B.userid
	)V
	where ROWNUM between 1 and 7


insert into room(ROOMCODE, FK_USERID, fk_buildType_detail_idx, FK_ROOMTYPE_IDX, ROOMNAME, ROOMMAINIMG, ROOMTEL, ROOMINFO, ROOMPOST, 
                 ROOMSIGUNGU, ROOMSIDO, ROOMDETAILADDR, ROOMBNAME, ROOMPRICE, PEAKPER, CLEANPAY, BASIC_PERSON, MAX_PERSON, PERSON_ADDPAY, 
                 ROOMCOUNT, BATHCOUNT, CHECKINTIME,
                 CHECKOUTTIME, LATITUDE, LONGITUDE, VIEWCOUNT, ROOMSTATUS, ROOM_WARNCOUNT) 
values(ROOMCODE_seq.nextval,
       'leess', 3, 3, '작고 밝은 공간 昭小 (소소)',
       'https://a0.muscache.com/im/pictures/046b64d7-b014-43a4-8e0e-af8b1de82bad.jpg?aki_policy=xx_large',
       123456789,
       '작고 밝은 공간이라는 뜻의 昭小(소소) 입니다. 광주로 여행 오신 분들 뿐만 아니라 일상을 벗어나 혼자만의 시간을 갖고 싶으신 분들이 조용히 책도 보고 생각을 정리하며 편히 쉬었다 갈수 있는 공간이 되었으면 합니다. ', 48303,
       '광주', '광주광역시','광주광역시 서구', '농성2동', 300000,20,50000,4,6,20000,4,2,to_date('2019/01/20 13:00:00','yyyy/mm/dd hh24:mi:ss'),to_date('2019/01/30 13:00:00','yyyy/mm/dd hh24:mi:ss'),35.153572, 126.883984,default,default,default);
commit;

desc room;


select *
from reservation;


desc review;

select *
from review;
select *
from room;

select * from user_sequences;

insert into review(REVIEW_IDX, FK_ROOMCODE, FK_USERID, CORRECT, COMMUNICATE, CLEAN, POSITION, CHECKIN, VALUE, REVIEW_CONTENT, REVIEW_WRITEDATE)
values(REVIEW_IDX_SEQ.nextval, '23', 'leess', 1, 1, 2, 1,2, 1, '최악.....', to_date('2019-01-14', 'yyyy-mm-dd'));

commit;
select REVIEW_IDX_SEQ.nextval
from dual;



 select FK_USERID, REVIEW_CONTENT, REVIEW_WRITEDATE
 from review A JOIN room B
 on A.fk_roomcode = B.roomcode;
 
select RNO, FK_USERID, REVIEW_CONTENT, ROOMNAME, REVIEW_WRITEDATE, PROFILEIMG, rownum as RNO
from 
(select A.FK_USERID, REVIEW_CONTENT, ROOMNAME, REVIEW_WRITEDATE, PROFILEIMG
from review A JOIN room B
on A.fk_roomcode = B.roomcode
JOIN member C
on B.fk_userid = C.userid
order by viewcount desc
)V
where RNO between 1 and 2;

select *
from roomimg
where fk_roomcode = 10; 

commit;


