drop table customer cascade constraint;
drop table restaurant cascade constraint;
drop table resmenu cascade constraint;
drop table curseat cascade constraint;

create table Customer (
	Cnumber number not null,
	Cid VARCHAR(15) not null,
	passwd varchar(20) not null,
	nick varchar(20) not null,
	primary key(Cnumber)
);

create table Restaurant (
	Rid varchar(15) not null,
	passwd varchar(20) not null,
	resName varchar(100) not null,
	resNum varchar2(10) not null check (length(resNum) = 10),
	resType number not null check (resType < 6 and resType > 0),  -- 1,2,3,4,5 : ÇÑ,Áß,ÀÏ,¾ç,Ç»Àü
	primary key(resNum)
);

create table resMenu (
	menuNum number,
	resNum varchar2(10) not null check (length(resNum) = 10),
	menuName varchar(25),
	menuPrice number,
	primary key(menuNum),
	foreign key(resNum) references Restaurant(resNum)
);

create table curSeat (
	resNum varchar2(10) not null check (length(resNum) = 10),
	maxSeat number,
	curSeat number,
	primary key(resNum),
	foreign key(resNum) references Restaurant(resNum)
);

insert into customer values (1, 'hymi54', 'br0409', 'Bistro');

insert into restaurant values ('food1','food1','FoodCourt','1231212345', 5);
insert into restaurant values ('gonitable', 'gonitable', '°í´Ï½ÄÅ¹', '5042207661', 1);
insert into restaurant values ('sunghwa','sunghwa','¼ºÈ­½Ä´ç','9413588053',1);
insert into restaurant values ('jjammadam','jjammadam','Â«¸¶´ã','9440530534', 2);
insert into restaurant values ('myuntamjung','myuntamjung','¸éÅ½Á¤','2158386053',2);
insert into restaurant values ('masamasa','masamasa', '¸¶»ç','2476678053',3);
insert into restaurant values ('daimaru','daimaru','´ÙÀÌ¸¶·ç','9392233053',3);
insert into restaurant values ('moida','moida','¸ğÀÌ´Ù½ÄÅ¹','9391097053',4);
insert into restaurant values ('subchipole','subchipole','¼­ºêÄ¡Æú·¹','9421333053',4);

insert into resMenu values (1, '1231212345', 'µ·°¡½º', 5000);
insert into resmenu values (2, '1231212345', 'ºñºö¹ä', 6000);
insert into resmenu values (3, '5042207661', 'À¯ÀÚµÎ·çÄ¡±â', 6000);
insert into resmenu values (4, '9413588053', 'µÅÁö±¹¹ä', 7000);
insert into resmenu values (5, '9440530534', 'Â÷µ¹¹ÚÀÌÂ«»Í', 7900);
insert into resmenu values (6, '2158386053', 'ÇÎÅ©Â«»Í', 6500);
insert into resmenu values (7, '2476678053', '¸¶»ç¸ğµë', 10000);
insert into resmenu values (8, '9392233053', 'µ·ÄÚÃ÷¶ó¸à', 6500);
insert into resmenu values (9, '9391097053', 'º£ÀÌÄÁ»õ¿ìººÀ½¹ä', 6000);
insert into resmenu values (10, '9421333053', '»ï°ã»ìºê¸®¶Ç', 5500);
insert into resmenu values (11, '5042207661', 'µÅÁöÂî°³', 6000);
insert into resmenu values (12, '9413588053', 'Æ¯ ±¹¹ä', 8000);
insert into resmenu values (13, '9413588053', '¹Ì´Ï¼öÀ°', 12000);
insert into resmenu values (14, '9440530534', 'ÁßÈ­°í±â¹ä', 7900);
insert into resmenu values (15, '2158386053', '»¡°£Â«»Í', 5500);
insert into resmenu values (16, '2158386053', '¸¼ÀºÂ«»Í', 6000);
insert into resmenu values (17, '2476678053', '¿¬¾îÃÊ¹ä', 12000);
insert into resmenu values (18, '9392233053', '±Ôµ¿', 7000);
insert into resmenu values (19, '9392233053', '¼îÀ¯¶ó¸à', 6500);
insert into resmenu values (20, '9391097053', '¸ÅÄŞ°í±âµ¤¹ä', 6000);
insert into resmenu values (21, '9421333053', 'ÂüÄ¡ºê¸®¶Ç', 3500);
insert into resmenu values (22, '9421333053', 'ÄÅ¹ä', 3500);

insert into curSeat values ('1231212345', 30, 0);
insert into curSeat values ('5042207661', 40, 0);
insert into curSeat values ('9413588053', 40, 0);
insert into curSeat values ('9440530534', 0, 0);
insert into curSeat values ('2158386053', 0, 0);
insert into curSeat values ('2476678053', 0, 0);
insert into curSeat values ('9392233053', 0, 0);
insert into curSeat values ('9391097053', 0, 0);
insert into curSeat values ('9421333053', 0, 0);
