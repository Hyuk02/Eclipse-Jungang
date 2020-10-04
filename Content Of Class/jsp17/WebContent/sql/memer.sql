/* 회원 테이블 */
create table if not exists member(
id varchar(20) not null,
passwd varchar(20),
name varchar(30),
primary key (id)
)default charset=utf8;
/* 데이타 입력*/
insert into member values('1','1234','홍길동');
insert into member values('2','1234','일지매');

/* 데이타 조회*/
select * from member order by id desc;

select id,name,passwd from member;