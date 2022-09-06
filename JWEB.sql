-- 비지니스 컴포넌트(BoardWeb) board 테이블
CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);
-- 자동 번호
CREATE SEQUENCE sqe;

-- users 테이블 생성
CREATE TABLE users(
    id VARCHAR2(8) PRIMARY KEY,
    passwd VARCHAR2(8) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    role VARCHAR2(5)
);

-- 회원 추가
INSERT INTO users VALUES('test', 'test123', '관리자', 'Admin');
INSERT INTO users VALUES('user1', 'user123', '장그래', 'User');

SELECT * FROM users;


-- 게시글 추가
INSERT INTO board(bno, title, writer, content) VALUES (sqe.nextval, '가입인사', '관리자', '잘 부탁드립니다.');

SELECT * FROM board;
DELETE FROM board WHERE bno = 45;

commit;