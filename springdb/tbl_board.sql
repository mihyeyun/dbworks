
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

commit;

INSERT INTO tbl_users VALUES('test', 'test123', '������', 'Admin');
INSERT INTO tbl_users VALUES('user1', 'user123', '��׷�', 'User');
INSERT INTO tbl_board(bno, title, writer, content) VALUES (sqe.nextval, '�����λ�', '������', '�� ��Ź�帳�ϴ�.');