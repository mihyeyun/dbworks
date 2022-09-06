show user;

-- 테이블 생성
CREATE TABLE tam_member(
    userid VARCHAR2(50) PRIMARY KEY,
    username VARCHAR2(100) NOT NULL,
    userpw VARCHAR2(100) NOT NULL,
    email VARCHAR2(200),
    birth DATE,
    gender VARCHAR2(50)
);

select * from tam_member;
CREATE SEQUENCE seq;
DROP SEQUENCE seq;

INSERT INTO tam_member VALUES ('sky123', '윤미혜', '1234', 'naver@naver.com', '1995-12-30', '여');

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

alter table tam_board add CONSTRAINT pk_board PRIMARY KEY (bno);

insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '테스트제목', '테스트내용', 'may');
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '테스트제목', '테스트내용', 'babo');
commit;

select * from tam_board order by bno desc;