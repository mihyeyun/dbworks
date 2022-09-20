show user;

-- ���̺� ����
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

INSERT INTO tam_member (userid, username, userpw, email, birth, gender, adminCk) VALUES ('admin', 'admin', 'admin', 'naver@naver.com', '1995-12-30', '��', 1);
UPDATE tam_member SET adminCk = 1 where userid = '';
INSERT INTO tam_member VALUES ('sky123', '1234', '������', 'naver@naver.com', '1995-12-30', '��', 0);
INSERT INTO tam_member VALUES ('test123', '������', '1234', 'naver@naver.com', '1995-12-30', '��', 0);
UPDATE tam_member SET adminCk = 1 where userid = '';
exec dbms_xdb.sethttpport(9090);

CREATE SEQUENCE seq_board;
-- ���� ����
CREATE TABLE tam_board(
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate date default sysdate,
    updatedate date default sysdate
);

drop table tam_board;
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '�Խ���', '����', 'may');
INSERT INTO tam_board (bno, title, content, writer)
SELECT seq.NEXTVAL, title, content, writer
FROM tam_board;

alter table tam_board add CONSTRAINT pk_board PRIMARY KEY (bno);

insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '�׽�Ʈ����', '�׽�Ʈ����', 'may');
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '�׽�Ʈ����', '�׽�Ʈ����', 'babo');
commit;

select * from tam_board order by bno desc;


? �⺻Ű �������� ����

ALTER TABLE tam_member ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

? 1������ ��������
SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM, bno, title, writer, content
FROM tam_board;    

? ��������
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
-- ���� ����
CREATE TABLE tam_board(
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate date default sysdate,
    updatedate date default sysdate
);

-- ���� ������  
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, '�Խ���', '����', 'may');
insert into tam_board (bno, title, content, writer) values (seq_board.nextval, 'sql����', '��Ŀ�� ����', 'sky');

--��� ���� 
INSERT INTO tam_board (bno, title, content, writer)
SELECT seq_board.NEXTVAL, title, content, writer
FROM tam_board;



alter table tam_board add CONSTRAINT pk_board PRIMARY KEY (bno);


commit;

select * from tam_board order by bno desc;

? �⺻Ű �������� ����
ALTER TABLE tam_member ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

? 1������ ��������
SELECT /*+ INDEX_DESC(tam_member pk_board) */
    ROWNUM, bno, title, writer, content
FROM tam_board;    

? ��������
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


? ȸ���� ����
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
��
INSERT INTO tam_member VALUES ('sky123', 'ȫ����', '1234', 'test@naver.com', '1993-10-24', '����');
