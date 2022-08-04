CREATE TABLE p_member(
    num NUMBER(5) PRIMARY KEY,
    memberid    VARCHAR2(20)   NOT NULL,
    passwd      VARCHAR2(20)   NOT NULL,
    name        VARCHAR2(30)   NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE    DEFAULT SYSDATE
);

INSERT INTO p_member VALUES ('1', 'cloud', 'm12345', 'À±¹ÌÇý', '¿©', SYSDATE);
SELECT * FROM p_member;
COMMIT;