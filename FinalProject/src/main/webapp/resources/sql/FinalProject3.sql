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
