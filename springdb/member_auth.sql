
-- SpringBoard2 ȸ�� ���̺� ����
CREATE TABLE tbl_member(
    userid VARCHAR2(50) PRIMARY KEY,
    userpw VARCHAR2(100) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    enabled CHAR(1) DEFAULT '1'
);

select * from tbl_member_auth;
select * from tbl_member;

CREATE TABLE tbl_member_auth(
    auth VARCHAR2(50) NOT NULL,
    userid VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY (userid)
    REFERENCES tbl_member(userid) ON DELETE CASCADE
);

DELETE FROM tbl_member_auth WHERE userid = 'test';
DELETE FROM tbl_member WHERE userid = 'test';

-- �ܺ� ���� : member�� ȸ�������� ���� ������ ���
SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth
FROM tbl_member mem
     LEFT OUTER JOIN tbl_member_auth auth
     ON mem.userid = auth.userid
WHERE mem.userid = 'member82';

commit;
select * from tbl_member;
select * from tbl_member_auth;

drop table tbl_member_auth;
drop table tbl_member;