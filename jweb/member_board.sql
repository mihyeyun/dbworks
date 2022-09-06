-- ȸ�� ���̺� ����

CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20)   NOT NULL,
    name        VARCHAR2(30)   NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE    DEFAULT SYSDATE
);

INSERT INTO t_member VALUES ('cloud', 'm12345', '������', '��', SYSDATE);
INSERT INTO t_board VALUES (b_seq.NEXTVAL, '�����Դϴ�.', '�� �����Դϴ�.', SYSDATE, 'mays');
SELECT * FROM t_member;
SELECT * FROM t_board;
DELETE FROM t_board WHERE bnum=63;
COMMIT;

CREATE TABLE t_board(
    bnum    NUMBER(4) PRIMARY KEY,
    title   VARCHAR2(100) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    memberId VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberId)
    REFERENCES t_member(memberId)
);

CREATE SEQUENCE b_seq;
DROP SEQUENCE b_seq;
DELETE FROM t_board;

-- ��Ʈ Į���߰�
ALTER TABLE t_board ADD hit NUMBER;
-- �ܷ�Ű ���� ���� ����
ALTER TABLE t_board DROP CONSTRAINT FK_MemberBoard;

ALTER TABLE t_board ADD CONSTRAINT FK_MemberBoard FOREIGN KEY (memberId)
REFERENCES t_member(memberId) ON DELETE CASCADE;



