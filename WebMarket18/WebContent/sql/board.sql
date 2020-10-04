/* board테이블 생성*/
create table board(
num int not null auto_increment,
id varchar(20) not null,
name varchar(20) not null,
subject varchar(100) not null,
content text not null,
regist_day varchar(30),
hit int,
ip varchar(30),
primary key(num)
)default charset=utf8;

/* 테이블 내용 조회*/
select * from board;
/* 테이블 구조확인*/
desc board;
/* 테이블 삭제 */
drop table board;

select count(*) from board;
/* 검색 조건에 따른 조회 */
select * from board where subject like '%길동%';
select count(*) from board where content like '%길동%';

select * from board order by num desc;
select * from board where content like '%길동%' order by num desc;
select * from board where subject like '%%';
/* 데이타 입력*/
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','제목1','내용1','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','제목길동2','내용길동2','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','제목3','내용3','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('im','임꺽정','제목꺽정4','내용4','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','제목5','내용길동5','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('iljimae','일지매','제목지매6','내용6','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','제목길동7','내용길동7','20200729',0,'127.0.0.1');

delete from member where name is null;
insert into member 
 (select 'hong','1234','홍길동',gender,birth,mail,phone,
        postcode,address,detailAddress,extraAddress,regist_day 
 from member where id='hwang');
 
insert into board(id,name,subject,content,regist_day,hit,ip) 
select id,name,subject,content,regist_day,hit,ip from board;
 
