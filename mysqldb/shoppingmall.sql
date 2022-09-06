show databases;
use jspdb;
show tables;

create table engineer(
	eid int not null auto_increment,
    name varchar(20) not null,
    passwd varchar(20) not null,
    primary key(eid)
);

insert into engineer values (1, 'Bill', 'm1234');
delete from engineer where eid=1;


create table product(
	p_id varchar(10) primary key,
    p_name varchar(20),
    p_unitPrice INTEGER,
    p_description TEXT,
    p_category varchar(20),
    p_manufacturer varchar(20),
    p_unitsInStock LONG,
    p_condition varchar(20),
    p_productImage varchar(20)
);
INSERT INTO product VALUES ('P1234', 'iPhone 6s', 800000, '4.7-inch 1334X750 Renia
     HD display 8-megapixel iSight Camera', 'Smart Phone', 'Apple', 1000, 'New', 'P1234.png');
COMMIT;

drop table product;

insert into product values ('P1234', 'iPhone 6s', 800000, '4.7-inch 1334X750 Renia HD display 8-magapixel iSight Camera', 'Smart Phone', 'Apple', 1000, 'new', 'P1234.png');

select * from member;

create table board(
	num int primary key auto_increment,
	name varchar(20) not null,
	subject varchar(100) not null,
	content text not null,
	write_date varchar(30),
	hit int,
	id varchar(10) not null,
	constraint fk_member_board foreign key(id) references member(id) on delete cascade
);