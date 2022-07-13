
CREATE TABLE t_book AS SELECT * FROM book;

SELECT * FROM t_book;

-- '축구의 역사'를 10000원으로 변경
UPDATE t_book SET price = 10000 WHERE bookid = 1;

-- 양궁의 실제의 출판사 이름을 나무수로 변경하시오
UPDATE t_book SET publisher = '나무수' WHERE bookid = 6;

-- '야구를 부탁해'의 출판사를 '삼성당'으로 변경하고 가격을 15000원으로 변경하세요
UPDATE t_book SET publisher = '삼성당', price = 15000 WHERE bookid = 8;

-- 도서번호가 5번인 책을 삭제하시오
DELETE FROM t_book WHERE bookid = 5;

-- 골프바이블 도서를 삭제하시오
DELETE FROM t_book WHERE bookname LIKE '골프 바이블';





ROLLBACK; --커밋하기전에 취소 가능

COMMIT;