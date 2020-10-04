show databases;

show tables;
select * from member;

create table member(
id int not null auto_increment,
name varchar(20),
passwd varchar(20),
primary key(id)
)default charset=utf8;

insert into member(name,passwd) values('kim','1234');
insert into member(name,passwd) values('hong','1234');
insert into member(name,passwd) values('kang','1234');
insert into member(name,passwd) values('wang','1234');
insert into member(name,passwd) values('zang','1234');

select * from member;

select * from student;
select * from student limit 3;
select name,passwd from student;
select name,passwd from student where id=3;
select * from student order by name;/* 오름차순 정렬*/
select * from student order by name desc;/* 내림차순 정렬 */
select * from student order by name limit 3;/* 조회 결과 3개만 출력*/

/* update */
update student set name='admin' where name='hong';
select * from student;

/* delete */
delete from student where id=4;
select * from student;




