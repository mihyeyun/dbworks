
SHOW USER;

CREATE TABLE tbl_board(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);

CREATE TABLE tbl_users(
    id VARCHAR2(8) PRIMARY KEY,
    passwd VARCHAR2(8) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    role VARCHAR2(5)
);

CREATE SEQUENCE sqe;
SELECT * FROM tbl_board;
SELECT * FROM tbl_users;

drop table tbl_board;

commit;

INSERT INTO tbl_users VALUES('test', 'test123', '관리자', 'Admin');
INSERT INTO tbl_users VALUES('user1', 'user123', '장그래', 'User');
INSERT INTO tbl_board(bno, title, writer, content) VALUES (sqe.nextval, '가입인사', '관리자', '잘 부탁드립니다.');

-- spring 프로젝트 사용
CREATE TABLE tbl_board(
    bno NUMBER(5),
    title VARCHAR2(200) NOT NULL,
    writer VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);

alter table tbl_board add replycnt number default 0;

update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);
--기본키 제약조건 설정
ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

-- bno는 삭제되면 번호가 중간에 비워짐
-- ROWNUM 실제 칼럼은 아니지만 실제 데이터를 카운트하여 출력해준다

SELECT ROWNUM, bno, title, writer, content FROM tbl_board;

-- 인덱스(INDEX)로 정렬하기
-- 힌트주기
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ 
    ROWNUM, bno, title, writer, content 
FROM tbl_board;

-- 1페이지 가져오기
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ 
    ROWNUM, bno, title, writer, content 
FROM tbl_board
WHERE ROWNUM <= 10;

-- 2페이지 가져올 수 없음(0보다 크게 시작해야만 가져올 수 있음)
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ 
    ROWNUM, bno, title, writer, content 
FROM tbl_board
WHERE ROWNUM > 10 AND ROWNUM <= 20;