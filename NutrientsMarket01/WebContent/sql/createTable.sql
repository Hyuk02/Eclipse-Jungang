/* DB명: NutrientsMarketDB*/
select * from member
drop table member
drop table product
drop table category
drop table brand
drop table delivery
drop table sale
select * from sale;

create table product(
p_id varchar(10) not null,
p_name varchar(20),
p_price int,
p_description text,
p_brand varchar(20), 
p_stock long,
p_category varchar(20), 
p_fileName varchar(20),
primary key(p_id) 
)default charset=utf8;

create table category(
seq int not null auto_increment,
categoryName varchar(20) not null,
description text,
primary key(seq) 
)default charset=utf8;

create table brand(
seq int not null auto_increment,
brandName varchar(20) not null,
description text,
primary key(seq) 
)default charset=utf8;

create table member(
id varchar(10) not null,
pw varchar(10) not null,
name varchar(10) not null,
birth varchar(10),
email varchar(30),
phone varchar(20),
postcode varchar(5),
address varchar(200),
detailAddress varchar(100),
extraAddress varchar(50),
regist_day varchar(50),
primary key(id)
)default charset=utf8;
drop table delivery;

create table delivery(
seq int not null auto_increment,
sessionId varchar(50) not null,
name varchar(10) not null,
phone varchar(20),
email varchar(30),
postcode varchar(5),
address varchar(200),
detailAddress varchar(100),
deliveryDate varchar(20),
requestMessage varchar(50),
primary key(seq)
)default charset=utf8;

create table sale(
seq int not null auto_increment,
sessionId  varchar(50),
saleDate varchar(20),
p_id varchar(10) not null,
p_price int,
saleQty int,
id varchar(10) not null,
status int,
primary key(seq)
)default charset=utf8;

create table board(
num int not null auto_increment,
id varchar(10) not null,
subject varchar(100) not null,
product varchar(20) not null,
content text not null,
fileName varchar(20),
write_day varchar(30),
hit int,
primary key(num)
)default charset=utf8;
