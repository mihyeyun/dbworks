
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

INSERT INTO tbl_users VALUES('test', 'test123', '������', 'Admin');
INSERT INTO tbl_users VALUES('user1', 'user123', '��׷�', 'User');
INSERT INTO tbl_board(bno, title, writer, content) VALUES (sqe.nextval, '�����λ�', '������', '�� ��Ź�帳�ϴ�.');

-- spring ������Ʈ ���
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
--�⺻Ű �������� ����
ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

-- bno�� �����Ǹ� ��ȣ�� �߰��� �����
-- ROWNUM ���� Į���� �ƴ����� ���� �����͸� ī��Ʈ�Ͽ� ������ش�

SELECT ROWNUM, bno, title, writer, content FROM tbl_board;

-- �ε���(INDEX)�� �����ϱ�
-- ��Ʈ�ֱ�
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ 
    ROWNUM, bno, title, writer, content 
FROM tbl_board;

-- 1������ ��������
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ 
    ROWNUM, bno, title, writer, content 
FROM tbl_board
WHERE ROWNUM <= 10;

-- 2������ ������ �� ����(0���� ũ�� �����ؾ߸� ������ �� ����)
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ 
    ROWNUM, bno, title, writer, content 
FROM tbl_board
WHERE ROWNUM > 10 AND ROWNUM <= 20;