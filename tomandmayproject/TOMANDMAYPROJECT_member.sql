show user;

-- 테이블 생성
CREATE TABLE tam_member(
    userid VARCHAR2(50) primary key,
    username VARCHAR2(100) NOT NULL,
    userpw VARCHAR2(100) NOT NULL,
    email VARCHAR2(200),
    birth VARCHAR2(50),
    gender VARCHAR2(50),
    adminCk NUMBER NOT NULL
);
drop table tam_member;

select username, email, birth, gender from tam_member where userid = 'may12345' and userpw = '1234';
select * from tam_member;

CREATE SEQUENCE seq;
DROP SEQUENCE seq_board;
DROP SEQUENCE seq;

INSERT INTO tam_member (userid, username, userpw, email, birth, gender, adminCk) VALUES ('admin', 'admin', 'admin', 'naver@naver.com', '1995-12-30', '여', 1);
UPDATE tam_member SET adminCk = 1 where userid = '';
INSERT INTO tam_member VALUES ('sky123', '1234', '윤미혜', 'naver@naver.com', '1995-12-30', '여', 0);
INSERT INTO tam_member VALUES ('test123', '윤미혜', '1234', 'naver@naver.com', '1995-12-30', '여', 0);
UPDATE tam_member SET adminCk = 1 where userid = '';
exec dbms_xdb.sethttpport(9090);

CREATE SEQUENCE seq_board;
-- 보드 생성
CREATE TABLE tam_board(
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate date default sysdate,
    updatedate date default sysdate
);

drop table tam_board;
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '게시판', '성공', 'may');
INSERT INTO tam_board (bno, title, content, writer)
SELECT seq.NEXTVAL, title, content, writer
FROM tam_board;

alter table tam_board add CONSTRAINT pk_board PRIMARY KEY (bno);

insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '테스트제목', '테스트내용', 'may');
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '테스트제목', '테스트내용', 'babo');
commit;

select * from tam_board order by bno desc;


? 기본키 제약조건 설정

ALTER TABLE tam_member ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

? 1페이지 가져오기
SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM, bno, title, writer, content
FROM tam_board;    

? 서브쿼리
SELECT * FROM
(
    SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM rn, bno, title, writer, content
    FROM tam_board
    WHERE ROWNUM <= 20
)
WHERE rn > 0;

?SQL
SELECT * FROM
(
    SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM rn, bno, title, writer, content, regdate, updatedate
    FROM tam_board
    WHERE ROWNUM <= (2 * 10)
)
WHERE rn > (2 - 1) * 10;

-----------------------------------------------------------------------------

CREATE USER board IDENTIFIED BY board;

GRANT CONNECT, dba to board;


show user;
create SEQUENCE seq_board;
-- 보드 생성
CREATE TABLE tam_board(
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate date default sysdate,
    updatedate date default sysdate
);

-- 더미 데이터  
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '게시판', '성공', 'may');
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, 'sql연결', '도커로 성공', 'sky');

--재귀 복사 
INSERT INTO tam_board (bno, title, content, writer)
SELECT seq_board.NEXTVAL, title, content, writer
FROM tam_board;



alter table tam_board add CONSTRAINT pk_board PRIMARY KEY (bno);


commit;

select * from tam_board order by bno desc;

? 기본키 제약조건 설정
ALTER TABLE tam_member ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

? 1페이지 가져오기
SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM, bno, title, writer, content
FROM tam_board;    

? 서브쿼리
SELECT * FROM
(
    SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM rn, bno, title, writer, content
    FROM tam_board
    WHERE ROWNUM <= 20
)
WHERE rn > 0;

?SQL
SELECT * FROM
(
    SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM rn, bno, title, writer, content, regdate, updatedate
    FROM tam_board
    WHERE ROWNUM <= (2 * 10)
)
WHERE rn > (2 - 1) * 10;


? 회원가 생성
CREATE TABLE tam_member(
    userid VARCHAR2(50) PRIMARY KEY,
    username VARCHAR2(100) NOT NULL,
    userpw VARCHAR2(100) NOT NULL,
    email VARCHAR2(200),
    birth DATE,
    gender VARCHAR2(50)
);

CREATE TABLE tam_member(
    userid VARCHAR2(50) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    userpw VARCHAR2(100) NOT NULL,
    email VARCHAR2(200),
    birth VARCHAR2(50),
    gender VARCHAR2(50),
    adminCk NUMBER NOT NULL
);




select * from tam_member;
CREATE SEQUENCE seq;

DROP SEQUENCE seq;
남
INSERT INTO tam_member VALUES ('sky123', '홍성훈', '1234', 'test@naver.com', '1993-10-24', '남자');
