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
 select ROOMCODE, SCORE, ROOMMAINIMG, ROOMNAME, 
from(
    select distinct(roomcode) AS ROOMCODE, avg((correct+communicate+clean+position+checkin+value)) AS SCORE, roomMainImg, roomname, C.profileImg as profileImg, roomprice, rownum as RNO
    from room A JOIN review B
    on A.roomcode = B.fk_roomcode
    join member C
    on B.fk_userid = C.userid 
    group by roomcode, (roomcode), roomcode, roomcode, roomcode, 
    roomcode, roomname, C.profileImg, roomprice, roomMainImg, 
    rownum;
)V





desc room;








