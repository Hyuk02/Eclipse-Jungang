insert into product values('P1234','홍삼정 에브리타임', 96000,'일상에 활력을 더하는 한 포','정관장',100,'홍삼','홍삼1.PNG');
insert into product values('P1235','홍삼으로 에너지타임 스틱', 80000,'에너지를 위한 하루 한 포','김정환홍삼',100,'홍삼','홍삼2.PNG');
insert into product values('P1236','사과나무아래 달콤홍삼', 17900,'첨가물없이 좋은재료(사과,홍삼)로 먹기 편하게 만든 어린이 홍삼음료','김정환홍삼',50,'홍삼','홍삼3.PNG');
insert into product values('P1237','원스데일리 멀티비타민 3종', 22890,'기능성분 21가지, 보조성분 54가지! 하루 한번 풍부한 멀티비타민','Alive',200,'비타민','비타민1.PNG');

drop table product ;
drop table sale;
drop table delivery

insert into brand(brandName,description) values('Alive','Global brand');
insert into brand(brandName,description) values('ChildLife','Our brand is for kids');
insert into brand(brandName,description) values('정관장','healthy things');
insert into brand(brandName,description) values('김정환홍삼','healthy things');

insert into category(categoryName,description) values('비타민','뼈를 튼튼하게 하는 영양소');
insert into category(categoryName,description) values('홍삼','몸에 좋은 홍삼');
insert into category(categoryName,description) values('마그네슘','손상 부위를 크게 줄이고 부정맥을 방지');

insert into board(id,subject,product,content,fileName,write_day,hit)
	values('hong','좋아요','원스데일리 멀티비타민 3종','좋아요','비타민1.PNG','2020/08/01(15:30:30)',0);
insert into board(id,subject,product,content,fileName,write_day,hit)
	values('kim','강추강추','사과나무아래 달콤홍삼','아이가 맛있게 먹어요','홍삼3.PNG','2020/08/03(09:00:21)',0);
insert into board(id,subject,product,content,fileName,write_day,hit)
	values('lee','세번째구입','홍삼정 에브리타임','여기가 제일싸요','홍삼1.PNG','2020/08/04(10:42:23)',0);
	
select * from delivery
select * from category
select * from member;
select * from brand;
select * from product;
select * from board;
delete from brand where seq=6;
delete from product where p_id='P1238';
drop table board;
delete from board where num=10 and id='happy77';