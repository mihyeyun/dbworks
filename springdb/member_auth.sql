
-- SpringBoard2 회원 테이블 생성
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

-- 외부 조인 : member의 회원정보와 권한 정보를 출력
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


create table tbl_reply(
    rno number(5),
    bno number(5) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replydate date default sysdate,
    updatedate date default sysdate
);

create sequence seq_reply;
alter table tbl_reply add CONSTRAINT pk_reply primary key(rno);
alter table tbl_reply add CONSTRAINT fk_reply_board
FOREIGN key(bno) REFERENCES tbl_board(bno);

insert into tbl_reply(rno, bno, reply, replyer) values (seq_reply.NEXTVAL, 71, '태풍이 오네요', 'admin');