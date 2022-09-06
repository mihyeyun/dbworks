use jspdb;
select * from user;
select * from user where uid=129;
-- '손흥민'을 '추신수'로 변경
update user set name='추신수' where uid=129;

desc user;
-- 필드(열) 추가
alter table user add phone varchar(20);
update user set phone='010-1234-5678' where uid=158;



use jspdb;
create table department(
	deptid int primary key,
	deptname varchar(20) not null,
    location varchar(20) not null
);
-- 부서 추가
insert into department values (10, '개발팀', '서울');
insert into department values (20, '디자인팀', '인천');

-- 사원 추가
insert into employee values (101, '한강', 27, 10);
insert into employee values (102, '백두산', 32, 20);

-- 부모테이블(참조테이블)에 부서코드가 없으므로 추가 안됨
insert into employee values (103, '홍길동', 42, 30);

select * from department;
select * from employee;

-- 삭제
delete from department where deptid=10;

create table employee(
	empid int primary key,
    empname varchar(30) not null,
    age int,
    deptid int,
    constraint fk_dept_emp foreign key(deptid) references department(deptid)
);
-- constraint 제약 조건 이름
-- on delete cascade (부모키를 삭제하면 자식키도 삭제됨)

show databases;
use jspdb;

select * from member;