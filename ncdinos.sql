drop table FanItemVO; -- 테이블 제거
create table tbl_fanitem (
	seq number(8) primary key,
	title varchar2(100) not null,
	price number(8) not null,
	newitem number(8),
	soldout number(8),
	filename varchar2(100)
	);
	
create sequence fanitem_seq; 

select * from TBL_FANITEM where seq=5;

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '조구만 브라키오 인형 머리띠', 19000, 1, 0, '1.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval,' 2025년 일반 달력', 13000, 0, 0, '2.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval,'조구만 브라키오 봉제 키링', 19000, 0, 0, '3.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, 'ADLV GARMENT BAG - CAPTAIN EDITION ', 159000, 0, 0, '4.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '최우석 쫌 부채', 2000, 0, 0, '5.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '전루건 쫌 부채', 2000, 0, 0, '6.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '신용석 쫌 부채', 2000, 0, 0, '7.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '목지훈 쫌 부채', 2000, 0, 0, '8.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '&#39;승리요정 슈야토야&#39; 토야 키링', 16000, 0, 0, '9.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '&#39;승리요정 슈야토야&#39; 슈야 키링', 16000, 0, 0, '10.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '&#39;승리요정 슈야토야&#39; 토야 인형', 27000, 0, 0, '11.jpg');

insert into tbl_fanitem (seq,title,price,newitem,soldout,filename)
values(fanitem_seq.nextval, '&#39;승리요정 슈야토야&#39; 슈야 인형', 27000, 0, 0, '12.jpg');