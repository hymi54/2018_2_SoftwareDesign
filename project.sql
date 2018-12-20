create table CUSTOMER (
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
	resNum number not null check (resNum > 999999999 AND resNum < 10000000000),
	primary key(resNum)
);

create table resMenu (
	menuNum number,
	resNum number not null check (resNum > 999999999 AND resNum < 10000000000),
	menuName varchar(25),
	menuPrice number,
	primary key(menuNum),
	foreign key(resNum) references Restaurant(resNum)
);

create table curSeat (
	resNum number not null check (resNum > 999999999 AND resNum < 10000000000),
	maxSeat number,
	curSeat number,
	primary key(resNum),
	foreign key(resNum) references Restaurant(resNum)
);

insert into customer values (1, 'hymi54', 'br0409', 'Bistro');
insert into customer values (2, 'aaaaa', 'aaaaa', 'aaaaa');

insert into restaurant values ('food1','food1','FoodCourt',1231212345);

insert into resMenu values (1, 1231212345, '³È³È', 5000);

insert into curSeat values (1231212345, 30, 5);

