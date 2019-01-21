/* 내 테이블1 */
CREATE TABLE my_db.my_table1 (
	my_pk1 INTEGER NOT NULL, /* 내 기본 키 컬럼1 */
	my_pk2 INTEGER NOT NULL, /* 내 기본 키 컬럼2 */
	my_column1 VARCHAR(20) NOT NULL, /* 내 컬럼1 */
	my_column2 VARCHAR(20) /* 내 컬럼2 */
);

COMMENT ON TABLE my_db.my_table1 IS 'DDL 생성 예제 테이블입니다.';

COMMENT ON COLUMN my_db.my_table1.my_pk1 IS '내 기본 키 컬럼1';

COMMENT ON COLUMN my_db.my_table1.my_pk2 IS '내 기본 키 컬럼2';

COMMENT ON COLUMN my_db.my_table1.my_column1 IS '내 컬럼1';

COMMENT ON COLUMN my_db.my_table1.my_column2 IS '내 컬럼2';

CREATE UNIQUE INDEX my_db.my_table1_pk
	ON my_db.my_table1 (
		my_pk1 ASC,
		my_pk2 ASC
	);

CREATE UNIQUE INDEX my_db.my_table1_uq
	ON my_db.my_table1 (
		my_column1 ASC
	);

CREATE UNIQUE INDEX my_db.my_table1_uq_sys_gen
	ON my_db.my_table1 (
		my_column2 ASC
	);

ALTER TABLE my_db.my_table1
	ADD
		CONSTRAINT my_table1_pk
		PRIMARY KEY (
			my_pk1,
			my_pk2
		);

ALTER TABLE my_db.my_table1
	ADD
		CONSTRAINT my_table1_uq
		UNIQUE (
			my_column1
		);

ALTER TABLE my_db.my_table1
	ADD
		CONSTRAINT my_table1_uq_sys_gen
		UNIQUE (
			my_column2
		);

ALTER TABLE my_db.my_table1
	ADD
		CONSTRAINT my_table1_cc
		CHECK (my_pk1 > 1900 AND my_column2='Tomato System');

/* trigger1 */
CREATE TRIGGER trigger1
BEFORE
DELETE OR INSERT OR UPDATE
ON emp
 INSERT INTO example
VALUES (:new.cust.cust, :new.cust.address, :new.cust.credit);

/* 내 테이블2 */
CREATE TABLE my_db.my_table2 (
	my_pk1 INTEGER NOT NULL, /* 내 기본 키 컬럼1 */
	my_pk2 INTEGER NOT NULL, /* 내 기본 키 컬럼2 */
	my_column VARCHAR(20) NOT NULL /* 내 컬럼1 */
);

COMMENT ON TABLE my_db.my_table2 IS '내 테이블2';

COMMENT ON COLUMN my_db.my_table2.my_pk1 IS '내 기본 키 컬럼1';

COMMENT ON COLUMN my_db.my_table2.my_pk2 IS '내 기본 키 컬럼2';

COMMENT ON COLUMN my_db.my_table2.my_column IS '내 컬럼1';

CREATE UNIQUE INDEX my_db.my_table2_pk
	ON my_db.my_table2 (
		my_pk1 ASC,
		my_pk2 ASC
	);

CREATE INDEX my_db.my_table2_idx
	ON my_db.my_table2 (
		my_column ASC
	);

ALTER TABLE my_db.my_table2
	ADD
		CONSTRAINT my_table2_pk
		PRIMARY KEY (
			my_pk1,
			my_pk2
		);

ALTER TABLE my_db.my_table2
	ADD
		CONSTRAINT my_table2_fk
		FOREIGN KEY (
			my_pk1,
			my_pk2
		)
		REFERENCES my_db.my_table1 (
			my_pk1,
			my_pk2
		);

/* view1 */
CREATE VIEW view1 AS select * from example

COMMENT ON TABLE my_db.view1 IS 'Create view example';

/* function1 */
CREATE FUNCTION function1(acc_no IN NUMBER)
RETURN NUMBER
IS acc_bal NUMBER(11,2);
BEGIN
SELECT order_total
INTO acc_bal
FROM orders
WHERE customer_id = acc_no;
RETURN(acc_bal);
END;

/* procedure1 */
CREATE PROCEDURE procedure1
 AS
BEGIN
dbms_output.put_line('example');
END;

----------------------------------- 추가사항 ---------------------------------------------
-- buildtype 
insert into buildtype(buildtype_idx, buildtype)
values (buildtype_idx_seq.nextval, '아파트');

insert into buildtype(buildtype_idx, buildtype)
values (buildtype_idx_seq.nextval, '주택');

insert into buildtype(buildtype_idx, buildtype)
values (buildtype_idx_seq.nextval, '펜션');

insert into buildtype(buildtype_idx, buildtype)
values (buildtype_idx_seq.nextval, '호텔');

-- buildtype detail
insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 1,'아파트');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 1,'공동주택');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 2,'주택');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 2,'전원주택');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 2,'오두막');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 2,'저택');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 3,'게스트용 별채');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 3,'게스트용 스위트');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 3,'게스트용 농장체험숙박');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 4,'호텔');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 4,'호스텔');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 4,'리조트');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 4,'아파트호텔');

insert into buildtype_detail(buildtype_detail_idx, fk_buildtype_idx, buildtype)
values (buildtype_detail_idx_seq.nextval, 4,'산장');

-- roomtype
insert into roomtype(roomtype_idx, roomtype_name)
values (roomtype_idx_seq.nextval, '집 전체');

insert into roomtype(roomtype_idx, roomtype_name)
values (roomtype_idx_seq.nextval, '개인실');

insert into roomtype(roomtype_idx, roomtype_name)
values (roomtype_idx_seq.nextval, '다인실');


-- 옵션 insert
insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '필수품목', 'cleaning.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '무선인터넷', 'wifi.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '옷장/서랍장', 'closet.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, 'TV', 'television.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '난방', 'heater.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '에어컨', 'air-conditioner.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '조식,커피,차', 'breakfast.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '연기 감지기', 'smoke-detector.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '구급상자', 'first-aid-kit.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '세탁기', 'washing-machine.png');

insert into options(option_idx, optionName, optionIcon) 
values(option_idx_seq.nextval, '주차공간', 'parking.png');

-- 문의게시판 인덱스(추가)
create sequence qna_idx_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache; 

-- 보유옵션고유번호 인덱스
create sequence roomoption_idx_sep
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select buildtype
from buildtype;

select optionname
from options

select roomtype_name
from roomtype

select * from user_sequences

drop table rules purge
commit;

drop sequence rule_idx_seq purge

select *
from allrule;

create table allrule
(rule_idx number not null
,rule_name varchar2(40) not null
,rule_icon varchar2(300)
);

create sequence rule_idx_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache; 

create table roomrule
(roomrule_idx number not null
,fk_rule_idx number not null
,rulestatus number(1) default 0
,fk_roomcode varchar2(30) not null
,constraints FK_roomrule_rule_idx foreign key(fk_rule_idx) references allrule(rule_idx)
,constraints FK_roomrule_roomcode foreign key(fk_roomcode) references room(roomcode)
);

 

select A.sid, A.SERIAL#
from V$SESSION A, V$LOCK B, DBA_OBJECTS C
where A.SID = B.SID AND B.ID1 = C.OBJECT_ID AND B.TYPE='TM' AND C.OBJECT_NAME = 'room';



select *
from roomrule

insert into allrule (rule_idx, rule_name, rule_icon)
values (rule_idx_seq.nextval, '흡연가능', null);

insert into allrule (rule_idx, rule_name, rule_icon)
values (rule_idx_seq.nextval, '반려동물 입실가능', null);

insert into allrule (rule_idx, rule_name, rule_icon)
values (rule_idx_seq.nextval, '이벤트 및 행사가능', null);

commit;

-- 회원가입(테스트용)
insert into member(userid,profileimg,username,pwd,email ,phone ,post  ,addr,Detailddr,gender ,birthday,introduction,MemberStatus,warnCount,regDate)
values('leess',default,'이순신','qwer1234$','final.leess@gmail.com','01073132470',04540,'서울특별시 중구 남대문로','120 대일빌딩',1,'92/04/22','이순신 계정입니다. 일반회원 계정입니다. 테스트 계정입니다.',1,1,default);

insert into member(userid,profileimg,username,pwd,email ,phone ,post  ,addr,Detailddr,gender ,birthday,introduction,MemberStatus,warnCount,regDate)
values('hongkd',default,'홍길동','qwer1234$','final.leess@gmail.com','01040829302',04540,'서울특별시 중구 남대문로','120 대일빌딩',2,'92/02/14','홍길동 계정입니다. 호스트 계정입니다. 테스트 계정입니다.',1,0,default);

select *
from roomrule

select buildtype_detail_name
from buildtype A JOIN buildtype_detail B
on A.buildtype_idx = B.fk_buildtype_idx
where A.buildtype = '아파트';

select roomname, roommainimg, roomprice, roomtel, roomsigungu
     , basic_person, max_person, person_addpay, viewcount
from room
where roomsigungu like '%'||'제주'||'%' 

update room set checkouttime = '19/01/20'
commit;

select * from bed

select * from mycoupon

select *from room

select *from bedobj

select * from member;

select * from reservation

select * from user_sequences

insert into reservation(rsvcode, fk_roomcode, fk_userid, guestcount, babycount, rsv_name, rsv_phone, rsv_email, rsv_checkindate,
rsv_checkoutdate, rsv_msg, paydate, totalprice, dcprice, rsv_cancledate)
values(rsvcode_seq.nextval, '10', 'leess', 5, 1, '한석규', '01012345678', 'leess@gamil.com', '2019-01-20', '2019-01-25', 
'방 깨끗하게 청소 부탁드려요~', '2019-01-19', 300000, 30000, null);

insert into reservation(rsvcode, fk_roomcode, fk_userid, guestcount, babycount, rsv_name, rsv_phone, rsv_email, rsv_checkindate,
rsv_checkoutdate, rsv_msg, paydate, totalprice, dcprice, rsv_cancledate)
values(rsvcode_seq.nextval, '12', 'hongkd', 3, 0, '강감찬', '01078845124', 'kkc@gamil.com', '2019-02-05', '2019-02-15', 
'넓은 방으로 주세요~', '2019-01-31', 600000, 50000, null);

insert into reservation(rsvcode, fk_roomcode, fk_userid, guestcount, babycount, rsv_name, rsv_phone, rsv_email, rsv_checkindate,
rsv_checkoutdate, rsv_msg, paydate, totalprice, dcprice, rsv_cancledate)
values(rsvcode_seq.nextval, '10', 'leess', 5, 1, '이대호', '01035478956', 'leedh@gamil.com', '2019-01-18', '2019-01-19', 
'아침 맛있게 주세요', '2019-01-10', 150000, 10000, null);


alter table reservation modify(rsv_phone varchar2(200));

commit;

select * from roomrule

insert into room(ROOMCODE,FK_USERID,fk_buildType_detail_idx,FK_ROOMTYPE_IDX,ROOMNAME,ROOMMAINIMG,ROOMTEL,ROOMINFO,ROOMPOST,ROOMSIGUNGU,ROOMSIDO,ROOMBNAME,ROOMPRICE,PEAKPER,CLEANPAY,BASIC_PERSON,MAX_PERSON,PERSON_ADDPAY,ROOMCOUNT,BATHCOUNT,CHECKINTIME,CHECKOUTTIME,LATITUDE,LONGITUDE,VIEWCOUNT,ROOMSTATUS,ROOM_WARNCOUNT) 
values(ROOMCODE_seq.nextval,'hongkd',10,3,'바다가 한 눈에 보이는 럭셔리 호텔!!','https://image.goodchoice.kr/resize_490x348/adimg_new/10775/0/5835449794615.jpg',0519984565,
'어서오세요. KH호텔입니다. 
저희 호텔의 자랑은
1.광안리가 한 눈에 보이는 뷰 
2.럭셔리한 디자인
3.TV에도 나온 최고급 서비스
',48303,'부산시','경상남도 부산광역시','광안동',300000,20,50000,4,6,20000,4,2,to_date('2019/01/20 13:00:00','yyyy/mm/dd hh24:mi:ss'),to_date('2019/01/30 13:00:00','yyyy/mm/dd hh24:mi:ss'),35.1531696,129.11866599999996,default,default,default);

select * from options
commit;

delete options where option_idx = 5
rollback;
drop sequence option_idx_seq;

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '무선인터넷', 'wifi.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '옷장/서랍장', 'closet.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, 'TV', 'television.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '난방', 'heater.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '에어컨', 'air-conditioner.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '조식,커피,차', 'breakfast.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '연기감지기', 'somke-detector.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '구급상자', 'first-aid-kit.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '세탁기', 'washing-machine.png')

insert into options(option_idx, optionname, optionicon)
values(option_idx_seq.nextval, '주차공간', 'parking.png')

select roomname, roommainimg, roomprice, roomtel, roomsigungu
		     , basic_person, max_person, person_addpay, viewcount
		     , latitude, longitude
		from room
        
select *
from reservation     
where fk_userid = 'leess'

update reservation set rsv_name = '한석규'
where fk_userid = 'leess'
        
commit;

select *
from roomoption;

select *
from options

select *
from roomtype

select *
from room A JOIN roomoption B
on A.roomcode = B.fk_roomcode
JOIN options C
on B.fk_option_idx = c.option_idx